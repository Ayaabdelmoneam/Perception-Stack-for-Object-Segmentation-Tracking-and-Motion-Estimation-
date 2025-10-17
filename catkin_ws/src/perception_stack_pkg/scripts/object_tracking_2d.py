#!/usr/bin/env python3

import rospy
import cv2
import torch
import numpy as np
import atexit
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
from ultralytics import YOLO
from deep_sort_realtime.deepsort_tracker import DeepSort
from perception_stack_pkg.msg import BoundingBox, DetectionList , TrackedObject , TrackedObjectsList


# Initialize DeepSORT tracker
tracker = DeepSort(
    max_age=30,
    n_init=3,
    nms_max_overlap=1.0,
    max_cosine_distance=0.4,
    embedder="mobilenet", 
    half=True,
    bgr=True
)

video_writer = None


semantic_seg_dict = {}
cam_stream_dict = {}
bridge = CvBridge()


def image_callback(image_msg):
    global cam_stream_dict
    global bridge
    frame = bridge.imgmsg_to_cv2(image_msg , desired_encoding="bgr8")
    msg_header = image_msg.header
    frame_id = int(msg_header.frame_id)
    cam_stream_dict[frame_id] = frame
   
def tracking_callback(DetectionList_msg):
        
        global video_writer
        global semantic_seg_dict
        global cam_stream_dict


        if video_writer is None:
                # Get the dimensions of the first frame
                (height, width, _) = cam_stream_dict[sorted(cam_stream_dict.keys())[0]].shape
                video_writer = cv2.VideoWriter(
                    '/home/aya/output.mp4',  
                    cv2.VideoWriter_fourcc(*'mp4v'),  
                    15, 
                    (width, height)  
                )
                atexit.register(video_writer.release)  


           
        msg_header = DetectionList_msg.header
        frame_id = int(msg_header.frame_id)
        semantic_seg_dict[frame_id] = DetectionList_msg.detections
        detections = []


        if len(semantic_seg_dict) ==0 or len(cam_stream_dict) ==0:
                rospy.loginfo("waiting for data")
                return
        
        semantic_seg_ids = sorted(list(semantic_seg_dict.keys()))
        last_Frame_id = semantic_seg_ids[-1]
        print("segmented_frame_ids",semantic_seg_ids)
        cam_stream_ids = sorted(list(cam_stream_dict.keys()))
        if last_Frame_id in cam_stream_ids:
            corr_2d_object_list = semantic_seg_dict[last_Frame_id]
            corr_frame = cam_stream_dict[last_Frame_id]

            for object2d in corr_2d_object_list:
                x1 = object2d.x1
                x2 = object2d.x2
                y1 = object2d.y1
                y2 = object2d.y2
                conf = object2d.confidence
                class_name = object2d.class_name
                # Convert LTRB to TLWH for DeepSORT
                x = x1
                y = y1
                w = x2 - x1
                h = y2 - y1
                if(conf <0.5):
                    continue
                detections.append(([x, y, w, h], conf, class_name))


        # Update DeepSORT
        tracks = tracker.update_tracks(detections, frame=corr_frame)
        TrackedObjects_List = TrackedObjectsList()
        # Draw tracked objects
        for track in tracks:
            if not track.is_confirmed():
                continue
            track_id = track.track_id

            x1, y1, x2, y2 = map(int, track.to_ltrb())
            class_name = track.get_det_class()
            ObjectsID_msg = TrackedObject()
            ObjectsID_msg.x1 = x1
            ObjectsID_msg.y1 = y1
            ObjectsID_msg.x2 = x2
            ObjectsID_msg.y2 = y2
            ObjectsID_msg.id = int(track_id)
            ObjectsID_msg.class_name = class_name
            TrackedObjects_List.TrackedObjectsList.append(ObjectsID_msg)
            

            cv2.rectangle(corr_frame, (x1, y1), (x2, y2), (0, 255, 0), 2)
            cv2.putText(corr_frame, f'ID {track_id}: {class_name}', (x1, y1 - 10),
                        cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 0, 255), 2)
            
        video_writer.write(corr_frame)
        rospy.loginfo(f"Tracked {len(tracks)} objects")
        object_tracking_publisher.publish(TrackedObjects_List)
        cv2.imshow(" DeepSORT Tracking", corr_frame)
        cv2.waitKey(1)



# Close OpenCV windows on exit
atexit.register(cv2.destroyAllWindows)

if __name__ == "__main__":
    rospy.init_node("object_tracker_node")
    object_tracking_publisher = rospy.Publisher("/object_tracking", TrackedObjectsList, queue_size=1000)
    rospy.Subscriber("/cam_stream", Image, image_callback)
    rospy.Subscriber("/semantic_segmentation", DetectionList, tracking_callback)
    rospy.loginfo("Object Tracker Node Started!")
    rospy.spin()
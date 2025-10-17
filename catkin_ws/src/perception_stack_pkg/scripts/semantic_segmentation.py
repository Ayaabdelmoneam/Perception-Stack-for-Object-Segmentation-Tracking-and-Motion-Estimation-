#!/usr/bin/env python3

import rospy
import cv2
import torch
import numpy as np
import atexit
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
from ultralytics import YOLO
from perception_stack_pkg.msg import BoundingBox, DetectionList

# Initialize CvBridge for converting ROS <-> OpenCV images
bridge = CvBridge()

# Load YOLOv8 model
detection_model = YOLO('yolov8n-seg.pt')

video_writer = None

def detection_callback(image_msg):
        
        global video_writer
        image_msg_header = image_msg.header
        msg_timestamp = image_msg_header.stamp
        msg_frame_id = image_msg_header.frame_id

        # Convert ROS Image to OpenCV format
        frame = bridge.imgmsg_to_cv2(image_msg, desired_encoding="bgr8")


        if video_writer is None:
                # Get the dimensions of the first frame
                (height, width, _) = frame.shape
                video_writer = cv2.VideoWriter(
                    '/home/aya/output.mp4',  
                    cv2.VideoWriter_fourcc(*'mp4v'),  
                    15, 
                    (width, height)  
                )
                atexit.register(video_writer.release)  


        # Perform detection
        results = detection_model(frame)[0]

        # Prepare detections for DeepSORT
        detections_list_msg = DetectionList()
        detections_list_msg.header = image_msg_header

        
    # Draw segmentation masks if available
        if hasattr(results, "masks") and results.masks is not None:
            masks = results.masks.data.cpu().numpy()  # shape: (num_objects, H, W)
            for mask in masks:
                # Resize mask to match frame size
                mask_resized = cv2.resize(mask.astype(np.uint8), (frame.shape[1], frame.shape[0]), interpolation=cv2.INTER_NEAREST)
                colored_mask = np.zeros_like(frame, dtype=np.uint8)
                colored_mask[mask_resized.astype(bool)] = [0, 0, 255]  # Red mask, change color as needed
                frame = cv2.addWeighted(frame, 1.0, colored_mask, 0.5, 0)
        

        for box in results.boxes:

            x1, y1, x2, y2 = map(int, box.xyxy[0]) 
            conf = float(box.conf[0])
            class_id = int(box.cls[0])
            class_name = detection_model.names[class_id]
            bbox = BoundingBox()
            bbox.x1 = x1
            bbox.y1 = y1
            bbox.x2 = x2
            bbox.y2 = y2
            bbox.confidence = conf
            bbox.class_name = class_name
            detections_list_msg.detections.append(bbox)
            cv2.rectangle(frame,(x1,y1),(x2,y2),(0,255,0),2)
            cv2.putText(frame , f'{class_name}: {conf:.2f}' , (x1,y1-10), cv2.FONT_HERSHEY_SIMPLEX,0.5,(255,0,0),2)
        semantic_segmentation_publisher.publish(detections_list_msg)
        cv2.imshow("2D Detections" , frame)
        cv2.waitKey(1)


# Close OpenCV windows on exit
atexit.register(cv2.destroyAllWindows)

if __name__ == "__main__":
    semantic_segmentation_publisher = rospy.Publisher("/semantic_segmentation", DetectionList, queue_size=1000)
    rospy.init_node("semantic_segmentation_node")
    rospy.Subscriber("/cam_stream", Image, detection_callback)
    rospy.loginfo("semantic segmentation Node Started!")
    rospy.spin()
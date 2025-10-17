#!/usr/bin/env python3
import rospy
import cv2
from sensor_msgs.msg import Image
from cv_bridge import CvBridge

def cam_stream():
    rospy.init_node("cam_streamer")
    pub = rospy.Publisher("/cam_stream",Image, queue_size=1000)
    bridge = CvBridge()

    cap = cv2.VideoCapture("/home/aya/catkin_ws/src/perception_stack_pkg/scripts/kitti_video.avi")
    if not cap.isOpened():
        rospy.logerr("Failed")
        return

    frame_id=0
    rate = rospy.Rate(1)

    while not rospy.is_shutdown():
        ret, frame = cap.read()

        if not ret :
             rospy.logerr("Video is Finished")
             break

        ros_image = bridge.cv2_to_imgmsg(frame, encoding="bgr8")
        ros_image.header.stamp = rospy.Time.now()
        ros_image.header.frame_id = str(frame_id)
        frame_id=frame_id+1
        pub.publish(ros_image)
        rospy.loginfo(f"Published frame {frame_id}")
        rate.sleep()
    cap.release()

if __name__ == "__main__":
    try:
       cam_stream()
    except rospy.ROSInterruptException:
       pass
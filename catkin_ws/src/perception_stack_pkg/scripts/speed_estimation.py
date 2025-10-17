#!/usr/bin/env python3
import rospy
import numpy as np
import cv2
from cv_bridge import CvBridge
from sensor_msgs.msg import Image
from perception_stack_pkg.msg import FlowFrame  # Custom message for flow field

class FrameSpeedEstimationNode:
    def __init__(self):
        rospy.init_node('frame_speed_estimation_node')
        
        # Parameters
        self.fps = rospy.get_param('~fps', 30.0)
        self.scale_factor = rospy.get_param('~scale_factor', 0.1)  # pixels/meter
        
        # OpenCV objects
        self.bridge = CvBridge()
        self.prev_gray = None
        self.prev_timestamp = None
        
        # Publisher for flow field
        self.flow_pub = rospy.Publisher('optical_flow_field', FlowFrame, queue_size=1000)
        
        # Subscribe to camera frames
        self.image_sub = rospy.Subscriber('/cam_stream', Image, self.image_callback)
        
        rospy.loginfo("Frame speed estimation node initialized")
    
    def image_callback(self, msg):
        try:
            # Convert ROS Image to OpenCV image
            current_frame = self.bridge.imgmsg_to_cv2(msg, "bgr8")
            current_gray = cv2.cvtColor(current_frame, cv2.COLOR_BGR2GRAY)
            current_timestamp = msg.header.stamp
            
            # Skip if this is the first frame
            if self.prev_gray is None:
                self.prev_gray = current_gray
                self.prev_timestamp = current_timestamp
                return
            
            # Calculate optical flow using Farneback method (dense optical flow)
            flow = cv2.calcOpticalFlowFarneback(
                self.prev_gray, current_gray, 
                None, 0.5, 3, 15, 3, 5, 1.2, 0
            )
            
            # Calculate time difference
            dt = (current_timestamp - self.prev_timestamp).to_sec()
            if dt <= 0:
                rospy.logwarn("Invalid time difference")
                return
            
            # Create and publish flow field message
            flow_msg = FlowFrame()
            flow_msg.header = msg.header
            flow_msg.height = flow.shape[0]
            flow_msg.width = flow.shape[1]
            flow_msg.flow_x = flow[:,:,0].flatten().tolist()  # x component of flow
            flow_msg.flow_y = flow[:,:,1].flatten().tolist()  # y component of flow
            flow_msg.dt = dt
            flow_msg.scale_factor = self.scale_factor
            
            self.flow_pub.publish(flow_msg)
            
            # Update previous frame
            self.prev_gray = current_gray
            self.prev_timestamp = current_timestamp
            
        except Exception as e:
            rospy.logerr(f"Error processing image: {e}")
    
if __name__ == '__main__':
    try:
        node = FrameSpeedEstimationNode()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
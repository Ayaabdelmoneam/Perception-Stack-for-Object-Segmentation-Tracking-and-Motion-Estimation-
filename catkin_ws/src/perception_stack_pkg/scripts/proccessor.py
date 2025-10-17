#!/usr/bin/env python3
import rospy
import numpy as np
from perception_stack_pkg.msg import TrackedObject, TrackedObjectsList
from perception_stack_pkg.msg import DetectionList
from perception_stack_pkg.msg import FlowFrame, ProcessedTrackedObject, ProcessedTrackedObjectsList

class FusionNode:
    def __init__(self):
        rospy.init_node('perception_fusion_node')
        
        # Store latest data
        self.tracked_objects = None
        self.segmentation = None
        self.flow_field = None
        
        # Publishers
        self.fusion_pub = rospy.Publisher('perceived_objects', ProcessedTrackedObjectsList, queue_size=1000)
        
        # Subscribers
        self.track_sub = rospy.Subscriber('/object_tracking', TrackedObjectsList, self.tracking_callback)
        self.seg_sub = rospy.Subscriber('/semantic_segmentation', DetectionList, self.segmentation_callback)
        self.flow_sub = rospy.Subscriber('optical_flow_field', FlowFrame, self.flow_callback)
        
        # Set up timer for fusion publication
        self.timer = rospy.Timer(rospy.Duration(0.1), self.fusion_callback)  # 10Hz
        
        rospy.loginfo("Fusion node initialized")
    
    def tracking_callback(self, msg):
        self.tracked_objects = msg
    
    def segmentation_callback(self, msg):
        self.segmentation = msg
    
    def flow_callback(self, msg):
        self.flow_field = msg
    
    def fusion_callback(self, event):
        # Check if we have all necessary data
        if not all([self.tracked_objects, self.segmentation, self.flow_field]):
            return
        
        # Create fused perception message
        perceived_objects = ProcessedTrackedObjectsList()
        perceived_objects.header = self.tracked_objects.header
        
        # Reshape flow fields for easier access
        flow_x = np.array(self.flow_field.flow_x).reshape(self.flow_field.height, self.flow_field.width)
        flow_y = np.array(self.flow_field.flow_y).reshape(self.flow_field.height, self.flow_field.width)
        
        # Process each tracked object
        for obj in self.tracked_objects.TrackedObjectsList:
            perceived_obj = ProcessedTrackedObject()
            perceived_obj.id = obj.id
            perceived_obj.class_name = obj.class_name

            
            # Calculate speed from optical flow within the bounding box
            x1, y1 = int(obj.x1), int(obj.y1)
            x2, y2 = int(obj.x2), int(obj.y2)
            
            # Ensure coordinates are within image bounds
            x1 = max(0, x1)
            y1 = max(0, y1)
            x2 = min(self.flow_field.width, x2)
            y2 = min(self.flow_field.height, y2)
            
            # Extract flow vectors within the bounding box
            bbox_flow_x = flow_x[y1:y2, x1:x2]
            bbox_flow_y = flow_y[y1:y2, x1:x2]
            
            # Calculate median flow to be robust against outliers
            median_flow_x = np.median(bbox_flow_x)
            median_flow_y = np.median(bbox_flow_y)
            
            # Calculate displacement magnitude in pixels
            displacement_pixels = np.sqrt(median_flow_x**2 + median_flow_y**2)
            
            # Convert to real-world units
            displacement_meters = displacement_pixels / self.flow_field.scale_factor
            
            # Calculate speed (m/s)
            speed = displacement_meters / self.flow_field.dt
            if (speed==np.nan):
                continue
            perceived_obj.speed = float(speed)
            perceived_objects.ProcessedTrackedObjectList.append(perceived_obj)
        
        # Publish fused data
        self.fusion_pub.publish(perceived_objects)


if __name__ == '__main__':
    try:
        node = FusionNode()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
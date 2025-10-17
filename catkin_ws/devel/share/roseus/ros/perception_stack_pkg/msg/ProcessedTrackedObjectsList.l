;; Auto-generated. Do not edit!


(when (boundp 'perception_stack_pkg::ProcessedTrackedObjectsList)
  (if (not (find-package "PERCEPTION_STACK_PKG"))
    (make-package "PERCEPTION_STACK_PKG"))
  (shadow 'ProcessedTrackedObjectsList (find-package "PERCEPTION_STACK_PKG")))
(unless (find-package "PERCEPTION_STACK_PKG::PROCESSEDTRACKEDOBJECTSLIST")
  (make-package "PERCEPTION_STACK_PKG::PROCESSEDTRACKEDOBJECTSLIST"))

(in-package "ROS")
;;//! \htmlinclude ProcessedTrackedObjectsList.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass perception_stack_pkg::ProcessedTrackedObjectsList
  :super ros::object
  :slots (_header _ProcessedTrackedObjectList ))

(defmethod perception_stack_pkg::ProcessedTrackedObjectsList
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:ProcessedTrackedObjectList __ProcessedTrackedObjectList) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _ProcessedTrackedObjectList __ProcessedTrackedObjectList)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:ProcessedTrackedObjectList
   (&rest __ProcessedTrackedObjectList)
   (if (keywordp (car __ProcessedTrackedObjectList))
       (send* _ProcessedTrackedObjectList __ProcessedTrackedObjectList)
     (progn
       (if __ProcessedTrackedObjectList (setq _ProcessedTrackedObjectList (car __ProcessedTrackedObjectList)))
       _ProcessedTrackedObjectList)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; perception_stack_pkg/ProcessedTrackedObject[] _ProcessedTrackedObjectList
    (apply #'+ (send-all _ProcessedTrackedObjectList :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; perception_stack_pkg/ProcessedTrackedObject[] _ProcessedTrackedObjectList
     (write-long (length _ProcessedTrackedObjectList) s)
     (dolist (elem _ProcessedTrackedObjectList)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; perception_stack_pkg/ProcessedTrackedObject[] _ProcessedTrackedObjectList
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ProcessedTrackedObjectList (let (r) (dotimes (i n) (push (instance perception_stack_pkg::ProcessedTrackedObject :init) r)) r))
     (dolist (elem- _ProcessedTrackedObjectList)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get perception_stack_pkg::ProcessedTrackedObjectsList :md5sum-) "2c69238cbf3173dcaafbf881b5430573")
(setf (get perception_stack_pkg::ProcessedTrackedObjectsList :datatype-) "perception_stack_pkg/ProcessedTrackedObjectsList")
(setf (get perception_stack_pkg::ProcessedTrackedObjectsList :definition-)
      "Header header
ProcessedTrackedObject[] ProcessedTrackedObjectList
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: perception_stack_pkg/ProcessedTrackedObject
int32 id
string class_name
float32 speed
")



(provide :perception_stack_pkg/ProcessedTrackedObjectsList "2c69238cbf3173dcaafbf881b5430573")



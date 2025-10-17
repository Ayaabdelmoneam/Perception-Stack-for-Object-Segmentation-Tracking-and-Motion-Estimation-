;; Auto-generated. Do not edit!


(when (boundp 'perception_stack_pkg::TrackedObjectsList)
  (if (not (find-package "PERCEPTION_STACK_PKG"))
    (make-package "PERCEPTION_STACK_PKG"))
  (shadow 'TrackedObjectsList (find-package "PERCEPTION_STACK_PKG")))
(unless (find-package "PERCEPTION_STACK_PKG::TRACKEDOBJECTSLIST")
  (make-package "PERCEPTION_STACK_PKG::TRACKEDOBJECTSLIST"))

(in-package "ROS")
;;//! \htmlinclude TrackedObjectsList.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass perception_stack_pkg::TrackedObjectsList
  :super ros::object
  :slots (_header _TrackedObjectsList ))

(defmethod perception_stack_pkg::TrackedObjectsList
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:TrackedObjectsList __TrackedObjectsList) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _TrackedObjectsList __TrackedObjectsList)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:TrackedObjectsList
   (&rest __TrackedObjectsList)
   (if (keywordp (car __TrackedObjectsList))
       (send* _TrackedObjectsList __TrackedObjectsList)
     (progn
       (if __TrackedObjectsList (setq _TrackedObjectsList (car __TrackedObjectsList)))
       _TrackedObjectsList)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; perception_stack_pkg/TrackedObject[] _TrackedObjectsList
    (apply #'+ (send-all _TrackedObjectsList :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; perception_stack_pkg/TrackedObject[] _TrackedObjectsList
     (write-long (length _TrackedObjectsList) s)
     (dolist (elem _TrackedObjectsList)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; perception_stack_pkg/TrackedObject[] _TrackedObjectsList
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _TrackedObjectsList (let (r) (dotimes (i n) (push (instance perception_stack_pkg::TrackedObject :init) r)) r))
     (dolist (elem- _TrackedObjectsList)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get perception_stack_pkg::TrackedObjectsList :md5sum-) "811a223971dc616dee3b895ed3cdb809")
(setf (get perception_stack_pkg::TrackedObjectsList :datatype-) "perception_stack_pkg/TrackedObjectsList")
(setf (get perception_stack_pkg::TrackedObjectsList :definition-)
      "Header header
TrackedObject[] TrackedObjectsList
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
MSG: perception_stack_pkg/TrackedObject
int32 x1 
int32 y1
int32 x2
int32 y2
int32 id
string class_name

")



(provide :perception_stack_pkg/TrackedObjectsList "811a223971dc616dee3b895ed3cdb809")



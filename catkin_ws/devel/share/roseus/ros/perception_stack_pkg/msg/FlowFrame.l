;; Auto-generated. Do not edit!


(when (boundp 'perception_stack_pkg::FlowFrame)
  (if (not (find-package "PERCEPTION_STACK_PKG"))
    (make-package "PERCEPTION_STACK_PKG"))
  (shadow 'FlowFrame (find-package "PERCEPTION_STACK_PKG")))
(unless (find-package "PERCEPTION_STACK_PKG::FLOWFRAME")
  (make-package "PERCEPTION_STACK_PKG::FLOWFRAME"))

(in-package "ROS")
;;//! \htmlinclude FlowFrame.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass perception_stack_pkg::FlowFrame
  :super ros::object
  :slots (_header _height _width _flow_x _flow_y _dt _scale_factor ))

(defmethod perception_stack_pkg::FlowFrame
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:height __height) 0)
    ((:width __width) 0)
    ((:flow_x __flow_x) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:flow_y __flow_y) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:dt __dt) 0.0)
    ((:scale_factor __scale_factor) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _height (round __height))
   (setq _width (round __width))
   (setq _flow_x __flow_x)
   (setq _flow_y __flow_y)
   (setq _dt (float __dt))
   (setq _scale_factor (float __scale_factor))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:flow_x
   (&optional __flow_x)
   (if __flow_x (setq _flow_x __flow_x)) _flow_x)
  (:flow_y
   (&optional __flow_y)
   (if __flow_y (setq _flow_y __flow_y)) _flow_y)
  (:dt
   (&optional __dt)
   (if __dt (setq _dt __dt)) _dt)
  (:scale_factor
   (&optional __scale_factor)
   (if __scale_factor (setq _scale_factor __scale_factor)) _scale_factor)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint32 _height
    4
    ;; uint32 _width
    4
    ;; float32[] _flow_x
    (* 4    (length _flow_x)) 4
    ;; float32[] _flow_y
    (* 4    (length _flow_y)) 4
    ;; float32 _dt
    4
    ;; float32 _scale_factor
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint32 _height
       (write-long _height s)
     ;; uint32 _width
       (write-long _width s)
     ;; float32[] _flow_x
     (write-long (length _flow_x) s)
     (dotimes (i (length _flow_x))
       (sys::poke (elt _flow_x i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _flow_y
     (write-long (length _flow_y) s)
     (dotimes (i (length _flow_y))
       (sys::poke (elt _flow_y i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32 _dt
       (sys::poke _dt (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _scale_factor
       (sys::poke _scale_factor (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint32 _height
     (setq _height (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _width
     (setq _width (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32[] _flow_x
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _flow_x (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _flow_x i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _flow_y
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _flow_y (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _flow_y i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32 _dt
     (setq _dt (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _scale_factor
     (setq _scale_factor (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get perception_stack_pkg::FlowFrame :md5sum-) "d8640e6324462ca9b9afc0877d3fce48")
(setf (get perception_stack_pkg::FlowFrame :datatype-) "perception_stack_pkg/FlowFrame")
(setf (get perception_stack_pkg::FlowFrame :definition-)
      "Header header
uint32 height
uint32 width
float32[] flow_x  
float32[] flow_y  
float32 dt        
float32 scale_factor  
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

")



(provide :perception_stack_pkg/FlowFrame "d8640e6324462ca9b9afc0877d3fce48")



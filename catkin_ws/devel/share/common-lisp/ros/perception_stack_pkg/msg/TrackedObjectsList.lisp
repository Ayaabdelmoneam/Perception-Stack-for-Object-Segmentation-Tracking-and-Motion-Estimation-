; Auto-generated. Do not edit!


(cl:in-package perception_stack_pkg-msg)


;//! \htmlinclude TrackedObjectsList.msg.html

(cl:defclass <TrackedObjectsList> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (TrackedObjectsList
    :reader TrackedObjectsList
    :initarg :TrackedObjectsList
    :type (cl:vector perception_stack_pkg-msg:TrackedObject)
   :initform (cl:make-array 0 :element-type 'perception_stack_pkg-msg:TrackedObject :initial-element (cl:make-instance 'perception_stack_pkg-msg:TrackedObject))))
)

(cl:defclass TrackedObjectsList (<TrackedObjectsList>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrackedObjectsList>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrackedObjectsList)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name perception_stack_pkg-msg:<TrackedObjectsList> is deprecated: use perception_stack_pkg-msg:TrackedObjectsList instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <TrackedObjectsList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader perception_stack_pkg-msg:header-val is deprecated.  Use perception_stack_pkg-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'TrackedObjectsList-val :lambda-list '(m))
(cl:defmethod TrackedObjectsList-val ((m <TrackedObjectsList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader perception_stack_pkg-msg:TrackedObjectsList-val is deprecated.  Use perception_stack_pkg-msg:TrackedObjectsList instead.")
  (TrackedObjectsList m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrackedObjectsList>) ostream)
  "Serializes a message object of type '<TrackedObjectsList>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'TrackedObjectsList))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'TrackedObjectsList))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrackedObjectsList>) istream)
  "Deserializes a message object of type '<TrackedObjectsList>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'TrackedObjectsList) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'TrackedObjectsList)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'perception_stack_pkg-msg:TrackedObject))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrackedObjectsList>)))
  "Returns string type for a message object of type '<TrackedObjectsList>"
  "perception_stack_pkg/TrackedObjectsList")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrackedObjectsList)))
  "Returns string type for a message object of type 'TrackedObjectsList"
  "perception_stack_pkg/TrackedObjectsList")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrackedObjectsList>)))
  "Returns md5sum for a message object of type '<TrackedObjectsList>"
  "811a223971dc616dee3b895ed3cdb809")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrackedObjectsList)))
  "Returns md5sum for a message object of type 'TrackedObjectsList"
  "811a223971dc616dee3b895ed3cdb809")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrackedObjectsList>)))
  "Returns full string definition for message of type '<TrackedObjectsList>"
  (cl:format cl:nil "Header header~%TrackedObject[] TrackedObjectsList~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: perception_stack_pkg/TrackedObject~%int32 x1 ~%int32 y1~%int32 x2~%int32 y2~%int32 id~%string class_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrackedObjectsList)))
  "Returns full string definition for message of type 'TrackedObjectsList"
  (cl:format cl:nil "Header header~%TrackedObject[] TrackedObjectsList~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: perception_stack_pkg/TrackedObject~%int32 x1 ~%int32 y1~%int32 x2~%int32 y2~%int32 id~%string class_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrackedObjectsList>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'TrackedObjectsList) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrackedObjectsList>))
  "Converts a ROS message object to a list"
  (cl:list 'TrackedObjectsList
    (cl:cons ':header (header msg))
    (cl:cons ':TrackedObjectsList (TrackedObjectsList msg))
))

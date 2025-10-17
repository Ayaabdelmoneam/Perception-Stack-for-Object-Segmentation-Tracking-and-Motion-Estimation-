; Auto-generated. Do not edit!


(cl:in-package perception_stack_pkg-msg)


;//! \htmlinclude ProcessedTrackedObject.msg.html

(cl:defclass <ProcessedTrackedObject> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (class_name
    :reader class_name
    :initarg :class_name
    :type cl:string
    :initform "")
   (speed
    :reader speed
    :initarg :speed
    :type cl:float
    :initform 0.0))
)

(cl:defclass ProcessedTrackedObject (<ProcessedTrackedObject>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ProcessedTrackedObject>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ProcessedTrackedObject)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name perception_stack_pkg-msg:<ProcessedTrackedObject> is deprecated: use perception_stack_pkg-msg:ProcessedTrackedObject instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <ProcessedTrackedObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader perception_stack_pkg-msg:id-val is deprecated.  Use perception_stack_pkg-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'class_name-val :lambda-list '(m))
(cl:defmethod class_name-val ((m <ProcessedTrackedObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader perception_stack_pkg-msg:class_name-val is deprecated.  Use perception_stack_pkg-msg:class_name instead.")
  (class_name m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <ProcessedTrackedObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader perception_stack_pkg-msg:speed-val is deprecated.  Use perception_stack_pkg-msg:speed instead.")
  (speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ProcessedTrackedObject>) ostream)
  "Serializes a message object of type '<ProcessedTrackedObject>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'class_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'class_name))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ProcessedTrackedObject>) istream)
  "Deserializes a message object of type '<ProcessedTrackedObject>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'class_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'class_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ProcessedTrackedObject>)))
  "Returns string type for a message object of type '<ProcessedTrackedObject>"
  "perception_stack_pkg/ProcessedTrackedObject")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ProcessedTrackedObject)))
  "Returns string type for a message object of type 'ProcessedTrackedObject"
  "perception_stack_pkg/ProcessedTrackedObject")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ProcessedTrackedObject>)))
  "Returns md5sum for a message object of type '<ProcessedTrackedObject>"
  "f6cb3392170d89f5997df997b7d64b50")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ProcessedTrackedObject)))
  "Returns md5sum for a message object of type 'ProcessedTrackedObject"
  "f6cb3392170d89f5997df997b7d64b50")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ProcessedTrackedObject>)))
  "Returns full string definition for message of type '<ProcessedTrackedObject>"
  (cl:format cl:nil "int32 id~%string class_name~%float32 speed~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ProcessedTrackedObject)))
  "Returns full string definition for message of type 'ProcessedTrackedObject"
  (cl:format cl:nil "int32 id~%string class_name~%float32 speed~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ProcessedTrackedObject>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'class_name))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ProcessedTrackedObject>))
  "Converts a ROS message object to a list"
  (cl:list 'ProcessedTrackedObject
    (cl:cons ':id (id msg))
    (cl:cons ':class_name (class_name msg))
    (cl:cons ':speed (speed msg))
))

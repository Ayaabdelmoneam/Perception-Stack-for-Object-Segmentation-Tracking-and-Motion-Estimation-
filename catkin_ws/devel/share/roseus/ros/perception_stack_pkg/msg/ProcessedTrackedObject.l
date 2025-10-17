;; Auto-generated. Do not edit!


(when (boundp 'perception_stack_pkg::ProcessedTrackedObject)
  (if (not (find-package "PERCEPTION_STACK_PKG"))
    (make-package "PERCEPTION_STACK_PKG"))
  (shadow 'ProcessedTrackedObject (find-package "PERCEPTION_STACK_PKG")))
(unless (find-package "PERCEPTION_STACK_PKG::PROCESSEDTRACKEDOBJECT")
  (make-package "PERCEPTION_STACK_PKG::PROCESSEDTRACKEDOBJECT"))

(in-package "ROS")
;;//! \htmlinclude ProcessedTrackedObject.msg.html


(defclass perception_stack_pkg::ProcessedTrackedObject
  :super ros::object
  :slots (_id _class_name _speed ))

(defmethod perception_stack_pkg::ProcessedTrackedObject
  (:init
   (&key
    ((:id __id) 0)
    ((:class_name __class_name) "")
    ((:speed __speed) 0.0)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _class_name (string __class_name))
   (setq _speed (float __speed))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:class_name
   (&optional __class_name)
   (if __class_name (setq _class_name __class_name)) _class_name)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:serialization-length
   ()
   (+
    ;; int32 _id
    4
    ;; string _class_name
    4 (length _class_name)
    ;; float32 _speed
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _id
       (write-long _id s)
     ;; string _class_name
       (write-long (length _class_name) s) (princ _class_name s)
     ;; float32 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _class_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _class_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _speed
     (setq _speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get perception_stack_pkg::ProcessedTrackedObject :md5sum-) "f6cb3392170d89f5997df997b7d64b50")
(setf (get perception_stack_pkg::ProcessedTrackedObject :datatype-) "perception_stack_pkg/ProcessedTrackedObject")
(setf (get perception_stack_pkg::ProcessedTrackedObject :definition-)
      "int32 id
string class_name
float32 speed
")



(provide :perception_stack_pkg/ProcessedTrackedObject "f6cb3392170d89f5997df997b7d64b50")



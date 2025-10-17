
(cl:in-package :asdf)

(defsystem "perception_stack_pkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "BoundingBox" :depends-on ("_package_BoundingBox"))
    (:file "_package_BoundingBox" :depends-on ("_package"))
    (:file "DetectionList" :depends-on ("_package_DetectionList"))
    (:file "_package_DetectionList" :depends-on ("_package"))
    (:file "FlowFrame" :depends-on ("_package_FlowFrame"))
    (:file "_package_FlowFrame" :depends-on ("_package"))
    (:file "ProcessedTrackedObject" :depends-on ("_package_ProcessedTrackedObject"))
    (:file "_package_ProcessedTrackedObject" :depends-on ("_package"))
    (:file "ProcessedTrackedObjectsList" :depends-on ("_package_ProcessedTrackedObjectsList"))
    (:file "_package_ProcessedTrackedObjectsList" :depends-on ("_package"))
    (:file "TrackedObject" :depends-on ("_package_TrackedObject"))
    (:file "_package_TrackedObject" :depends-on ("_package"))
    (:file "TrackedObjectsList" :depends-on ("_package_TrackedObjectsList"))
    (:file "_package_TrackedObjectsList" :depends-on ("_package"))
  ))
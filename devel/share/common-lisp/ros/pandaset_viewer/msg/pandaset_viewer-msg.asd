
(cl:in-package :asdf)

(defsystem "pandaset_viewer-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "LidarPoint" :depends-on ("_package_LidarPoint"))
    (:file "_package_LidarPoint" :depends-on ("_package"))
    (:file "PointSet" :depends-on ("_package_PointSet"))
    (:file "_package_PointSet" :depends-on ("_package"))
  ))
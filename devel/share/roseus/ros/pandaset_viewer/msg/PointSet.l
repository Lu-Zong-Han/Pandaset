;; Auto-generated. Do not edit!


(when (boundp 'pandaset_viewer::PointSet)
  (if (not (find-package "PANDASET_VIEWER"))
    (make-package "PANDASET_VIEWER"))
  (shadow 'PointSet (find-package "PANDASET_VIEWER")))
(unless (find-package "PANDASET_VIEWER::POINTSET")
  (make-package "PANDASET_VIEWER::POINTSET"))

(in-package "ROS")
;;//! \htmlinclude PointSet.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass pandaset_viewer::PointSet
  :super ros::object
  :slots (_header _point ))

(defmethod pandaset_viewer::PointSet
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:point __point) (let (r) (dotimes (i 0) (push (instance pandaset_viewer::LidarPoint :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _point __point)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:point
   (&rest __point)
   (if (keywordp (car __point))
       (send* _point __point)
     (progn
       (if __point (setq _point (car __point)))
       _point)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; pandaset_viewer/LidarPoint[] _point
    (apply #'+ (send-all _point :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; pandaset_viewer/LidarPoint[] _point
     (write-long (length _point) s)
     (dolist (elem _point)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; pandaset_viewer/LidarPoint[] _point
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _point (let (r) (dotimes (i n) (push (instance pandaset_viewer::LidarPoint :init) r)) r))
     (dolist (elem- _point)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get pandaset_viewer::PointSet :md5sum-) "1679945ed2af83f1230099c1fce22a9c")
(setf (get pandaset_viewer::PointSet :datatype-) "pandaset_viewer/PointSet")
(setf (get pandaset_viewer::PointSet :definition-)
      "Header header
LidarPoint[] point

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
MSG: pandaset_viewer/LidarPoint
float32 x
float32 y
float32 z
float32 i
int64 semseg

")



(provide :pandaset_viewer/PointSet "1679945ed2af83f1230099c1fce22a9c")



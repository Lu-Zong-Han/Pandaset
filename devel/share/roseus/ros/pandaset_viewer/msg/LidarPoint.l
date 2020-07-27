;; Auto-generated. Do not edit!


(when (boundp 'pandaset_viewer::LidarPoint)
  (if (not (find-package "PANDASET_VIEWER"))
    (make-package "PANDASET_VIEWER"))
  (shadow 'LidarPoint (find-package "PANDASET_VIEWER")))
(unless (find-package "PANDASET_VIEWER::LIDARPOINT")
  (make-package "PANDASET_VIEWER::LIDARPOINT"))

(in-package "ROS")
;;//! \htmlinclude LidarPoint.msg.html


(defclass pandaset_viewer::LidarPoint
  :super ros::object
  :slots (_x _y _z _i _semseg ))

(defmethod pandaset_viewer::LidarPoint
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:i __i) 0.0)
    ((:semseg __semseg) 0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _i (float __i))
   (setq _semseg (round __semseg))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:i
   (&optional __i)
   (if __i (setq _i __i)) _i)
  (:semseg
   (&optional __semseg)
   (if __semseg (setq _semseg __semseg)) _semseg)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _z
    4
    ;; float32 _i
    4
    ;; int64 _semseg
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _z
       (sys::poke _z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _i
       (sys::poke _i (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int64 _semseg
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _semseg (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _semseg) (= (length (_semseg . bv)) 2)) ;; bignum
              (write-long (ash (elt (_semseg . bv) 0) 0) s)
              (write-long (ash (elt (_semseg . bv) 1) -1) s))
             ((and (class _semseg) (= (length (_semseg . bv)) 1)) ;; big1
              (write-long (elt (_semseg . bv) 0) s)
              (write-long (if (>= _semseg 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _semseg s)(write-long (if (>= _semseg 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _z
     (setq _z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _i
     (setq _i (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int64 _semseg
#+(or :alpha :irix6 :x86_64)
      (setf _semseg (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _semseg (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get pandaset_viewer::LidarPoint :md5sum-) "3fc9d8d88b9e8c37f2570312bc537312")
(setf (get pandaset_viewer::LidarPoint :datatype-) "pandaset_viewer/LidarPoint")
(setf (get pandaset_viewer::LidarPoint :definition-)
      "float32 x
float32 y
float32 z
float32 i
int64 semseg

")



(provide :pandaset_viewer/LidarPoint "3fc9d8d88b9e8c37f2570312bc537312")



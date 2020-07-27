; Auto-generated. Do not edit!


(cl:in-package pandaset_viewer-msg)


;//! \htmlinclude LidarPoint.msg.html

(cl:defclass <LidarPoint> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (z
    :reader z
    :initarg :z
    :type cl:float
    :initform 0.0)
   (i
    :reader i
    :initarg :i
    :type cl:float
    :initform 0.0)
   (semseg
    :reader semseg
    :initarg :semseg
    :type cl:integer
    :initform 0))
)

(cl:defclass LidarPoint (<LidarPoint>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LidarPoint>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LidarPoint)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pandaset_viewer-msg:<LidarPoint> is deprecated: use pandaset_viewer-msg:LidarPoint instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <LidarPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pandaset_viewer-msg:x-val is deprecated.  Use pandaset_viewer-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <LidarPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pandaset_viewer-msg:y-val is deprecated.  Use pandaset_viewer-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <LidarPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pandaset_viewer-msg:z-val is deprecated.  Use pandaset_viewer-msg:z instead.")
  (z m))

(cl:ensure-generic-function 'i-val :lambda-list '(m))
(cl:defmethod i-val ((m <LidarPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pandaset_viewer-msg:i-val is deprecated.  Use pandaset_viewer-msg:i instead.")
  (i m))

(cl:ensure-generic-function 'semseg-val :lambda-list '(m))
(cl:defmethod semseg-val ((m <LidarPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pandaset_viewer-msg:semseg-val is deprecated.  Use pandaset_viewer-msg:semseg instead.")
  (semseg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LidarPoint>) ostream)
  "Serializes a message object of type '<LidarPoint>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'i))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'semseg)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LidarPoint>) istream)
  "Deserializes a message object of type '<LidarPoint>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'i) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'semseg) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LidarPoint>)))
  "Returns string type for a message object of type '<LidarPoint>"
  "pandaset_viewer/LidarPoint")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LidarPoint)))
  "Returns string type for a message object of type 'LidarPoint"
  "pandaset_viewer/LidarPoint")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LidarPoint>)))
  "Returns md5sum for a message object of type '<LidarPoint>"
  "3fc9d8d88b9e8c37f2570312bc537312")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LidarPoint)))
  "Returns md5sum for a message object of type 'LidarPoint"
  "3fc9d8d88b9e8c37f2570312bc537312")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LidarPoint>)))
  "Returns full string definition for message of type '<LidarPoint>"
  (cl:format cl:nil "float32 x~%float32 y~%float32 z~%float32 i~%int64 semseg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LidarPoint)))
  "Returns full string definition for message of type 'LidarPoint"
  (cl:format cl:nil "float32 x~%float32 y~%float32 z~%float32 i~%int64 semseg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LidarPoint>))
  (cl:+ 0
     4
     4
     4
     4
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LidarPoint>))
  "Converts a ROS message object to a list"
  (cl:list 'LidarPoint
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
    (cl:cons ':i (i msg))
    (cl:cons ':semseg (semseg msg))
))

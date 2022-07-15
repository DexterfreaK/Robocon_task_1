;; Auto-generated. Do not edit!


(when (boundp 'robo::lidar)
  (if (not (find-package "ROBO"))
    (make-package "ROBO"))
  (shadow 'lidar (find-package "ROBO")))
(unless (find-package "ROBO::LIDAR")
  (make-package "ROBO::LIDAR"))
(unless (find-package "ROBO::LIDARREQUEST")
  (make-package "ROBO::LIDARREQUEST"))
(unless (find-package "ROBO::LIDARRESPONSE")
  (make-package "ROBO::LIDARRESPONSE"))

(in-package "ROS")





(defclass robo::lidarRequest
  :super ros::object
  :slots (_centerX _centerY ))

(defmethod robo::lidarRequest
  (:init
   (&key
    ((:centerX __centerX) 0)
    ((:centerY __centerY) 0)
    )
   (send-super :init)
   (setq _centerX (round __centerX))
   (setq _centerY (round __centerY))
   self)
  (:centerX
   (&optional __centerX)
   (if __centerX (setq _centerX __centerX)) _centerX)
  (:centerY
   (&optional __centerY)
   (if __centerY (setq _centerY __centerY)) _centerY)
  (:serialization-length
   ()
   (+
    ;; int64 _centerX
    8
    ;; int64 _centerY
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _centerX
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _centerX (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _centerX) (= (length (_centerX . bv)) 2)) ;; bignum
              (write-long (ash (elt (_centerX . bv) 0) 0) s)
              (write-long (ash (elt (_centerX . bv) 1) -1) s))
             ((and (class _centerX) (= (length (_centerX . bv)) 1)) ;; big1
              (write-long (elt (_centerX . bv) 0) s)
              (write-long (if (>= _centerX 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _centerX s)(write-long (if (>= _centerX 0) 0 #xffffffff) s)))
     ;; int64 _centerY
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _centerY (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _centerY) (= (length (_centerY . bv)) 2)) ;; bignum
              (write-long (ash (elt (_centerY . bv) 0) 0) s)
              (write-long (ash (elt (_centerY . bv) 1) -1) s))
             ((and (class _centerY) (= (length (_centerY . bv)) 1)) ;; big1
              (write-long (elt (_centerY . bv) 0) s)
              (write-long (if (>= _centerY 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _centerY s)(write-long (if (>= _centerY 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _centerX
#+(or :alpha :irix6 :x86_64)
      (setf _centerX (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _centerX (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _centerY
#+(or :alpha :irix6 :x86_64)
      (setf _centerY (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _centerY (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(defclass robo::lidarResponse
  :super ros::object
  :slots (_lidar_array ))

(defmethod robo::lidarResponse
  (:init
   (&key
    ((:lidar_array __lidar_array) (make-array 720 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _lidar_array __lidar_array)
   self)
  (:lidar_array
   (&optional __lidar_array)
   (if __lidar_array (setq _lidar_array __lidar_array)) _lidar_array)
  (:serialization-length
   ()
   (+
    ;; int64[720] _lidar_array
    (* 8    720)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64[720] _lidar_array
     (dotimes (i 720)
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke (elt _lidar_array i) (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class (elt _lidar_array i)) (= (length ((elt _lidar_array i) . bv)) 2)) ;; bignum
              (write-long (ash (elt ((elt _lidar_array i) . bv) 0) 0) s)
              (write-long (ash (elt ((elt _lidar_array i) . bv) 1) -1) s))
             ((and (class (elt _lidar_array i)) (= (length ((elt _lidar_array i) . bv)) 1)) ;; big1
              (write-long (elt ((elt _lidar_array i) . bv) 0) s)
              (write-long (if (>= (elt _lidar_array i) 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long (elt _lidar_array i) s)(write-long (if (>= (elt _lidar_array i) 0) 0 #xffffffff) s)))
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64[720] _lidar_array
   (dotimes (i (length _lidar_array))
#+(or :alpha :irix6 :x86_64)
      (setf (elt _lidar_array i) (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf (elt _lidar_array i) (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
     )
   ;;
   self)
  )

(defclass robo::lidar
  :super ros::object
  :slots ())

(setf (get robo::lidar :md5sum-) "876c4429855d6020f9989528c5e136d4")
(setf (get robo::lidar :datatype-) "robo/lidar")
(setf (get robo::lidar :request) robo::lidarRequest)
(setf (get robo::lidar :response) robo::lidarResponse)

(defmethod robo::lidarRequest
  (:response () (instance robo::lidarResponse :init)))

(setf (get robo::lidarRequest :md5sum-) "876c4429855d6020f9989528c5e136d4")
(setf (get robo::lidarRequest :datatype-) "robo/lidarRequest")
(setf (get robo::lidarRequest :definition-)
      "int64 centerX
int64 centerY
---
int64[720] lidar_array
")

(setf (get robo::lidarResponse :md5sum-) "876c4429855d6020f9989528c5e136d4")
(setf (get robo::lidarResponse :datatype-) "robo/lidarResponse")
(setf (get robo::lidarResponse :definition-)
      "int64 centerX
int64 centerY
---
int64[720] lidar_array
")



(provide :robo/lidar "876c4429855d6020f9989528c5e136d4")



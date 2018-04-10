(defun fill-array (n)
  (let ((arr (make-array (list n n)))
        (to (ceiling n 2))
        (m 1))
    (dotimes (k to)
      (loop for j upfrom k to (- n k 1)
         do (setf (aref arr k j) m)
           (setf m (+ 1 m)))
      (loop for i upfrom (+ k 1) to (- n k 1)
         do (setf (aref arr i (- n k 1)) m)
           (setf m (+ 1 m)))
      (loop for j downfrom (- n k 2) to k
         do (setf (aref arr (- n k 1) j) m)
           (setf m (+ 1 m)))
      (loop for i downfrom (- n k 2) to (+ k 1)
         do (setf (aref arr i k) m)
           (setf m (+ 1 m)))
      )
    arr)
  )

(defun print-matrix (matrix &optional (chars 3) stream)
  (let ((*print-right-margin* (+ 6 (* (1+ chars)
                                      (array-dimension matrix 1)))))
    (pprint matrix stream)
    (values)))

(defun spiral-matrix (n)
  (print-matrix (fill-array n)))

(spiral-matrix 1)
(spiral-matrix 2)
(spiral-matrix 7)

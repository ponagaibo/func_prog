
(defun parse(L E O)
  (if (evenp(first L))
      (setf E (append E (list (first L))))
      (setf O (append O (list (first L)))))
  (if (> (length(rest L)) 0)
      (parse (rest L) E O)
      (list E O))
  )

(defun merge1(E O R)
  (if (and (> (length E) 0) (> (length O) 0))
      (progn (setf R (append R (list (first E)) (list (first O)))) (merge1 (rest E) (rest O) R))
      R)
  )

(defun even-odd(L)
  (if (= (length L) 0)
      nil)
  (merge1 (first (parse L () ())) (second (parse L () ())) () )
  )

(print (even-odd (list 1 2)))
(print (even-odd (list 1 10 4 13 7)))
(print (even-odd (list 1 3 5 7)))

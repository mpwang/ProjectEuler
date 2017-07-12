(defun p30 ()
  (loop for n from 2 to (endpoint)
                when (match n)
                sum n into counter and do (princ n) (princ #\newline)
                finally (return counter)))

(defun match (n)
  (= n
         (loop for ch across (princ-to-string n)
                sum (expt (- (char-int ch) (char-int #\0))
                                  5))))

(defun endpoint ()
  (loop for n = 2 then (1+ n)
                until (<= (* (log n 10)
                                         (expt 9 5))
                                  n)
                finally (return n)))
(time (print (p30)))

(defun test (n)
  (<= n (* (log n 10) (! 9))))

(test (* 0.2 (expt 10 6)))
(test (* 0.3 (expt 10 6)))

; log10(N) * !9 <= N
; 300001
(defun endpoint ()
  (loop for n from (* 0.2 (expt 10 6)) to (* 0.3 (expt 10 6))
                while (<= n (* (log n 10) (! 9)))
                finally (return n)))

(defun p34 ()
  (loop for n from 10 to (endpoint)
                when (match n) sum n))

(defun match (n)
  (= n (loop for ch across (princ-to-string n)
                         sum (! (- (char-int ch) (char-int #\0))))))

(p34)


;http://mathworld.wolfram.com/Factorion.html
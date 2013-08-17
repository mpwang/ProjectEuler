(defun euler47 (&optional (consec 4) (n 645))
  (if (= consec
         (length (remove-duplicates (prime-factor n)))
         (length (remove-duplicates (prime-factor (+ n 1))))
         (length (remove-duplicates (prime-factor (+ n 2))))
         (length (remove-duplicates (prime-factor (+ n 3)))))
      n
      (euler47 consec (1+ n))))

(defun prime-factor (n)
  (when (> n 1)
    (let ((limit (1+ (isqrt n))))
      (do ((i 2 (1+ i))) ((> i limit) (list n))
        (when (zerop (mod n i))
          (return-from prime-factor
            (cons i (prime-factor (/ n i)))))))))
;5 sec
;thish solution get stack overflow on clisp on osx 10.8
;(time (euler47))

; translate from p47.py python solution, a lot better performence
(defun p47 ()
  (let* ((limit 200001)
                 (counter 4)
                 (nums (make-array limit
                                                   :initial-element 0)))
        (loop for i from 2 below limit
                  if
                  (and (= counter (aref nums i))
                           (= counter (aref nums (+ i 1)))
                           (= counter (aref nums (+ i 2)))
                           (= counter (aref nums (+ i 3)))
                           )
                  do (print i) (return-from p47 i)
                  else
                  when (= 0 (aref nums i))
                  do (loop for k from (* i 2) below limit by i
                                   do (incf (aref nums k))))))

;0.1sec
(time (p47))

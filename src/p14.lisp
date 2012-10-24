;;dynamic programming
;;
(defparameter *RS* (make-hash-table))

(defun chain (x ac)
  (if (null (gethash x *RS*))
        (progn
         (cond ((= 1 x)
                   (push x ac) (nreverse ac)
                   (loop for obj on ac do
                                 (setf (gethash (car obj) *RS*) (length obj)))
                   (gethash (car ac) *RS*))
                  ((evenp x) (chain (/ x 2) (push x ac)))
                  (t (chain (1+ (* x 3)) (push x ac)))))
        (progn
          (nreverse ac)
                  (setf (gethash (car ac) *RS*)
                                (+ (gethash x *RS*) (length ac)))
                  (gethash (car ac) *RS*))))

(loop with max-num = 0
          with max-len = 0
          for num from 1000000 downto 1
          for len = (chain num nil)
          if (> len max-len) do
          (setf max-num num
                        max-len len)
          finally (return max-num))
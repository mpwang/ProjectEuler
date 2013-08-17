(defun p29 (n)
  (let ((rs nil))
        (loop for i from 2 to n do
                  (loop for j from 2 to n
                                do (pushnew (expt i j) rs)))
        (length rs)))

(time (print (p29 100)))

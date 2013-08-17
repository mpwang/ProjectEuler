(defun p48 ()
  (loop for i from 1 to 1000 do
                sum (expt i i)))

(time (print (p48)))

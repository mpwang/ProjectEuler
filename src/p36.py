(defun palindromic? (str)
  (equal str (reverse str)))

(defun p36 ()
  (loop for n from 0 below (expt 10 6)
                if (and (palindromic? (write-to-string n))
                                (palindromic? (write-to-string n :base 2)))
                sum n))

(p36)
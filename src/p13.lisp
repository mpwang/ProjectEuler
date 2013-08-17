(defun p13 (data)
  (with-open-file (in data)
        (let ((str (loop for ch = (read-char in nil nil)
                                         while ch
                                         when (not (eql ch #\Newline)) collect ch into str
                                         finally (return str))))
          (reduce #'+
                          (mapcar #'(lambda (x) (parse-integer (string x)))
                                          str)))))

(print (p13 "p13.data"))

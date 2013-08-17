(compile-file "myutils.lisp")
(load "myutils")

(defun digits (n)
  (sort (map 'list #'digit-char-p (write-to-string n)) #'<))

(defun p49 ()
  (let ((primes (remove-if-not (lambda (x) (<= 1003 x 9999))
                                                           (sieve (expt 10 4))))
                ;permutation of number are same key
                (dict (make-hash-table :test #'equal)))
        (loop for p across primes do
                  (push p (gethash (digits p) dict)))
        (loop for v being the hash-values of dict
                  when (>= (length v) 3) do
                  (loop with lst = (sort v #'<)
                                for i in lst do
                                (loop for j in lst do
                                          (loop for k in lst
                                                        when (and (not (or (eq i j)
                                                                                           (eq j k)
                                                                                           (eq i k)))
                                                                          (= (- k j) (- j i)))
                                                        do (print (list i j k))))))))

;0.015 sec
;good
(time (print (p49)))

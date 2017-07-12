(compile-file "myutils.lisp")
(load "myutils")

(defun permutation? (i j)
  (let ((iset (coerce (princ-to-string i) 'list))
                (jset (coerce (princ-to-string j) 'list)))
        (loop with xset = (copy-list iset)
                  for x in xset do
                  (setf iset (remove x iset :count 1))
                  (setf jset (remove x jset :count 1))
                  finally (return (and (null iset) (null jset))))))

(defun get-equidiff-sublist (lst)
  (let ((table (make-hash-table)))
        (loop for num in lst do (setf (gethash num table) t))
        (loop with ans
                  for i from 0 below (length lst)
                  for iv = (elt lst i) do
                  (loop for j from (1+ i) below (length lst)
                                for jv = (elt lst j)
                                for diff = (- jv iv)
                                when (gethash (+ jv diff) table)
                                do (push (list iv jv (+ jv diff)) ans))
                  finally (return ans))))

;pretty awesome for this shit
;11 sec
(defun p49 ()
  (let ((candidates (remove-if-not (lambda (x) (<= 1000 x 9999))
                                                                   (sieve (expt 10 4))))
                (table (make-hash-table)))
        (loop for i across candidates do
                  (loop for j across candidates
                                when (permutation? i j)
                                do (setf (gethash i table)
                                                 (push j (gethash i table)))))
        (loop for v being the hash-values of table
                  for vsort = (sort v #'<)
                  when (>= (length vsort) 3) do
                  (let ((equdiff-sublist (get-equidiff-sublist vsort)))
                        (when equdiff-sublist (print equdiff-sublist)))))()
)

(time (print (p49)))

(compile-file "myutils.lisp")
(load "myutils.fas")

(declaim (speed 3) (safety 0) (debug 0))
(defparameter *LOOKUP-TABLE* nil)

;dynamic programming
;calculate all the sums and find the prime number sum with max addons
(defun setup-lookup-table (n)
  (let* ((primes (sieve n))
                 (pcount (length primes))
                 (maxPrime (elt primes (1- pcount)))
                 (prime-table (make-hash-table))
                 (lookup-table (make-hash-table)))
        (loop for p across primes do (setf (gethash p prime-table) t))
        ;though it's fast enough it's still O(N^2) complexity
        (loop for i from 0 below pcount do
                  (loop with thisSum = 0
                                for j from i below pcount
                                do (incf thisSum (elt primes j))
                                ;thisSum < maxPrime critical condition
                                while (<= thisSUm maxPrime) do
                                (let ((thisSumisPrime (gethash thisSum prime-table))
                                          (thisSumExistInTable (gethash thisSUm lookup-table))
                                          (opNumNew (1+ (- j i))))
                                  (when (and thisSumisPrime (not (eq i j)))
                                        (if thisSumExistInTable
                                          (destructuring-bind (opNum start end) thisSumExistInTable
                                                (when (> opNumNew opNum)
                                                  (setf (gethash thisSum lookup-table)
                                                                (list (1+ (- j i))
                                                                          (elt primes i)
                                                                          (elt primes j)))))
                                          (setf (gethash thisSum lookup-table)
                                                        (list (1+ (- j i))
                                                                  (elt primes i)
                                                                  (elt primes j))))))))
        (setf *LOOKUP-TABLE* lookup-table)))

(defun p50 (n)
  (setup-lookup-table n)
  (loop with maxOpNum = 0
                with maxK with maxV
                for k being the hash-keys in *LOOKUP-TABLE*
                using (hash-value v) do
                (destructuring-bind (opNum start end) v
                  (when (> opNum maxOpNum)
                        (setf maxOpNum opNum
                                  maxK k
                                  maxV v)))
                finally
                (format t "prime: ~a~%add up by ~a~%start from number ~a end ~a~%"
                                maxK (first maxV) (second maxV) (third maxv))))

;(time (progn (p50 (expt 10 6)) nil))

;top-down solution
;too slow
(defun fun (n)
  (loop with primes = (sieve n)
                with maxaddon = 0
                with ans = 0
                with start = 0
                with end = 0
                for p across primes
                for lst = (subseq primes 0 (position p primes)) do
                (loop for i from 0 below (length lst) do
                          (loop with sum = 0
                                        for j from i below (length lst)
                                        while (< sum p)
                                        do (incf sum (elt primes j))
                                        when (and (= sum p) (> (1+ (- j i)) maxaddon))
                                        do (setf maxaddon (1+ (- j i))
                                                         ans sum
                                                         start (elt primes i)
                                                         end (elt primes j))))
                finally (format t "~a ~a ~a ~a~%" maxaddon ans start end)))
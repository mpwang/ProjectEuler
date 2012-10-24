(defun find-divisors (x)
  (let ((divs nil))
    (loop for i from 1 to (sqrt x)
       do (when (zerop (mod x i))
            (push i divs)
            (let ((d (/ x i)))
              (unless (or (= i 1) (= i d))
                (push d divs)))))
    divs))
 
(defun abundant-p (x)
  (> (reduce #'+ (find-divisors x)) x))
 
(defun euler-proj-23 (&optional (size 28123))
  (let ((sums-of-abundants (make-array size :element-type 'bit))
        (abundants nil))
    (loop for i from 0 to size
         do (when (abundant-p i)
              (setq abundants (append abundants (list i)))
              (loop for j in abundants
                 while (< (+ i j) size)
                 do (setf (elt sums-of-abundants (+ i j)) 1))))
    (loop for i from 0 below size
         when (zerop (elt sums-of-abundants i))
         sum i)))
=====================================================

;prime factors
(defun prime-factor-slow (n)
  (let ((rs nil)
                (v n))
        (loop for c = 0 then (1+ c)
                  while (evenp v)
                  do (setf v (ash v -1))
                  finally (push (list 2 c) rs))
        (loop for i from 3 to (isqrt v) by 2 do
                  (loop for c = 0 then (1+ c)
                                while (zerop (mod v i))
                                do (setf v (/ v i))
                                finally
                                (when (not (zerop c))
                                  (push (list i c) rs))))
        (if (= 1 v)
          (nreverse rs)
          (nreverse (push (list v 1) rs)))))

(defparameter *PRIMES* '(2))
(defun prime-factor (n)
  )

;divisor function
;http://mathworld.wolfram.com/DinisorFunction.html
(defun divisor-sum (n)
  (let ((pas (prime-factor n)))
        (reduce
          #'*
          (loop for pa in pas
                        for pi = (first pa)
                        for ai = (second pa)
                        collect (/ (1- (expt pi (1+ ai)))
                                           (1- pi))))))
;http://mathworld.wolfram.com/AbundantNumber.html
;Any multiple of a perfect number or an abundant number is also abundant.
;Every number greater than 20161 can be expressed as a sum of two abundant numbers.
(defun abundant-number? (n)
  (> (- (divisor-sum n) n) n))

(defun p23 ()
  (let ((ab-nums (remove-if-not #'abundant-number?
                                                                (loop for i from 1 to 20161 collect i)))
                (rs (make-hash-table))
                (two-ab-sum-nums (make-hash-table)))
        (loop for m in ab-nums do
                  (loop for n in ab-nums
                                when (<= (+ m n) 20261) do
                                (unless (gethash (+ m n) two-ab-sum-nums)
                                  (setf (gethash (+ m n) two-ab-sum-nums) 1))))
        (loop for i from 1 to 20161 do (setf (gethash i rs) 1))
        (loop for k being the hash-keys of two-ab-sum-nums do (remhash k rs))
        (loop for k being the hash-keys of rs sum k)
        ))
(time (p23))
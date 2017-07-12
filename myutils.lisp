(defparameter *PRIMES* nil)

(defun sieve (n)
  (if (position n *PRIMES*)
      (subseq *PRIMES* 0 (position n *PRIMES*))
    (let ((composites (make-array (1+ n)
                                  :element-type 'bit
                                  :initial-element 0))
          (primes (make-array (isqrt n)
                              :element-type 'integer
                              :fill-pointer 0
                              :adjustable t)))
      (loop for candidate from 2 to n
            when (zerop (bit composites candidate))
            do (vector-push-extend candidate primes)
            and do (loop for composite from (expt candidate 2) to n by candidate
                         do (setf (bit composites composite) 1)))
      (setf *PRIMES* primes)
      primes)))

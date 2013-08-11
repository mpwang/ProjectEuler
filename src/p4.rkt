#lang racket

;awful! not good
;not familiar with scheme.

(define (isPalindrome? str)
  (do ((s 0 (+ s 1))
           (e (- (string-length str) 1) (- e 1))
           (rs #f)
           (end #f))
        ((eq? end #t ) rs)
        (if (>= s e)
          (begin (set! end #t) (set! rs #t))
          (if (not(eq? (string-ref str s) (string-ref str e)))
                (begin (set! end #t) (set! rs #f))
                empty))))

(define lst (build-list 1000 values) )
(define v 0)
(for* ((i lst) (j lst))
          (if (isPalindrome? (number->string (* i j)))
                (begin (print (* i j)) (newline)
                           (if (> (* i j) v) (set! v (* i j)) empty))
                empty))

(print v)

#lang racket

;key realisation: every number n can at most have one prime factor greater than n .
;If we, after dividing out some prime factor, calculate the square root of the remaining number
;we can use that square root as upper limit for factor. If factor exceeds this square root
;we know the remaining number is prime.

(define num 600851475143)
(define lastFactor 2)

(define (fsqrt x) (floor (sqrt x)))
(define (rm x n)
        (let loop ((k n))
          (if (= 0 (modulo k x)) (loop (/ k x)) k)))

(if (even? num)
  (set! num (rm 2 num))
  (set! lastFactor 1))

(time
(do ((factor 3)
         (n num)
         (maxFactor (fsqrt num)))
  ((not(and (> n 1) (>= maxFactor factor)))
   (if (= n 1) (print lastFactor) (print n))
   (newline))
  (if (= 0 (modulo n factor))
        (begin
          (set! lastFactor factor)
          (set! n (rm factor n))
          (set! maxFactor (fsqrt n)))
        (set! factor (+ 2 factor))))
)


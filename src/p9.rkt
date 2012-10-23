#lang racket

; '(s ... e-1)
(define (get s e) (build-list (- e s) (lambda (x) (+ s x))))

(do ((c (floor (/ 1000 3)) (+ 1 c)))
  ((> c 999))
  (let ((clst (get c 1000)))
        (for* ((c0 clst))
                  (let ((blst (get (floor (/ c0 2)) c0)))
                        (for* ((b0 blst))
                                  (define a0 (- 1000 c0 b0))
                                  (if (and (> a0 0)
                                                   (= (* c0 c0)
                                                          (+ (* b0 b0) (* a0 a0))))
                                        (begin
                                          (print (list a0 b0 c0))
                                          (newline)
                                          (print (list "prod: " (* a0 b0 c0)))
                                          (newline))
                                        empty))))))


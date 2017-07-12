;recursive formula
;f(1,n) = f(n,1) = n+1
;f(m,n) = f(m-1,n) + f(m,n-1)

(defparameter *h* (make-hash-table :test #'equal))

(defun p15 (m n)
  (let ((fn (gethash (list m n) *H*)))
        (if fn fn
          (let ((ans (cond ((= 1 m) (1+ n))
                                          ((= 1 n) (1+ m))
                                          (t (+ (p15 (1- m) n)
                                                        (p15 m (1- n)))))))
                (setf (gethash (list m n) *h*) ans)
                ans))))

(time (print (p15 20 20)))

#|
=======================================================
11 Aug 2004 11:24 pm
RudyPenteado (Assembler) RudyPenteado is from Brazil
This is what I find 2 months ago when I solved it:

Each movement in the horizontal is a zero.
Each movement in the vertical is a one.

1st binary# in this series:
0000000000000000000011111111111111111111
last:
1111111111111111111100000000000000000000
For the numbers in between, the amount of
zeros should be the same as ones. In other
words, the ones and zeros have to be rearranged.

The total is: 40!/(20!)(20!)
Just use the MS calculator.
137846528820
Best,
Rudy.

entral binomial coefficients: C(2*n,n) = (2*n)!/(n!)^2.



11 Mar 2006 02:03 am
Saif (ECMAScript) Saif is from USA
If you think about it, you need to move 20 right and 20 down in any order. You just need to find all the ways you can arrange 20 rights and 20 downs. If we think of them as elements, we have 40 of them. 20 of them being R, and 20 of them being D. Say you have one combination. Swapping any of the D's with each other will give you the same combination; same thing with R's. So first, you have 40! ways you can arrange them. There are 20! ways that you can arrange the R's and 20! ways you can arrange the D's. Dividing 40! by each of these should give the answer:

40!/(20!*20!) = 137846528820




16 Feb 2006 11:32 am
SekaiAi (PHP) SekaiAi is from Indonesia
After a lot of research i find that the answer is the sum of square of pascal triangle. For example :

Pascal Triangel as shown like this

1
1 1 = 1 + 1 = 2
1 2 1 = 1 + 4 + 1 = 6
1 3 3 1 = 1 + 9 + 9 + 1 = 20
1 4 6 4 1 = 1 + 16 + 36 + 16 + 1 = 70
|#

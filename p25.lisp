;the length of a number base in 10. is log10(number)

#|
(/
 (+ 999
   (* 0.5 (log 5 10)))
 (log (/ (1+ (sqrt 5)) 2 ) 10))

nth fibonacci number is =

(g1^n-g2^n)/sqrt(5).
where g1 = (1+sqrt(5))/2 = 1.61803399
g2 = (1-sqrt(5))/2 = -0.61803399

For finding the length of nth fibonacci number, we can just calculate the log(nth fibonacci number).So, length of nth fibonacci number is,

log((g1^n-g2^n)/sqrt(5)) = log(g1^n-g2^n)-0.5*log(5).
you can just ignore g2^n, since it is very small negative number.

Hence, length of nth fibonacci is

n*log(g1)-0.5*log(5)

and we need to find the smallest value of 'n' such that this length = 1000, so we can find the value of n for which the length is just greater than 999.

So,

n*log(g1)-0.5*log(5) > 999
n*log(g1) > 999+0.5*log(5)
n > (999+0.5*log(5))/log(g1)
n > (999.3494850021680094)/(0.20898764058551)
n > 4781.859263075
|#


(defun problem-25 ()
  (loop for x = 1 then y
                and y = 1 then (+ x y)
                and n = 1 then (1+ n )
                while (< x (expt 10 (1- 1000)))
                finally (return n)))

(time (print (problem-25)))

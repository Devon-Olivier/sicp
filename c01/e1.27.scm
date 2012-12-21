#lang planet neil/sicp

(define (square x) (* x x))

;;I don't like this definition it is confusing
;;I had to take pen to paper to prove that these
;;definitions do compute the r such that r =  base^exp (mod m)
(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp) (remainder (square (expmod base 
						(/ exp 2) 
						m)) 
				m))
	(else (remainder (* base 
			    (expmod base 
				    (- exp 1) 
				    m)) 
			 m))))

(define (test-carmichael n)
  (define (test count)
    (cond ((= count 1) #t)
      ((= (expmod count n n) count)
       (test (- count 1)))
      (else #f)))
  (test (- n 1)))

(test-carmichael 561)
(test-carmichael 1105)
(test-carmichael 1729)
(test-carmichael 2465)
(test-carmichael 2821)
(test-carmichael 6601)
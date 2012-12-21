#lang planet neil/sicp

;;my attempt to write to write the smallest-divisor without looking at the text's
;;Find the smallest diviser of n that is greater than one
(define (square x) (* x x))
(define (smallest-divisor n)
  (define (divisor-loop d)
    (cond ((> (square d) n) n)
	  ((= (remainder n d) 0) d)
	  (else (divisor-loop (+ d 1)))))
  (divisor-loop 2))

(define (prime? n)
  (= (smallest-divisor n) n))

(define (fast-prime? n times)
  (cond ((= times 0) true)
	((fermat-test n) (fast-prime? n  (- times 1)))
	(else false)))

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

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (timed-prime-test n)
  (define (start-prime-test start-time)
    (if (fast-prime? n 5)
      (report-prime (- (runtime) start-time))))
  (define (report-prime elapsed-time)
    (display "***")
    (display elapsed-time))
  (newline)
  (display n)
  (start-prime-test (runtime)))

(define (search-for-primes left right)
  (define (search-loop current)
    (cond ((<= current right)
	   (timed-prime-test current)
	   (search-loop (+ current 2)))
	  (else (newline) 'finished)))
  (if (odd? left)
    (search-loop left)
    (search-loop (+ left 1))))

(search-for-primes 1000 1050)
(search-for-primes 10000 10050)
(search-for-primes 100000 100050)
(search-for-primes 1000000 1000050)
;;using the fast-prime 5 times
;;1009 (123u), 1013(117u), 1019(121u) are the three smallest primes larger than 1000
;;10007(141u), 10009(139u), 10037(142u) are the three smallest primes larger than 10000
;;100003(478u), 100019(347u), 100043(349u) are the three smallest primes larger than 100000
;;1000003(611u), 1000033(466u), 1000037(458u) are the three smallest primes larger than 1000000

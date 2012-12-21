;;my attempt to write to write the smallest-divisor without looking at the text's
;;Find the smallest diviser of n that is greater than one
(define (square x) (* x x))
(define (smallest-divisor n)
  (define (next test-divisor)
    (cond ((= test-divisor 2) 3)
	  (else (+ test-divisor 2))))
  (define (divisor-loop test-divisor)
    (cond ((> (square test-divisor) n) n)
	  ((= (remainder n test-divisor) 0) test-divisor)
	  (else (divisor-loop (next test-divisor)))))
  (divisor-loop 2))

(define (prime? n)
  (= (smallest-divisor n) n))

(define (timed-prime-test n)
  (define (start-prime-test start-time)
    (if (prime? n)
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
;;1009 (72u), 1013(64u), 1019(91u) are the three smallest primes larger than 1000
;;10007(182u), 10009(149u), 10037(124u) are the three smallest primes larger than 10000
;;100003(343u), 100019(323u), 100043(329u) are the three smallest primes larger than 100000
;;1000003(1024u), 1000033(1121u), 1000037(1006u) are the three smallest primes larger than 1000000
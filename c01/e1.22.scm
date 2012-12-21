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
;;1009 (110u), 1013(107u), 1019(108u) are the three smallest primes larger than 1000
;;10007(257u), 10009(195u), 10037(181u) are the three smallest primes larger than 10000
;;100003(1001u), 100019(514u), 100043(515u) are the three smallest primes larger than 100000
;;1000003(1616u), 1000033(1760u), 1000037(1604u) are the three smallest primes larger than 1000000

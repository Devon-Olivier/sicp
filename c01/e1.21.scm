;;my attempt to write to write the smallest-divisor without looking at the text's
;;Find the smallest diviser of n that is greater than one
(define (smallest-divisor n)
  (define (square x) (* x x))
  (define (divisor-loop d)
    (cond ((> (square d) n) n)
	  ((= (remainder n d) 0) d)
	  (else (divisor-loop (+ d 1)))))
  (divisor-loop 2))


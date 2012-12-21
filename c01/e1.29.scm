#lang racket

(define (sum f a next b)
  (define (iter a result)
    (if (< b a)
      result
      (iter (next a) (+ (f a) result))))
  (iter a 0))

(define (simpson f a b n)
  (let* ((h (/ (- b a) n))
	 (yk (lambda (k) (f (+ a (* k h)))))
	 (simpson-term (lambda (k) (cond ((or (= k n) (= k 0)) (yk k))
					 ((even? k) (* 2 (yk k)))
					 ((odd? k) (* 4 (yk k)))))))
    (* (/ h 3.0) (sum simpson-term 0 (lambda (x) (+ x 1)) n))))
(display (simpson (lambda (x) (* x x)) 0 1 100))

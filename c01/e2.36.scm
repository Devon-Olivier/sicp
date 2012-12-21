#lang planet neil/sicp

(define (average x y)
  (/ (+ x y) 2))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display guess) (newline)
      (if (close-enough? guess next)
	next
	(try next))))
  (try first-guess))

(define (average-damped-fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display guess) (newline)
      (if (close-enough? guess next)
	next
	(try (average next guess)))))
  (try first-guess))

(display "sequence without average damping")
(define y (fixed-point (lambda (x) (/ (log 1000) (log x))) 
                                1.1))

(display "sequence with average damping")
(define x (average-damped-fixed-point (lambda (x) (/ (log 1000) (log x))) 
                                1.1))
(display "x to the x is " )
(display (exp (* x (log x)))) (newline)
(display "y to the y is " )
(display (exp (* y (log y))))
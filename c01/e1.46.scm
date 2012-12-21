#lang racket

(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (define (iter guess)
      (if (good-enough? guess)
          guess
          (iter (improve guess))))
    (iter guess)))             

(define (fixed-point g guess)
    (define tolerance 0.0001)
    (define (good-enough? guess)
      (< (abs (- guess (g guess))) tolerance))
    ((iterative-improve good-enough? g) guess))

(define (square x) (* x x))
(define (average x y) (/ (+ x y) 2))

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improve good-enough? improve) 1.0))

(define (average-damp f)
  (lambda (x) (average x (f x))))
(define (sqrt-by-average-damp x)
  (fixed-point (average-damp (lambda (y) (/ x y))) 1.0))
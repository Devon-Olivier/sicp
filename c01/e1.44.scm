#lang planet neil/sicp

(define (average a b c)
  (/ (+ a b c) 3))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (cond  ((= n 1) f)
         ((even? n) (let ((f^n/2 (repeated f (/ n 2))))
                      (compose f^n/2 f^n/2)))
         (else (compose f (repeated f (- n 1))))))

(define (smooth f)
  (define dx 0.00001)
  (lambda (x) (average (f (- x dx)) (f x) (f (+ x dx)))))

(define (n-fold-smooth f n)
  ((repeated smooth n) f))
  
#lang planet neil/sicp

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (cond  ((= n 1) f)
         ((even? n) (let ((f^n/2 (repeated f (/ n 2))))
                      (compose f^n/2 f^n/2)))
         (else (compose f (repeated f (- n 1))))))
    
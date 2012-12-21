#lang racket

(define (product f a next b)
  (define (iter a result)
    (if (< b a)
        result
        (iter (next a) (* result (f a)))))
  (iter a 1))

(define (factorial n)
  (product (lambda (x) x) 1 (lambda (x) (+ x 1)) n))

(define (approx-pi n)
  (let ((factor (lambda (n)
                  (cond ((even? n) (/ (+ 2 n) (+ 3 n)))
                        ((odd? n) (/ (+ 3 n) (+ 2 n)))))))
    (product factor 0 (lambda (x) (+ x 1)) (- n 1)))) 
                      
                      
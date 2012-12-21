#lang racket
(define (accumulate predicate combiner base-value term a next b)
  (define (iter a result)
    (if (< b a)
        result
        (let ((current-term (term a)))
          (if (predicate current-term)
              (iter (next a)
                    (combiner current-term result))
              (iter (next a) result)))))
  (iter a base-value))

(define (sum-square-even a b)
  (accumulate even? + 0 (lambda (x) (* x x)) a (lambda (x) (+ x 1)) b)) 

(define (coprime-product n)
  (accumulate (lambda (x) (= (gcd x n) 1)) * 1 (lambda(x) x) 1 (lambda (x) (+ x 1)) n))
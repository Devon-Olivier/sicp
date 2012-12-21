#lang racket

;(define (<sum/product> f a next b)
;  (define (iter a result)
;    (if (< b a)
;      result
;      (iter (next a) (<combiner> (f a) result))))
;  (iter a <base-value>))

(define (accumulate combiner base-value term a next b)
  (define (iter a result)
    (if (< b a)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a base-value))

(define (product f a next b)
  (accumulate * 1 f a next b))
(define (sum f a next b)
  (accumulate + 0 f a next b))
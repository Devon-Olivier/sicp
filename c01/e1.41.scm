#lang racket

(define (double g)
  (lambda (x)
    (g (g x))))

(define (inc x)
  (+ 1 x))
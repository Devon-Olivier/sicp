#lang racket

(define (same-parity n . rest)
  (cons n (filter (lambda (m) (even? (+ n m))) rest)))

#lang planet neil/sicp

(define (mmap p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(define (square x) (* x x))
(mmap square '(1 2 3))

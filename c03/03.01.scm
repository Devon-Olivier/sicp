#lang sicp
(define (make-accumulator init)
  (lambda (delta-sum)
    (set! init (+ init delta-sum))
    init))

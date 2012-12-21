#lang racket

(define (last-pair l)
  (if (or (empty? l)
          (empty? (cdr l)))
      l
      (last-pair (cdr l))))

(last-pair (list 0))
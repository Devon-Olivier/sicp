#lang planet neil/sicp

(define (square-list items)
  (if (null? items)
      nil
      (cons (square (car items))
            (square-list (cdr items)))))

(define (square x) (* x x))

(define (square-list2 items)
  (map square items))
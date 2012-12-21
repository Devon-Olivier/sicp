#lang racket 

;(define (square-tree tree)
;  (cond ((null? tree) '())
;        ((not (pair? tree)) (square tree))
;        (else (cons (square-tree (car tree))
;                    (square-tree (cdr tree))))))
(define (square x) (* x x))

(define (square-tree tree)
  (cond ((not (pair? tree)) (square tree))
        (else (map square-tree tree))))

(square-tree (list 1
                   (list 2 (list 3 4) 5)
                   (list 6 7)))
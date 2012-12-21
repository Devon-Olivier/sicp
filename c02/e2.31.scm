#lang racket 
(define (tree-map function tree)
  (cond ((not (pair? tree)) (function tree))
        (else (map (lambda (branch)
                     (tree-map function branch))
                   tree))))

(define (square-tree tree) (tree-map (lambda (n) (* n n))
                                      tree))
(square-tree (list 1
                   (list 2 (list 3 4) 5)
                   (list 6 7)))

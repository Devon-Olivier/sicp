#lang racket

(define (accumulate-r op init lst)
  (cond ((null? lst) init)
        (else (op (car lst) (accumulate-r op init (cdr lst))))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate-r op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (apply + (map * v w)))

(define m '((1 2 3 4) (4 5 6 6) (6 7 8 9)))
(define n '((1 0 0 0) (0 1 0 0) (0 0 1 0) (0 0 0 1)))

(define (matrix-*-vector m v)
  (map (lambda (row)
         (dot-product row v))
       m))

(define (transpose mat)
  (accumulate-n cons '() mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row)
           (matrix-*-vector cols row))
         m)))
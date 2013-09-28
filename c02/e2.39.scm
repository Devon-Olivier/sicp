#lang planet neil/sicp
(#%require r5rs/init)

(define (fold-right op init lst)
  (if (null? lst)
      init
      (op (car lst) (fold-right op init (cdr lst)))))

(define (fold-left op init lst)
  (if (null? lst)
      init
      (fold-left op (op init (car lst)) (cdr lst))))

(define (mreverse lst)
  (fold-right (lambda (x y)
                (append y (list x)))
              nil
              lst))
(define (mreverse-2 lst)
  (fold-left (lambda (x y)
               (cons y x))
             nil 
             lst))
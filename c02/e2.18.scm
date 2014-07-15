#lang racket

(define (my-reverse l)
  (if (null? l)
      l
      (append (my-reverse (cdr l)) (list (car l)))))

(my-reverse (list 1 2 3 45))
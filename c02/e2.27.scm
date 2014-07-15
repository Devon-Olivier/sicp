#lang planet neil/sicp

(define (reverse l)
  (if (null? l)
      l
      (append (reverse (cdr l)) (list (car l)))))
(define (deep-reverse l)
  (cond ((null? l) l)
        ((pair? (car l))
         (append (deep-reverse (cdr l)) (list (deep-reverse (car l)))))
        (else (append (deep-reverse (cdr l)) (list (car l))))))

(deep-reverse '((2 3 4) 5 (6 7)))
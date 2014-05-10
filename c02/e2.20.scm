#lang planet neil/sicp

(define (filter lst predicate)
  (cond ((null? lst) lst)
        ((predicate (car lst)) (cons (car lst) (filter (cdr lst) predicate)))
        (else (filter (cdr lst) predicate))))

#'(define (same-parity lst)
  (if (null? lst)
      lst
      (filter lst (parity (car lst)))))

(define (parity n)
  (if (even? n)
      even?
      odd?))

(define (same-parity n . rest)
  (cons n (filter (lambda (m) (even? (+ n m))) rest)))

#lang planet neil/sicp

(define (accumulatel operation initial sequence)
  (cond ((null? sequence) initial)
        (else (accumulatel operation (operation initial (car sequence))
                          (cdr sequence)))))

(define (accumulater operation initial sequence)
  (cond ((null? sequence) initial)
        (else (operation (car sequence)
                         (accumulateR operation 
                                      initial 
                                      (cdr sequence))))))

(define (mymap function sequence)
  (accumulater (lambda (x y) (cons (function x) y)) nil sequence))

(define (myappend seq1 seq2)
  (accumulater cons seq2 seq1))

(define (length sequence)
  (accumulater (lambda (x y) (+ y 1))
               0
               sequence))

;;Implementing this function requires the programmer
;;to understand the internal behaviour of accumulater
;;Ent? He must know that accumulater applies 'operation'
;;to (car list) and the result of applying accumulater
;;on (cdr list).
;;Or should I be seeing this as a right associative 
;;combination with 'operation' as the operation?
(define (horner-eval x coef-list)
  (accumulater (lambda (this-coef higher-terms)
                 (+ this-coef (* x higher-terms)))
               0
               coef-list))
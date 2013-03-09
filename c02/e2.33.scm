#lang planet neil/sicp

(define (accumulatel operation initial sequence)
  (cond ((null? sequence) initial)
        (else (accumulateL operation (operation initial (car sequence))
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
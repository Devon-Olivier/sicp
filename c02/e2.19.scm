#lang planet neil/sicp

(define (cc amount coin-values)
  (if (= amount 0)
      1;It is not obvious to me that this should be the value when amount is zero
      (if (or (< amount 0) (no-more-coins? coin-values))
          0
          (+ (cc amount (but-first-denomination coin-values));count change made without first denomination
             (cc (- amount (first-denomination coin-values)) coin-values)))));count change made using all denominations

(define (no-more-coins? coin-values)
  (null? coin-values))

(define (but-first-denomination coin-values)
  (cdr coin-values))

(define (first-denomination coin-values)
  (car coin-values))
 
 (define (book-cc amount coin-values)
   (cond ((= amount 0) 1)
         ((or (< amount 0) (no-more-coins? coin-values)) 0)
         (else (+ (book-cc amount (but-first-denomination coin-values));count change made without first denomination
                  (book-cc (- amount (first-denomination coin-values)) coin-values)))));count change made using all denominations
 
 (book-cc 100 (list 0.1));gives the wrong value ... check!!!
 (cc 100 (list 0.1));gives the wrong value ... check!!!


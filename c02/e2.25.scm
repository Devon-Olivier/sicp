#lang planet neil/sicp

(define (cadadadadadadr x)
  (cadadr (cadadr (cadadr x))))

(define l '(1 (2 (3 (4 (5 (6 7)))))))

(cadadadadadadr l)
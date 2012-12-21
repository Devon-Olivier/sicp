#lang planet neil/sicp

(define (for-each lst proc)
  (cond ((null? lst) (display ""))
        (else (proc (car lst))
              (for-each (cdr lst) proc))))


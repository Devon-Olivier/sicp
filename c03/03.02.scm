#lang sicp

(define (make-monitored f)
  (let ((count 0))
    (lambda (msg)
      (cond ((eq? msg 'reset-count) (set! count 0))
            ((eq? msg 'how-many-calls?) count)
            (else (begin (set! count (inc count))
                         (f msg)))))))
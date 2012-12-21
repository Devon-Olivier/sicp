;; My iterative implentation of (length lst)
(define (len lst)
  (define (len-iter count part)
    (if (null? part)
      count
      (len-iter (+ count 1) (cdr part))))
  (len-iter 0 lst))

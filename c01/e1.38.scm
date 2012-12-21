#lang planet neil/sicp
(define (cont-frac-iter n d k)
  (define (iter i frac-i+1)
    (if (= i 0)
        frac-i+1
        (iter (- i 1) (/ (n i) (+ (d i) frac-i+1)))))
  (iter (- k 1) (/ (n k) (d k))))

(define (divides? m n) (= (remainder n m) 0))

(define e-2 (cont-frac-iter (lambda (i) 1.0)
                            (lambda (i)
                              (let ((i-2 (- i 2)))
                                (if (divides? 3 i-2)
                                  (* 2.0 (+ 1 (/ i-2 3)))
                                  1.0)))
                            10000))
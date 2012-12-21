#lang planet neil/sicp

;;TODO prove that these procedures are correct
;;I am thinking loop invariant for the iterative one
(define (cont-frac n d k)
  (define (cont-frac-from j)
    (if (= j k)
        (/ (n k) (d k))
        (/ (n j) (+ (d k) (cont-frac-from (+ j 1))))))
  (cont-frac-from 1))

(define (cont-frac-iter n d k)
  (define (iter i frac-i+1)
    (if (= i 0)
        frac-i+1
        (iter (- i 1) (/ (n i) (+ (d i) frac-i+1)))))
  (iter (- k 1) (/ (n k) (d k))))
        
(display (cont-frac-iter (lambda (i) 1.0)
           (lambda (i) 1.0)
           17));;looks like 17 is the k that makes cont-frac approximate phi to 4 decimal places

(newline )

(display (cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           17))



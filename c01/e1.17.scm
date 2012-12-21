(define (double a )
  (+ a a))
(define (half a)
  (/ a 2))

(define (mult a b)
  (if (= b 0)
    0
    (if (even? b)
      (mult (double a) (half b))
      (+ (mult a (- b 1)) a))))


(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) 
                 x)))

(define (improve guess x)
  (mean guess (/ x guess)))

(define (mean x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) .001))

(define (square x)
  (* x x))

(define (square-root x)
  (sqrt-iter 1 x))

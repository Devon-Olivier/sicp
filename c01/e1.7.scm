(define (dev-sqrt x)
  (define (sqrt-iter guess oldguess)

    (define (good-enough?)
      (< (/ (abs (- guess oldguess)) guess) 0.01))

    (define (improve-guess)
      (define (mean a b)
	(/ (+ a b) 2))
      (mean guess (/ x guess)))

    (if (good-enough?)
      guess
      (sqrt-iter (improve-guess) guess)))

  (sqrt-iter 1.0 x))

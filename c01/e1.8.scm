(define (cuberoot x)
  (define (cuberoot-iter guess oldguess)
    (define (good-enough?)
      (< (abs (- guess oldguess)) (* 0.001 guess)))
    
    (define (square y)
      (* y y))
    
    (define (improve-guess)
      (/ (+ (/ x (square guess)) 
            (* 2 guess)) 
         3))
    
    (if (good-enough?)
        guess
        (cuberoot-iter (improve-guess) guess)))
  (cuberoot-iter 1.0 x))
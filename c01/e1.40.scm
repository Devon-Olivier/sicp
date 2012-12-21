#lang planet neil/sicp

(define dx 0.00001)
(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) 
          (g x)) 
       dx)))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (fixed-point g guess)
  (define tolerance 0.00001)
  (define (close-enough? a b)
    (< (abs (- a b)) tolerance))
  (define (try guess)
    (let ((next (g guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try guess))

(define (newton-method g guess)
  (fixed-point (newton-transform g) guess))

(define (cubic a b c)
  (lambda (x)
    (+ (cube x)
       (* a (square x))
       (* b x)
       c)))
(define (cube x)
  (* x x x))
(define (square x)
  (* x x))
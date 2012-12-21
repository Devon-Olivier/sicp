(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve-guess guess x)
	       x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) 
	     x)) 
     0.001))

(define (square x)
  (* x x))

(define (improve-guess guess x)
  (mean guess
	(/ x guess)))

(define (mean x y)
  (/ (+ x y) 2))

(define (devon-sqrt x)
  (sqrt-iter 1.0 x))


;we get a stack overflow since the interpreter
;evaluates in applicative order. This causes
;the else part of the new-if to be evaluated
;reguardless of the value of the predicate.
;So we never reach the base case in the else clause
;and overflow the stack with procedure calls.
;if is a special form and does not evaluate the 
;else clause unless the predecate is false, 
;so this does not happen for it.
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))

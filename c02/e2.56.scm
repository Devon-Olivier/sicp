#lang racket

(define (deriv exp var)
  (cond [(number? exp) 0]
        [(variable? exp)
         (if (same-variable? exp var) 1 0)]
        [(sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var))]
        [(product? exp)
         (make-sum
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var)))]
        [(exponentiation? exp)
         (make-product (exponent exp)
                       (make-product
                        (make-exponentiation (base exp)
                                             (- (exponent exp)
                                                1))
                        (deriv (base exp) var)))]
        [else (error "unknown expression type ---DERIV" exp)]))

(define variable? symbol?)
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))
(define (make-sum a1 a2) 
  (cond [(=number? a1 0) a2]
        [(=number? a2 0) a1]
        [(and (number? a1) (number? a2)) (+ a1 a2)]
        [else (list '+ a1 a2)]))
(define (=number? exp num)
  (and (number? exp) (= exp num)))
(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))
(define addend cadr)
(define augend caddr)

(define (make-product m1 m2)
  (cond [(or (=number? m1 0) (=number? m2 0)) 0]
        [(=number? m1 1) m2]
        [(=number? m2 1) m1]
        [(and (number? m1) (number? m2)) (* m1 m2)]
        [else (list '* m1 m2)]))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))
(define multiplier cadr)
(define multiplicand caddr)

(define (make-exponentiation b e)
  (cond [(=number? e 0) 1]
        [(=number? e 1) b]
        [(and (number? b) (number? e)) (expt b e)]
        [else (list '** b e)]))

(define (exponentiation? exp)
  (and (pair? exp) (eq? (car exp) '**)))
(define base cadr)
(define exponent caddr)
#lang planet neil/sicp

;;store a pair of non-negative 
;;integers x and y as the product
;;2^x * 3^y. See e2.5.lyx for proof
;;that this is possible.
(define (our-cons x y)
  (* (fast-exp 2 x)
     (fast-exp 3 y)))

;;naive solution calculate the evenness
;;of pair
(define (our-car pair)
  (evenness pair))

;;naive solution calculate the 3-ness
;;of pair
(define (our-cdr pair)
  (3-ness pair))

;;evenness: m -> the largest natural n such
;;that 2^n|m
(define (evenness m)
  (if (odd? m)
      0
      (+ 1 (evenness (/ m 2)))))

;;evenness generalizes to q-ness
(define (q-ness q m)
  (if (not (divides? q m))
      0
      (+ 1 (q-ness q (/ m q)))))

(define (divides? a b)
  (= (remainder b a) 0))
      
(define (3-ness m)
  (q-ness 3 m))

(define (square x ) (* x x))

;Compute fast-exp: (x,y) -> x^y 
;assuming y is a non-negative integer
(define (fast-exp x y)
  (define (exp-iter base power residue)
    (cond ((= power 0) residue)
          ((even? power)
           (exp-iter (square base) (/ power 2) residue))
          ((odd? power)
           (exp-iter base (- power 1) (* residue base)))))
  (exp-iter x y 1))
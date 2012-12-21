#lang planet neil/sicp

(define (make-segment A B)
  (cons A B))
(define (start-point S)
  (car S))
(define (end-point S)
  (cdr S))

(define (make-point x y)
  (cons x y))
(define (x-point P)
  (car P))
(define (y-point P)
  (cdr P))

(define (print-point P)
  (newline)
  (display "(")
  (display (x-point P))
  (display ", ")
  (display (y-point P))
  (display ")"))

(define (midpoint S)
  (make-segment (average (x-point (start-point S))
                         (x-point (end-point S)))
                (average (y-point (start-point S))
                         (y-point (end-point S)))))


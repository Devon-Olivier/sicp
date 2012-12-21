#lang planet neil/sicp

(define (fixed-point f guess)
  (define tolerance 0.000001)
  (define (close-enough? a b)
    (< (abs (- a b)) tolerance))
  (define (iter guess)
    (let ((new-guess (f guess)))
      (if (close-enough? guess new-guess)
          new-guess
          (iter new-guess))))
  (iter guess))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (average a b)
  (/ (+ a b) 2))

(define (a^b x n)
  (cond ((= n 0) 1)
        ((even? n) (let ((x^n/2 (a^b x (/ n 2))))
                     (* x^n/2 x^n/2)))
        (else (* x (a^b x (- n 1))))))

(define (root-function n x)
  (lambda (y) (/ x (a^b y (- n 1)))))

(define (damp-root n x num-average-damps)
  (let ((g (root-function n x)))
    (fixed-point ((repeated average-damp num-average-damps) g) 1.0)))

(define (repeated f n)
  (cond  ((= n 1) f)
         ((even? n) (let ((f^n/2 (repeated f (/ n 2))))
                      (compose f^n/2 f^n/2)))
         (else (compose f (repeated f (- n 1))))))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (test-roots from to of-n num-average-damps)
  (define (iter from)
    (display "Testing ") (display from) (display "th root of ") (display of-n)
    (newline)
    (display (a^b (damp-root from of-n num-average-damps) from))
    (newline)
    (if (< from to)
        (iter (+ from 1))))
  (iter from))

(define (logab a b)
  (/ (log b) (log a)))

(define (root n x)
  (damp-root n x (floor (logab 2 n))))

(define (test-root n x)
  (display n) (display "th root of ") (display x) (display ": ") (display (root n x))
  (newline)
  (display (root n x)) (display "^") (display n) (display ": ")
  (display (a^b (root n x) n))
  (newline))
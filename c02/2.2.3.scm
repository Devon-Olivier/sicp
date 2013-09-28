#lang planet neil/sicp

;;compute a mod n
(define (mod a n)
  (remainder a n))
(define (even? n)
  (= (mod n 2) 0))
(define (square n)
  (* n n))

;;compute base^exp mod n
(define (expmod base exp n)
  (cond [(= exp 0) 1]
        [(even? exp) (mod (square (expmod base (/ exp 2) n))
                          n)]
        [else (mod (* base 
                      (square (expmod base (/ (- exp 1) 2) n))) 
                   n)]))
        
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (prime? n times)
  (cond [(= times 0) true]
        [(fermat-test n) (prime? n (- times 1))]
        [else false]))

(define (fold-right op init lst)
  (if (null? lst)
      init
      (op (car lst) (fold-right op init (cdr lst)))))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (fold-right append nil (map proc seq)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))
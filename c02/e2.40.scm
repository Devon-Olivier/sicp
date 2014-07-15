#lang racket

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j)
                    (list i j))
                  (enumerate 1 i)))
           (enumerate 1 n)))

(define (flatmap proc seq)
  (fold-right append null (map proc seq)))

(define (fold-right op init seq)
  (if (null? seq)
      init
      (op (car seq) (fold-right op init (cdr seq)))))

(define (enumerate low high)
  (define (enumerate-iter temp rem)
    (if (> low rem)
      temp
      (enumerate-iter (cons rem temp) (- rem 1))))
  (enumerate-iter null high))

;;compute a mod n
(define (mod a n)
  (remainder a n))
(define (even? n)
  (= (mod n 2) 0))
(define (square n)
  (* n n))

(define (filter predicate? lst)
  (cond [(null? lst) '()]
        [(predicate? (car lst))
         (cons (car lst) (filter predicate? (cdr lst)))]
        [else (filter predicate? (cdr lst))]))

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

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair)) 400))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))    
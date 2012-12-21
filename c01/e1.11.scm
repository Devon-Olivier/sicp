;f(n) = n if n<3 and f(n) = f(n-1) + 2f(n-2) + 3f(n-3) if n>=3
;
;Procedure to compute f by mEans of a recursive process
;rec-f: n -> f(n)
(define (rec-f n)
  (if (< n 3)
    n
    (+ (rec-f (- n 1)) (* 2 (rec-f (- n 2))) (* 3 (rec-f (- n 3))))))


;Procedure to compute f by mEans of an iterative process
;iter-f: n -> f(n)
(define (iter-f n)
  (define (iter a b c count)
    (if (= count 1)
      b
      (iter b c (+ c (* 2 b) (* 3 a)) (- count 1))))
  (if (< n 3)
    n
    (iter 0 1 2 n)))

(define (A x y)
  (cond ((= y 0) 0)
	((= x 0) (* 2 y))
	((= y 1) 2)
	(else (A (- x 1)
		 (A x (- y 1))))))

;using this definition of (A x y) 
;(A 1 10) =>
;(A 0 (A 1 9)) =>
;(A 0 (A 0 (A 1 8))) =>
;(A 0 (A 0 (A 0 (A 1 7)))) =>
;...
;(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1)))))))))) =>
;(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2))))))))) =>
;(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (* 2 2))))))))) =>
;(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (* 2 (* 2 2))))))))) =>
;2^10


;(A 2 4) =>
;(A 1 (A 2 3)) =>
;from above we may conclude, by induction, that (A 1 n) = 2^n.
;Hence (A 2 4) => (A 1 (A 2 3)) = 2^(A 2 3)
;So we evaluate (A 2 3) =>
;(A 1 (A 2 2))
;which is 2^(A 2 2)
;Evaluationg (A 2 2) =>
;(A 1 (A 2 1)) = 2^(A 2 1) = 2 ^2
;Therefore, (A 2 4) = 2^(2^(2^2))


;(A 3 3)
;(A 2 (A 3 2))
;2^2^2^....^2, (A 3 2) times
;(A 3 2) =>
;(A 2 (A 3 1)) =>
;2^2^2^....^2, (A 3 1) = 2 times
;so (A 3 2) = 2^2 and hence (A 3 3) = 2^2^2^2


;(define (f n) (A 0 n)) defines a procedure which computes 2*n
;(define (g n) (A 1 n)) defines a procedure which computes 2^n
;(define (h n) (A 2 n)) defines a procedure which computes 2^2^2^...^2, n times

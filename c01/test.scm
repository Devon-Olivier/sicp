(define (sum f a b)
	(cond ((> a b) 'error)
	      ((= a b) (f a))
	      (else (+ (f a) (sum f (+ a 1) b)))))

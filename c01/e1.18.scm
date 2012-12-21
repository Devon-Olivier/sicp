(define (double a )
  (+ a a))
(define (half a)
  (/ a 2))

(define (mult a b)
  (define (mult-iter a b residue)
    (if (= b 0)
      residue
      (if (even? b)
	(mult-iter (double a) (half b) residue)
	(mult-iter a (- b 1) (+ a residue)))))
  (mult-iter a b 0))

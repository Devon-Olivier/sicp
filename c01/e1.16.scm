;--(expt base exponent) -> base raised to the power of exponent
(define (square n)
  (* n n))

(define (fast-expt base exponent)
  (define (expt-iter base exponent base-residue)
    (if (= exponent 1)
      (* base base-residue)
      (if (even? exponent)
	(expt-iter (square base) (/ exponent 2) base-residue)
	(expt-iter base (- exponent 1) (* base base-residue)))))
  (expt-iter base exponent 1))

(define (calc) 
  (display "calc: ")
  (flush)
  (print (calc-eval (read)))
  (calc))

(define (calc-eval expr)
  (cond ((number? expr) expr)
		((list? expr) (calc-apply (car expr) (map calc-eval (cdr expr))))
		(else (error "calc: bad expression: " expr))))

(define (calc-apply fn args)
  (cond ((= fn '+) (accumulate + 0 args))
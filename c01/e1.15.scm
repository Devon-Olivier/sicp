(define (make-counter )
  (let ((n 0))
    (lambda () (set! n (+ n 1)) 
      n)))

(define (make-counter2)
  ((lambda (n)
     (lambda () 
       (set! n (+ n 1))
       n)) 
   0))

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define count (make-counter))
(define (sine angle)
  (cond ((not (> (abs angle) 
		 0.1))
	 angle)
	(else (display (count))
	      (p (sine (/ angle 3.0))))))
;a. The number of times the procedure p is applied when (sine 12.5) is evaluated is 5.
;	To see this notice that if the argument to sine angle1, is greater than 0.1 p is 
;	called and the next argument to sine is (/ angle1 3.0). This continues until
;	angle1/3^n <= 0.1, where n is the number of times p is called. This means
;	10*angle1 <= 3^n. Which gives
;	n >= log(10*angle1), where logs are taken to base 3.
;	In the case where the angle1 = 12.5, n >= log(10*12.5) = 4.3949206.
;	This implies, since n is a natural number, that n >= 5. Hence when we have
;	called p five times sine would have been given an angle less than or equal to 
;	0.1. This call to sine evaluates to the value of the angle without a call to p.
;
;b. As seen above, the order of growth in number of steps is log(a), where the log is to base 3.
;   The order of growth in space is log(a) also, although we can rewrite the procedure so that
;   the order is constant.

;using the substitution model on 
(define (+ a b)
  (if (= a 0)
    b
    (inc (+ (dec a) b))))
;evaluating (+ 4 5) we get 
;(+ 4 5) =>
;(inc (+ (dec 4) 5))
;(inc (+ 3 5)) =>
;(inc (inc (+ (dec 3) 5)))
;(inc (inc (+ 2 5))) =>
;(inc (inc (inc (+ (dec 2) 5)))) =>
;(inc (inc (inc (+ 1 5)))) =>
;(inc (inc (inc (inc (+ (dec 1) 5))))) =>
;(inc (inc (inc (inc (+ 0 5))))) =>
;(inc (inc (inc (inc 5)))) =>
;(inc (inc (inc 6))) =>
;(inc (inc 7)) =>
;(inc 8) =>
;9
;The chain of deffered procedure calls (inc ...), reveals that the procedure
;+ generates a recursive process. Also, since the length of the chain
;is proportional to the value of a, the generated process is a linear recursive one.


;using the substitution model on
(define (+ a b)
  (if (= a 0)
    b
    (+ (dec a) (inc b))))
;evluating (+ 4 5) we get
;(+ 4 5) =>
;(+ (dec 4) (inc 5))=>
;(+ 3 6)=>
;(+ (dec 3) (inc 6))=>
;(+ 2 7)=>
;(+ (dec 2) (inc 7))=>
;(+ 1 8)=>
;(+ (dec 1) (inc 8))=>
;(+ 0 9)=>
;9
;The state of this process is captured in the values of parameters a and b
;there are no deffered procedure calls. Therefore the process generated 
;by this procedure is iterative. The number of steps is proportional 
;to a so the generated process is a linear iterative one.

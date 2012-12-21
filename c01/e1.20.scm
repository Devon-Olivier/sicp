;;Evaluating normal order
(gcd 206 40)
(gcd 40 (remainder 206 40))
(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
(gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 
     (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
(remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;;The remainders in the second argunments of the calls to gcd are all evaluated in determining the value of the if
;;expression in the body of gcd. There are 14 of these. The last expression evaluated has 4 remainder expressions 
;;to evaluate so there are 18 remainder operations to be performed.


;;Evaluating in applicative order
(gcd 206 40)
(gcd 40 (remainder 206 40));;1 remainder evaluated here
(gcd 40 6)
(gcd 6 (remainder 40 6));;1 remainder evaluated here
(gcd 6 4)
(gcd 4 (remainder 6 4));;1 remainder evaluated here
(gcd 4 2)
(gcd 2 (remainder 4 2));;1 remainder evaluated here
(gcd 2 0)
2
;;As indicated by the results 4 remainder operations are performed in the applicative-order evaluation of (gcd 206 40)

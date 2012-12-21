;This is my versoin of the code to count change which avoids the function first-denomination
;(count-change amount coins) -> number of ways of making change for amount cents using denominations
;specified in coins
;amount: number
;coins: list of numbers representing coin denomination
;(= (count-change 11) 4) is true 
(define (count-change amount coins)
  (cond ((= amount 0) 1)
	((or (< amount 0) (null? coins)) 0)
	(else (+ (count-change amount (cdr coins))
		 (count-change (- amount (car coins))
			       coins)))))

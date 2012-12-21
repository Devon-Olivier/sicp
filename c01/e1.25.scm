;;The function would work but for small values of exp.
;;After reading the footnote 46 I became aware of this.
;;I was thinking it was perfectly ok to use the function.
;;Defining it as Abelson et al did allows for the computation
;;to be done based on small values viz the remainders which are
;;always less than m
;;Alysa's function:
(define (expmod base exp m)
  (remainder (fast-exp base exp) m))

#lang planet neil/sicp

(define (accumulater operation initial sequence)
  (cond ((null? sequence) initial)
        (else (operation (car sequence)
                         (accumulateR operation 
                                      initial 
                                      (cdr sequence))))))

;;I find this just bad!!!
;;Beautiful...
(define (accumulater-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulater op init (map car seqs))
            (accumulater-n op init (map cdr seqs)))))
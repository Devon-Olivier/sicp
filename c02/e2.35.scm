#lang planet neil/sicp

(define (accumulatel operation initial sequence)
  (cond ((null? sequence) initial)
        (else (accumulatel operation (operation initial (car sequence))
                          (cdr sequence)))))

(define (accumulater operation initial sequence)
  (cond ((null? sequence) initial)
        (else (operation (car sequence)
                         (accumulateR operation 
                                      initial 
                                      (cdr sequence))))))

(define (count-leaves t)
  (accumulater (lambda (l r)
                 (cond ((pair? l)(+ (count-leaves l)
                                    r))
                       (else (+ 1 r))))
               0
               t))


(define (count-leaves-2 t)
  (accumulater + 0 (map (lambda (x)
                          (if (pair? x)
                              (count-leaves-2 x)
                              1))
                        t)))
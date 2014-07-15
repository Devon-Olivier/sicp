(define (make-mobile left right)
  (list left right))
(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  ;if we used cons in constructor then
  ;this would be (cdr branch))
  (car (cdr mobile)))

(define (make-branch length structure)
  (list length structure))
(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  ;if we used cons in constructor then
  ;this would be (cdr branch))
  (car (cdr branch)))

(define (structure-is-number? branch)
  (number? (branch-structure branch)))
(define (branch-weight branch)
  (if (structure-is-number? branch)
    (branch-structure branch)
    (total-weight (branch-structure branch))))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile)) (branch-weight (right-branch mobile))))

(define b1 (make-branch 1 1))
(define b2 (make-branch 2 2))
(define b3 (make-branch 3 3))
(define m1 (make-mobile b1 b2))
(define b4 (make-branch 4 m1))

(define m (make-mobile b4 b3))

(display (total-weight m))

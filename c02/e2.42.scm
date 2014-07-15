#lang racket
(require lang/posn)

(define (flatmap proc seq)
  (fold-right append null (map proc seq)))

(define (fold-right op init seq)
  (if (null? seq)
      init
      (op (car seq) (fold-right op init (cdr seq)))))

(define empty-board '())

(define (enumerate-interval low high)
  (define (enumerate-iter temp rem)
    (if (> low rem)
        temp
        (enumerate-iter (cons rem temp) (- rem 1))))
  (enumerate-iter null high))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(define (adjoin-position row col positions)
  (append positions (list (make-posn row col))))

;;Sets of board positions will be represented by
;;lists of posns (lang/posn)
(define row posn-x)
(define col posn-y)

(define (same-column? p q)
  (eq? (col p) (col q)))

(define (same-row? p q)
  (eq? (row p) (row q)))

(define (same-diagonal? p q)
  (eq? (abs (- (row p)
               (row q)))
       (abs (- (col p)
               (col q)))))

(define (safe? k positions)
  (let [(k-column-position (list-ref positions (- k 1)))
        (k-1-positions (take positions (- k 1)))]
    (andmap (lambda (position)
              (not (or (same-row? k-column-position
                                  position)
                       (same-column? k-column-position
                                     position)
                       (same-diagonal? k-column-position
                                       position))))
            k-1-positions)))

(define (number-of-ways board-size)
  (length (queens board-size)))

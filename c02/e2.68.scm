#lang racket
(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
(define (leaf? tree)
  (eq? (car tree) 'leaf))
(define symbol-leaf cadr)
(define weight-leaf caddr)

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left)
                (symbols right))
        (+ (weight left)
           (weight right))))
(define left-branch car)
(define right-branch cadr)
(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (weight tree)
  (cond [(leaf? tree) (weight-leaf tree)]
        [else (cadddr tree)]))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set) (adjoin-set x (cdr set))))))

(define (choose-branch bit tree)
  (cond [(= bit 0) (left-branch tree)]
        [(= bit 1) (right-branch tree)]
        [else (error "bad bit --CHOOSE-BRANCH" bit)]))

(define (decode bits tree)
  (define (get-leaves-from bit-sublist subtree)
    (if (null? bit-sublist)
        '()
        (let [(branch (choose-branch (car bit-sublist) subtree))]
          (if (leaf? branch)
              (cons (symbol-leaf branch)
                    (get-leaves-from (cdr bit-sublist) tree))
              (get-leaves-from (cdr bit-sublist) branch)))))
  (get-leaves-from bits tree))

#;(define (encode-symbol symbol tree)
    (cond [((not (element-of? symbol (symbols tree)))
            (error "symbol not in tree --ENCODE-SYMBOL" symbol))
           (else (let [(left (left-branch tree))
                       (right (right-branch tree))]
                   (if (element-of? symbol (symbols left))
                       (cons 0 (if (leaf? left)
                                   '()
                                   (encode-symbol symbol left)))
                       (cons 1 (if (leaf? right)
                                   '()
                                   (encode-symbol symbol right))))))]))
(define (encode-symbol symbol tree)
  (cond ((not (memv symbol (symbols tree)))
          (error "symbol not in tree --ENCODE-SYMBOL" symbol))
         ((leaf? tree) '())
         (else (let [(left (left-branch tree))
                     (right (right-branch tree))]
                 (if (memv symbol (symbols left))
                     (cons 0 (encode-symbol symbol left))
                     (cons 1 (encode-symbol symbol right)))))))
(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))

(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(encode (decode sample-message sample-tree) sample-tree)

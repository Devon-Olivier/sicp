#lang racket
(define make-tree list)
(define entry car)
(define left-branch cadr)
(define right-branch caddr)
(define empty-tree? null?)

(define (tree->list tree)
  (cond [(empty-tree? tree) '()]
        [else (append (tree->list (left-branch tree))
                      (cons (entry tree)
                            (tree->list (right-branch tree))))]))

;;return the union of two sets represented as ordered
;;lists
(define (union-list l1 l2)
  (cond [(null? l1) l2]
        [(null? l2) l1]
        [(eq? (car l1) (car l2))
         (cons (car l1)
               (union-list (cdr l1)
                           (cdr l2)))]
        [(> (car l1) (car l2))
         (cons (car l2)
               (union-list l1
                           (cdr l2)))]
        [else (cons (car l1)
                    (union-list (cdr l1)
                                l2))]))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))
(define (partial-tree elements n)
  (if (= n 0)
      (cons '() elements)
      #|just for instructive purposes I implement this function
      slightly different to sicp. For trees with an even number
of nodes the book's version puts the unballanced portion in the
left subtree. Mine puts it on the left.|#
      (let [(left-size (quotient n 2))]
        (let [(left-partial (partial-tree elements left-size))]
          (let [(left-subtree (car left-partial))
                (rest-of-tree-list (cdr left-partial))]
            (let [(this-entry (car rest-of-tree-list))
                  (right-size (- n left-size 1))
                  (right-subtree-list (cdr rest-of-tree-list))]
              (let [(right-partial (partial-tree right-subtree-list right-size))]
                (cons (make-tree this-entry left-subtree (car right-partial))
                      (cdr right-partial)))))))))

;;this is a simpler implementation of list->tree
;;not sure why you would want it implemented any
;;other way
(define (dlist->tree lst)
  (cond [(null? lst) '()]
        [else (let* [(left-size (quotient (length lst) 2))
                     (left-list (take lst left-size))
                     (entry (list-ref lst left-size))
                     (right-list (drop lst (+ 1 left-size)))]
                (make-tree entry
                           (dlist->tree left-list)
                           (dlist->tree right-list)))]))


;;return the union of two sets represented as binary
;;trees. The union is a ballanced binary tree.
(define (union-set A B)
  (let [(A-list (tree->list A))
        (B-list (tree->list B))]
    (dlist->tree (union-list A-list B-list))))
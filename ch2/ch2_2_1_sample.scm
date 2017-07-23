#lang scheme

;; n = 0　-> 'list-ref' returns a list of car
;; else -> 'list-ref' returns a rest of list the (n - 1) cdr
;; items: list, n: extraction number
(define (list-ref items n) (if (= n 0) (car items) (list-ref (cdr items) (- n 1))))
(define squares (list 1 4 9 16 25))
(list-ref squares 3)

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define odds (list 1 3 5 7 9))
(length odds)

(define (scale-list items factor)
  (if (null? items)
      null
      (cons (* (car items) factor)
            (scale-list (cdr items) factor))))

(scale-list (list 1 2 3 4 5) 10)

#|
(define (scale-list items factor)
  (map (lambda (x) (* x factor)) items))
|#
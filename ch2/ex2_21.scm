#lang scheme

(define (scheme-list items)
  (if (null? items)
      null
      (cons (* (car items) (car items)) b)))
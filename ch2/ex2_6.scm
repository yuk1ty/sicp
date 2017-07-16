#lang scheme

;; 2.6
(define (zero n) (lambda (f) (lambda (x) x)))
(define (add-1 n) (lambda (f) (lambda (x) (f (n f) x))))

(define (one n) (lambda (f) (lambda (x) f x)))
(define (two n) (lambda (f) (lambda (x) (f (f x)))))
(define (three n) (lambda (f) (lambda (x) (f (f (f x))))))
(define (incremental n) (lambda (f) (lambda (x) (+ x 1))))
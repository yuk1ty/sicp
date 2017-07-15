#lang racket

;;
(define (make-rat n d) (cons n d))

(define (numer x) (car x))

(define (denom x) (cdr x))

;; Arithmetic Operations
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))
  )
)

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom y)))
            (* (denom x) (denom y))
  )
)

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (numer y))
  )
)

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))
  )
)

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))
  )
)

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x))
)

;; testing
(define one-half (make-rat 1 2))
(define one-third (make-rat 1 3))
(print-rat (add-rat one-half one-third))
(print-rat (sub-rat one-half one-third))
(print-rat (mul-rat one-half one-third))
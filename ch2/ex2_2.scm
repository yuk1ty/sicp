#lang scheme

;; ex 2.2
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
)

(define (make-point s e) (cons s e))
(define (x-point x) (car x))
(define (y-point y) (cdr y))

(define (make-segment xp yp) (cons xp yp))
(define (start-segment sp) (car sp))
(define (end-segment ep) (cdr ep))

(define (middle-segment segment)
   ;; ((x1 + x2) / 2 , (y1 + y2) / 2)
   (make-point (/ (+ (x-point (start-segment segment)) (x-point (end-segment segment))) 2)
               (/ (+ (y-point (start-segment segment)) (y-point (end-segment segment))) 2))
)

;; test
(print-point (make-segment (make-point 1 2) (make-point 3 4)))
(print-point (middle-segment (make-segment (make-point 1 2) (make-point 3 4))))
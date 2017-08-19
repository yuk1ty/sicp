#lang scheme

(define (cons-stream cns proc) (cons cns (delay proc)))
(define (stream-car stream) (car stream))
(define (stream-cdr stream) (force (cdr stream)))
(define (stream-null? stream) (null? stream))
(define (the-empty-stream) '())

(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))

(define (stream-map proc s)
  (if (stream-null? s)
      the-empty-stream
      (cons-stream (proc (stream-car s))
                   (stream-map proc (stream-cdr s)))))

(define (stream-for-each proc a)
  (if (stream-null? a)
      'done
      (begin (proc (stream-car a))
             (stream-for-each proc (stream-cdr a)))))

;; TODO memo-proc
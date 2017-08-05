#lang scheme

;; ex: 3.2
;; solution

(define (sqrt x) (* x x))

(define (make-monitored proc)
  (let ((count 0))
    (lambda (arg)
      (cond ((eq? arg 'how-many-calls?) count)
            ((eq? arg 'reset-count) (set! count 0))
            (else (begin (set! count (+ count 1))
                         (proc arg)))))))
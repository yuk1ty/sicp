#lang scheme

;; ch3.4.2

(define (make-account balance)
        (define (withdraw amount)
          (if (>= balance amount)
              (begin (set! balance (- balance amount)) balance)
              "Insufficient funds"))
        (define (deposit amount)
          (set! balance (+ balance amount)) balance)
        (let ((protected (make-serializer))) ;; "unbound identifier in module in error has been occured. why?"
          (define (dispatch m)
            (cond ((eq? m 'withdraw) (protected withdraw))
                  ((eq? m 'deposit) (protected deposit))
                  ((eq? m 'balance) balance)
                  (else (error "Unkown request -- MAKE-ACCOUNT" m))))
          dispatch)
  )

(define (make-serializer)
  (let ((mutex (make-mutex)))
    (lambda (p)
      (define (serialized-p . args)
        (mutex 'acuire)
        (let ((val (apply p args)))
          (mutex 'release)
          val))
      serialized-p)))

;; "if: missing an "else" expression in で怒られる"
(define (make-mutex)
  (let ((cell (list #f)))
    (define (the-mutex m)
      (cond ((eq? m 'acquire)
             (if (test-and-set! cell)
                 (the-mutex 'acquire))) ;; retry
            ((eq? m 'release) (clear! cell))))
    the-mutex))

(define (clear! cell)
  (set-car! cell false))

(define (test-and-set! cell)
  (if (car cell)
      true
      (begin (set-cat! cell true)
             false)))
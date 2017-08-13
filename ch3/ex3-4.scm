#lang scheme

;; ex3-4 solution
;; TODO まだ途中

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch p m)
    (cond ((not (eq? p password)) (lambda (x) "Incorrect password"))
      ((eq? m 'withdraw) withdraw)
      ((eq? m 'deposit) deposit)
      (else (error "Unknown request -- MAKE-ACCOUNT"
                   m))))
  dispatch)

;; testing
(define acc (make-account 100 'secret-password))
((acc 'secret-password 'withdraw) 60)
((acc 'some-other-password 'withdraw) 100) ;; fail to withdraw because the password is incorrect.

#lang scheme

;; 3.2.3

;; make-witdrawの大域環境を定義する。
(define (make-withdraw balance)
  (lambda (amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds")))

;; W1 の環境を定義する。
;; W1 (balance: 100)
(define W1 (make-withdraw 100))
;; make-withdrawの中のlambdaを呼び出す。
;; W1[lambda] (amount: 50)
;; W1[lambda] が呼び出される。
;; W1[lambda] = (100 - 50) = 50
(W1 50)

(define W2 (make-withdraw 100))
(W2 50) ;; 50

(define (make-withdraw-let initial-amount)
  (let ((balance initial-amount))
    (lambda (amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                 balance)
          "Insufficient funds"))))

(define E1 (make-withdraw-let 100))

;; 上から順番に何が起きるかを命令型っぽく記述してみると、
;; E1[let] (balance = initial-amount)
;; E1[lambda] (balance > amount) ? (balance = (balance - amount)) : "Insufficient funds"
(E1 60)

;; begin?
;; begin は与えられた式をから順番に、最後の式の値を返す。
(define foo
  (begin
    (display "Hello?")
    (newline)
    (display "Sleepy?")
    (newline)
    (display "Yes!")
    (newline)
    `done))
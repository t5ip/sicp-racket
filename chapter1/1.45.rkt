#lang sicp

(#%require "average-damp.rkt")
(#%require "fixed-point.rkt")
(#%require "1.43.rkt")

(define (pow x n)
  (cond ((= n 0) 1)
  (else (* x (pow x (- n 1))))))

(define (g x n)
  (lambda (y) (/ x (pow y n))))

(define (n-root x n guess)
  (fixed-point ((repeated average-damp n) (g x (- n 1))) guess))

; Test. Note add .0 to do calculations using floating point arithmetic.
; Otherwise the calculation will take too long.
(n-root 65536.0 2 1)
(n-root 27.0 3 1)
(n-root 9765625.0 10 1)
#lang sicp

(#%require "fixed-point.rkt")

(define dx 0.00001)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x )))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (square x) (* x x))

(define (cube x)
  (* (square x) x))

(define (cubic a b c)
  (lambda (x)
    (+ (+ (cube x) (+ (* a (square x)))) c)))

; Test. Result of the below should be near zero
((cubic 5 4 3) (newtons-method (cubic 5 4 3) 1))
; Another test
((cubic 53 41 32) (newtons-method (cubic 53 41 32) 1))
#lang sicp

(#%require "1.43.rkt")

(define dx 0.00001)

(define (smooth f)
  (lambda (x)
    (/ (+ (+ (f (+ x dx))
             (f (- x dx)))
       (+ (f x))) 3)))

(define (n-fold-smooth f n)
  (lambda (x) (((repeated smooth n) f) x)))
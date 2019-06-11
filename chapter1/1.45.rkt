#lang sicp

(#%require "average-damp.rkt")
(#%require "fixed-point.rkt")
(#%require "1.43.rkt")

(define (pow x n)
  (cond ((= n 0) 1)
  (else (* x (pow x (- n 1))))))

(define (g x n)
  (lambda (y) (/ x (pow y n))))

(define (n-root x n)
  (fixed-point (average-damp (g x (- n 1))) 1))


#lang sicp

(#%require "average-damp.rkt")
(#%require "fixed-point.rkt")
(#%require "1.43.rkt")

(define (g x)
  (lambda (y) (/ x y)))

(define (sqrt x)
  (fixed-point (average-damp (g x)) 1))


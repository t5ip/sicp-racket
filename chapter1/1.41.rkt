#lang sicp

(define (inc x)
  (+ x 1))

(define step 0)

(define (double g)
  (lambda (x)
    (display (g (g x)))
    (newline)
    (g (g x))))

(((double (double double)) inc) 5)

;(((double double) inc) 5)
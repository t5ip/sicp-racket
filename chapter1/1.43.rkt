#lang racket

(define (inc x)
  (+ x 1))

(define (square x)
  (* x x))

(define (repeat f x n)
  (cond ((= 1 n)
         (f x))
        (else
         (repeat f (f x) (- n 1)))))

(define (repeated f n)
  (lambda (x)
    (repeat f x n)))

;((repeated square 2) 5)

(provide repeat)

(provide repeated)
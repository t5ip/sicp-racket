#lang sicp

(define (iterate guess x good-enough? improve)
  (cond ((good-enough? guess x) guess)
        (else (iterate (improve guess x) x good-enough? improve))))

(define (iterative-improve good-enough? improve)
  (lambda (guess x) (iterate guess x good-enough? improve)))

; sqrt

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (improve-sqrt guess x)
  (average guess (/ x guess)))

(define (good-enough-sqrt? guess x)
  (< (abs (- (square guess) x)) 0.001))
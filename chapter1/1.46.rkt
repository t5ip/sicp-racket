#lang sicp

(define (iterative-improve good-enough? improve)
  (define (iterate guess x)
  (cond ((good-enough? guess x) guess)
        (else (iterate (improve guess x) x))))
  (lambda (guess x) (iterate guess x)))

; sqrt

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (improve-sqrt guess x)
  (average guess (/ x guess)))

(define (good-enough-sqrt? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  ((iterative-improve good-enough-sqrt? improve-sqrt) 1.0 x))

;test 

(sqrt 2)
(sqrt 9)
(sqrt 10000)
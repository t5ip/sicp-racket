#lang sicp

(define (iterative-improve good-enough? improve)
  (define (iterate guess x)
  (cond ((good-enough? guess x)
         (newline)
         (display guess)
         guess)
        (else (iterate (improve guess x) x)
              (newline)
              (display guess))))
  (lambda (guess x) (iterate guess x)))

; sqrt

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (improve-sqrt guess x)
  (average guess (/ x guess)))

(define (good-enough-sqrt? guess x)
  (< (abs (- (square guess) x)) 0.0000001))

(define (sqrt x)
  ((iterative-improve good-enough-sqrt? improve-sqrt) 1.0 x))

;test
(newline)
(display "sqrt 2")
(sqrt 2)
(newline)
(display "sqrt 9")
(sqrt 9)
(newline)
(display "sqrt 10000")
(sqrt 10000)

; fixed-point
(newline)
(display "fixed point sin(x) + cos(x)")

(define (f x)
  (+ (sin x) (cos x)))

(define (improve-fp guess x)
  (f guess))

(define (good-enough-fp? guess x)
  (< (abs (- (f guess) guess)) 0.0000001))

(define (fp guess)
  ((iterative-improve good-enough-fp? improve-fp) guess guess))

(fp 1)
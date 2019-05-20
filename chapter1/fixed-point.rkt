#lang racket

; Note that this file needs to be in racket lang because this
; file uses "provide".

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess step)
    (display step)
    (display " ")
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next (+ step 1)))))
  (try first-guess 0))

(provide fixed-point)
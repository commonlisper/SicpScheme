#lang racket

; Упражнение 1.8.
; Метод Ньютона для кубических корней основан на том, что если y является приближением к
; кубическому корню из x, то мы можем получить лучшее приближение по формуле
; (x/y^2 + 2y)
; ------------
;      3
; С помощью этой формулы напишите процедуру вычисления кубического корня, подобную проце-
; дуре для квадратного корня. (В разделе 1.3.4 мы увидим, что можно реализовать общий метод
; Ньютона как абстракцию этих процедур для квадратного и кубического корня.)
;-------------------------------------------------------------------
(define (cube-root-iter guess prev-guess x)
  (if (good-enough? guess prev-guess)
      guess
      (cube-root-iter (improve guess x)
                      guess
                      x)))

(define (square x) (* x x))
(define (cube x) (* (square x) x))

(define (good-enough? guess prev-guess)
  (< (abs (/ (- guess prev-guess) prev-guess)) 0.001))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess))
     3))

(define (cube-root x)
  (cube-root-iter 1.0 0.5 x))
;-------------------------------------------------------------------
(cube-root 8)
(cube-root 27)
(cube-root 216)
;===================================================================
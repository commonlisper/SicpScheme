#lang racket

; Упражнение 1.42.
; Пусть f и g — две одноаргументные функции. По определению, композиция (composition) f и
; g есть функция x 7→ f(g(x)). Определите процедуру compose которая реализует композицию.
; Например, если inc — процедура, добавляющая к своему аргументу 1,
; ((compose square inc) 6)
; 49
;------------------------------------------------------------------
(define (compose f g)
  (lambda (x) (f (g x))))

(define (square x) (* x x))
(define (inc x) (+ x 1))

((compose square inc) 6)
((compose square square) 2)
;==================================================================
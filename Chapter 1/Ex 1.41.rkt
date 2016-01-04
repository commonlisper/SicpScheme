#lang racket

; Упражнение 1.41.
; Определите процедуру double, которая принимает как аргумент процедуру с одним аргументом и
; возвращает процедуру, которая применяет исходную процедуру дважды. Например, если проце-
; дура inc добавляет к своему аргументу 1, то (double inc) должна быть процедурой, которая
; добавляет 2. Скажите, какое значение возвращает
; (((double (double double)) inc) 5)
;------------------------------------------------------------------
(define (double f)
  (lambda (x) (f(f x))))

(define (inc a) (+ a 1))

((double inc) 5)

(((double double) inc) 5)
;------------------------------------------------------------------
(((double (double double)) inc) 5) ; 21
; ((double double) inc) == увеличивет на 4 аргумент
; (((double (double double)) inc) == еще раз удваивает предыдущий 4 * 4 = 16
; 5 + 16 = 21
;==================================================================
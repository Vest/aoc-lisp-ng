(in-package #:aoc-lisp-ng/2025)

(defparameter *scanner* (ppcre:create-scanner "^(\\d+)\\1+$"))

(defun show-answers-03 (input)
  (let ((part-a (show-part-03-a input))
        (part-b (show-part-03-b input)))
    (print (format t "Day 3: ~a, ~a~%" part-a part-b))))

(defun show-part-03-a (input)
  (let* ((lines (str:lines input)))
    (apply #'+ (mapcar #'find-max-pair lines))))

(defun show-part-03-b (input)
  input)

(defun generate-pairs (line)
  (let* ((chars (coerce line 'list))
         (nums (mapcar #'digit-char-p chars))
         (length (length line))
         (arr (make-array length :initial-contents nums)))
    (loop for i from 0 below (- length 1)
      append (loop for j from (+ i 1) below length
                   collect (+ (* (aref arr i) 10) (aref arr j))))))

(defun find-max-pair (input)
  (apply #'max (generate-pairs input)))

 ;(generate-pairs "123")
 ;(find-max-pair "123")

;(show-part-03-a "987654321111111
;811111111111119
;234234234234278
;818181911112111")

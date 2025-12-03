(in-package #:aoc-lisp-ng/2025)

(defparameter *scanner* (ppcre:create-scanner "^(\\d+)\\1+$"))

(defun show-answers-02 (input)
  (let ((part-a (show-part-02-a input))
        (part-b (show-part-02-b input)))
    (print (format t "Day 2: ~a, ~a~%" part-a part-b))))

(defstruct range
   (start "start value" :type integer)
   (end   "end value"   :type integer))

(defun parse-range (line)
  (let* ((pair (str:split "-" line))
         (start (parse-integer (first pair)))
         (end (parse-integer (second pair))))
    (make-range :start start :end end)))

(defun parse-input (line)
  (let* ((pairs (str:split "," line)))
    (mapcar #'parse-range pairs)))

(defun is-num-split (num)
  (let* ((digits-count (+ (truncate (log num 10)) 1)))
    (cond ((oddp digits-count) NIL)
          (T (let* ((half (/ digits-count 2))
                    (tens (expt 10 half)))
                (multiple-value-bind (f r)
                    (floor num tens)
                  (= f r)))))))


(defun generate-list (rng)
  (loop for n from (range-start rng) to (range-end rng) collect n))

(defun filter-non-split-nums (rng)
  (let ((l (generate-list rng)))
    (remove-if-not #'is-num-split l)))

(defun is-num-invalid (num)
  (let* ((str (write-to-string num)))
    (ppcre:scan *scanner* str)))

(defun filter-invalid-nums (rng)
  (let ((l (generate-list rng)))
    (remove-if-not #'is-num-invalid l)))

(defun show-part-02-a (input)
  (let* ((ranges (parse-input input))
         (nums (mapcar #'(lambda (rng) (apply #'+ (filter-non-split-nums rng))) ranges)))
    (apply #'+ nums)))

(defun show-part-02-b (input)
  (let* ((ranges (parse-input input))
         (nums (mapcar #'(lambda (rng) (apply #'+ (filter-invalid-nums rng))) ranges)))
    (apply #'+ nums)))


; (show-part-02-a "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124")
; (show-part-02-b "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124")


;(parse-range "1-4")
;(parse-input "1-4,5-7")
;(is-num-split 1011)
;(generate-list (parse-range "1-4"))
;(filter-non-split-nums (parse-range "11-22"))
;(count-split-nums (parse-range "38593856-38593862"))
;(is-num-invalid 38593859)

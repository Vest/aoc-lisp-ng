(in-package #:aoc-lisp-ng/2025)

(defparameter *scanner* (ppcre:create-scanner "^(\\d+)\\1+$"))

(defun show-answers-04 (input)
  (let ((part-a (show-part-04-a input))
        (part-b (show-part-04-b input)))
    (print (format t "Day 4: ~a, ~a~%" part-a part-b))))

(defun show-part-04-a (input)
  (let* ((field (make-field input))
         (rank (array-dimension field 0))
         (count 0))
    (loop for row from 0 below rank do 
      (loop for col from 0 below rank
            when (and (eq #\@ (read-field field row col))
                      (< (count-field-neighbors field row col) 4))
              do (incf count)))
    count))

(defun show-part-04-b (input)
  input)

(defun make-field (input)
  (let* ((lines (str:lines input))
         (rank (length lines)) ; we assume that array is a square array
         (field (make-array (list rank rank) :initial-element #\.))) 
   (loop for i from 0 below rank do
     (loop for j from 0 below rank do
       (setf (aref field i j)
             (char (nth i lines) j))))
    field))

(defun read-field (field row col)
  (let ((value (ignore-errors (aref field row col))))
    (or value #\.)))

(defun count-field-neighbors (field row col)
  (let* ((neighbors (list (read-field field (- row 1) (- col 1))
                           (read-field field (- row 1) col)
                           (read-field field (- row 1) (+ col 1))
                           (read-field field row (- col 1))
                           (read-field field row (+ col 1))
                           (read-field field (+ row 1) (- col 1))
                           (read-field field (+ row 1) col)
                           (read-field field (+ row 1) (+ col 1))
                           )))
    (count-if (lambda (x) (eq x #\@)) neighbors)))

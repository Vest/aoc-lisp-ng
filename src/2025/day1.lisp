(defpackage #:aoc-lisp-ng/2025
  (:use :cl)
  (:local-nicknames (#:d #:aoc-lisp-ng/downloader)
                    (#:s :str))
  (:import-from #:aoc-lisp-ng/downloader #:download-input-as-string)
  (:export #:show-answers-01 #:show-answers-02))

(in-package #:aoc-lisp-ng/2025)

(defstruct command
   (dir "direction" :type character)
   (steps "number of steps" :type integer))

(defun parse-command (line)
  (let* ((dir (char line 0))
         (steps (parse-integer (subseq line 1))))
    (make-command :dir dir :steps steps)))


(defun show-answers-01 (input)
  (let ((part-a (show-part-a input))
        (part-b (show-part-b input)))
    (print (format t "Day 1: ~a, ~a~%" part-a part-b))))


(defun show-part-a (input)
  (let* ((lines (s:lines input))
         (current-value 50)
         (answer 0))

    (dolist (line lines)
      (let ((cmd (parse-command line)))
        (cond ((eq #\L (command-dir cmd)) (decf current-value (command-steps cmd)))
              ((eq #\R (command-dir cmd)) (incf current-value (command-steps cmd)))
              (t (print "none"))))
      (setf current-value (rem current-value 100))
      (if (= 0 current-value) (incf answer)))

   answer))

(defun show-part-b (input)
  (let* ((lines (s:lines input))
         (previous-value 50)
         (current-value 50)
         (answer 0))

    (dolist (line lines)
      (let ((cmd (parse-command line)))
        (cond ((eq #\L (command-dir cmd)) (decf current-value (command-steps cmd)))
              ((eq #\R (command-dir cmd)) (incf current-value (command-steps cmd)))
              (t (print "none"))))
      (if (and (not (eq (signum previous-value) (signum current-value)))
               (not (eq 0 (signum previous-value))))
          (incf answer))
      (let* ((times (floor (abs current-value) 100)))
        (incf answer times))
      (setf current-value (rem current-value 100))
      (setf previous-value current-value))

   answer))


; (show-part-a (s:unlines '("L68" "L30" "R48" "L5" "R60" "L55" "L1" "L99" "R14" "L82")))
; (show-part-b (s:unlines '("L68" "L30" "R48" "L5" "R60" "L55" "L1" "L99" "R14" "L82")))

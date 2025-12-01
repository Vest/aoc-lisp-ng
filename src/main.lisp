(uiop:define-package aoc-lisp-ng
  (:use #:cl)
  (:import-from #:aoc-lisp-ng/downloader #:download-input-as-string))
(in-package #:aoc-lisp-ng)

;; blah blah blah.
(defun main ()
    (let ((input (aoc-lisp-ng/downloader:download-input-as-string 2025 1)))
      (aoc-lisp-ng/2025:show-answers-01 input)))

(main)

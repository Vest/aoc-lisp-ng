(defpackage #:aoc-lisp-ng
  (:use #:cl #:aoc-lisp-ng/2025)
  (:import-from #:aoc-lisp-ng/downloader #:download-input))
(in-package #:aoc-lisp-ng)

;; blah blah blah.
(defun main ()
    (let ((input (aoc-lisp-ng/downloader:download-input 2025 4)))
      (show-answers-04 input)))

(main)

(defpackage #:aoc-lisp-ng/downloader
  (:use :cl)
  (:local-nicknames (#:u :uiop))
  (:import-from :uiop #:run-program #:directory-files #:subdirectories)
  (:export #:download-input))

(in-package #:aoc-lisp-ng/downloader)

(defparameter *session-cookie* (u:read-file-string "data/session.txt"))

(defun download-input (day year)
  year)

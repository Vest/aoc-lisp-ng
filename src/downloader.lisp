(defpackage #:aoc-lisp-ng/downloader
  (:use :cl)
  (:local-nicknames (#:u :uiop))
  (:import-from :uiop #:run-program #:directory-files #:subdirectories)
  (:export #:download-input))

(in-package #:aoc-lisp/downloader))

(defparameter *session-cookie* (u:read-file-line "session.txt"))

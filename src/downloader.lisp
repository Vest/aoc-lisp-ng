(defpackage #:aoc-lisp-ng/downloader
  (:use :cl)
  (:local-nicknames (#:u :uiop)
                    (#:dex :dexador))
  (:import-from :uiop #:run-program #:directory-files #:subdirectories)
  (:export #:download-input))

(in-package #:aoc-lisp-ng/downloader)

(defparameter *session-cookie* (u:read-file-string "data/session.txt"))

(defparameter *cookie-jar*
  (cl-cookie:make-cookie-jar
   :cookies (list (cl-cookie:make-cookie
	     :name "session"
	     :value *session-cookie*
	     :domain ".adventofcode.com"
	     :max-age 3600))))

(defun download-input-as-string (year day)
  "Download an input and return it as a string"
  (let* ((url (format nil "https://adventofcode.com/~D/day/~D/input" year day)))
    (dex:get url :cookie-jar *cookie-jar*)))


(defun write-file (input-text path-pathname)
  "Writes text to a file."
  (ensure-directories-exist path-pathname)
  (with-open-file (text-to-write path-pathname
				 :direction :output
				 :if-exists nil
				 :if-does-not-exist :create)
    (format text-to-write "~a" input-text)))

(defun download-input (year day)
  "Entry point for the downloader. Will take in an day as a number and check for existing file.
If file exists, it will do nothing, if not it will download and create it."
  (let* ((path-string (format nil "data/~D/~D.txt" year day))
         (path-pathname (asdf:system-relative-pathname :aoc-lisp-ng path-string)))
    (if (not (probe-file path-pathname))
      (let ((input-text (download-input-as-string year day)))
        (write-file input-text path-pathname))
      (u:read-file-string path-pathname))))


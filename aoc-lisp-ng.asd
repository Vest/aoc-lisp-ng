(defsystem #:aoc-lisp-ng
  :version "0.0.1"
  :author "Vest <Vest@users.noreply.github.com>"
  :license "MIT"
  :depends-on (:dexador :cl-cookie :str :alexandria :uiop)
  :components ((:module "src"
                :serial t
                :components
                ((:file "main")
                 (:file "downloader")
                 (:module "2025"
                  :serial t
                  :depends-on ("downloader")
                  :components
                  ((:file "day1"))))))
  :description "aoc-lisp-ng is an attempt to solve at least few days during AoC 2018"
  :in-order-to ((test-op (test-op :aoc-lisp-ng/tests))))

(defsystem #:aoc-lisp-ng/tests
  :author "Vest"
  :license "MIT"
  :description "Test for aoc-lisp-ng, or at least an attempt to have it"
  :depends-on (:aoc-lisp-ng
               :rove)
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for aoc-lisp-ng"
  :perform (test-op (op c) (symbol-call :rove :run c)))

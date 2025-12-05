(defsystem #:aoc-lisp-ng
  :version "0.0.1"
  :author "Vest <Vest@users.noreply.github.com>"
  :license "MIT"
  :depends-on (:dexador :cl-cookie :str :alexandria :uiop :cl-ppcre)
  :components ((:module "src"
                :serial t
                :components
                ((:file "downloader")
                 (:module "2025"
                  :serial t
                  :depends-on ("downloader")
                  :components
                  ((:file "package")
                   (:file "day1" :depends-on ("package"))
                   (:file "day2" :depends-on ("package"))
                   (:file "day3" :depends-on ("package"))
                   (:file "day4" :depends-on ("package"))
                  ))
                 (:file "main" :depends-on ("downloader" "2025")))))
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
                ((:file "main")
                 (:module "2025"
                  :components
                  ((:file "day2")
                   (:file "day3")
                   (:file "day4"))))))
  :description "Test system for aoc-lisp-ng"
  :perform (test-op (op c) (symbol-call :rove :run c)))

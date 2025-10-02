(defsystem #:aoc-lisp-ng
  :version "0.0.1"
  :author "Vest"
  :license "MIT"
  :depends-on (:dexador :str :alexandria :uiop)
  :components ((:module "src"
                :components
                ((:file "main"))))
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

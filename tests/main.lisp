(defpackage aoc-lisp-ng/tests/main
  (:use :cl
        :rove))
(in-package :aoc-lisp-ng/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :aoc-lisp-ng)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))

;; Run tests automatically, when the file is loaded
(rove:run-suite *package*)

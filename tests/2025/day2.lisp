(defpackage aoc-lisp-ng/tests/2025
  (:use :cl :rove))
(in-package :aoc-lisp-ng/tests/2025)

;; NOTE: To run this test file, execute `(asdf:test-system :aoc-lisp-ng)' in your Lisp.

(deftest test-day2-b
  (testing "the number 38593859 is invalid"
    (ok (aoc-lisp-ng/2025::is-num-invalid 38593859)))

  (testing "the number 121212 is invalid"
    (ok (aoc-lisp-ng/2025::is-num-invalid 1212)))

  (testing "the number 121 is valid"
    (ng (aoc-lisp-ng/2025::is-num-invalid 121))))

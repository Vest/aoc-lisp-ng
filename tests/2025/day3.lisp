(defpackage aoc-lisp-ng/tests/2025
  (:use :cl :rove))
(in-package :aoc-lisp-ng/tests/2025)

;; NOTE: To run this test file, execute `(asdf:test-system :aoc-lisp-ng)' in your Lisp.

(deftest test-day3-a
  (testing "the answer is 357"
    (ok (= 357 (aoc-lisp-ng/2025::show-part-03-a "987654321111111
811111111111119
234234234234278
818181911112111"))))

  (testing "find maximum number from 818181911112111"
    (ok (= 92 (aoc-lisp-ng/2025::find-max-pair "818181911112111")))))

;; Run tests automatically, when the file is loaded
(rove:run-suite *package*)

(defpackage aoc-lisp-ng/tests/2025
  (:use :cl :rove))
(in-package :aoc-lisp-ng/tests/2025)

;; NOTE: To run this test file, execute `(asdf:test-system :aoc-lisp-ng)' in your Lisp.

(defparameter *day4-input*  "..@@.@@@@.
@@@.@.@.@@
@@@@@.@.@@
@.@@@@..@.
@@.@@@@.@@
.@@@@@@@.@
.@.@.@.@@@
@.@@@.@@@@
.@@@@@@@@.
@.@.@@@.@.")

(defparameter *day4-field* nil)

(setup
  (setq *day4-field* (aoc-lisp-ng/2025::make-field *day4-input*)))

(deftest test-day4-a
  (testing "make a field from a sample data"
    (ok (eq #\. (aref *day4-field* 0 0)))
    (ok (eq #\. (aref *day4-field* 0 1)))
    (ok (eq #\@ (aref *day4-field* 0 2))))
  (testing "read a cell from a sample data in a safe way"
    (ok (eq #\. (aoc-lisp-ng/2025::read-field *day4-field* 0 0)))
    (ok (eq #\. (aoc-lisp-ng/2025::read-field *day4-field* 0 1)))
    (ok (eq #\@ (aoc-lisp-ng/2025::read-field *day4-field* 0 2)))
    (ok (eq #\. (aoc-lisp-ng/2025::read-field *day4-field* -1 -1)))
    (ok (eq #\. (aoc-lisp-ng/2025::read-field *day4-field* 1000 1000)))
    (ok (eq #\. (aoc-lisp-ng/2025::read-field *day4-field* -1000 5))))
  (testing "test count neighbors"
    (ok (= 2 (aoc-lisp-ng/2025::count-field-neighbors *day4-field* 0 0)))
    (ok (= 4 (aoc-lisp-ng/2025::count-field-neighbors *day4-field* 0 1))))
  (testing "sample answer A"
    (ok (= 13 (aoc-lisp-ng/2025::show-part-04-a *day4-input*)))))

(deftest test-day4-b
  (testing "sample answer B"
    (ok (= 43 (aoc-lisp-ng/2025::show-part-04-b *day4-input*)))))

(teardown
  (setf *day4-field* nil))

;; Run tests automatically, when the file is loaded
(rove:run-suite *package*)

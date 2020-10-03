;;;; test.lisp -- A Testsuite for Kaputt

;;;; Kaputt (https://github.com/michipili/cl-kaputt)
;;;; This file is part of Kaputt
;;;;
;;;; Copyright © 2019–2020 Michaël Le Barbier
;;;;
;;;; This file must be used under the terms of the MIT license.
;;;; This source file is licensed as described in the file LICENSE, which
;;;; you should have received as part of this distribution. The terms
;;;; are also available at
;;;; https://opensource.org/licenses/MIT

(defpackage #:kaputt/test
  (:use #:common-lisp #:kaputt)
  (:export
   #:run-all-tests)
  (:documentation
   "A testsuite for the Kaputt Test Framewok."))

(in-package #:kaputt/test)

(defparameter *assertion-description* nil
  "The description of the assertion being tested.")

(defparameter *assertion-form* nil
  "The form featuring the assertion being tested.")

(defparameter *assertion-args* nil
  "The evaluated arguments of the assertion being tested.")

(defmacro validate-assert-form (form &body body)
  `(handler-case ,form
     (kaputt::assertion-failed (condition)
       (let ((*assertion-description*
               (kaputt::assertion-description condition))
             (*assertion-form*
               (kaputt::assertion-form condition))
             (*assertion-args*
               (kaputt::assertion-args condition)))
         (unless (progn ,@body)
           (error "Validate assertion failed."))))))

(defun test-string-comparison ()
  (validate-assert-form (assert-string= t (string-upcase nil))
    (ppcre:scan
     "The parameter STRING1 is expected to have type STRING but actually has type"
     *assertion-description*))
  (validate-assert-form (assert-string<= "AAB" "AAAA")
    (ppcre:scan
     "Every character of STRING1 is less than or equal to the character of STRING2"
     *assertion-description*))
  (validate-assert-form (assert-string<= "AAB" "AAAA")
    (ppcre:scan
     "at position 2, which are #.B and #.A"
     *assertion-description*)))

(defun run-all-tests ()
  (handler-case
      (progn
        (test-string-comparison)
        t)
    (error (condition)
      (declare (ignore condition))
      nil)))

;;;; End of file `kaputt.lisp'

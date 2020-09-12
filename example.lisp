;;;; example.lisp -- A Kaputt Example

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

(defpackage #:kaputt/example
  (:use #:common-lisp #:kaputt)
  (:export
   #:run-all-tests))

(in-package #:kaputt/example)

(define-testcase cl-strings/string-downcase-turns-nil-into-a-string ()
  "Assert that CL:STRING-DOWNCASE maps NIL to \"nil\"."
  (assert-string= "nil" (string-downcase nil)))

(define-testcase cl-strings/string-upcase-turns-nil-into-a-string ()
  "Assert that CL:STRING-UPCASE maps NIL to \"NIL\"."
  (assert-string= "NIL" (string-upcase nil)))

(define-testcase run-all-tests ()
  (cl-strings/string-downcase-turns-nil-into-a-string)
  (cl-strings/string-upcase-turns-nil-into-a-string))

;;;; End of file `example.lisp'

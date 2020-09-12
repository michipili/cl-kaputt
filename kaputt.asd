;;;; kaputt.asd -- A Simple Interactive Test Framework for Common Lisp

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

(asdf:defsystem #:kaputt
  :description "A Simple Interactive Test Framework for Common Lisp"
  :author "Michaël Le Barbier"
  :license "MIT"
  :components
  ((:file "kaputt")))

(asdf:defsystem #:kaputt/example
  :description "An Example for the Kaputt Test Framework"
  :author "Michaël Le Barbier"
  :license "MIT"
  :depends-on (#:kaputt)
  :components
  ((:file "example")))

;;;; End of file `kaputt.asd'

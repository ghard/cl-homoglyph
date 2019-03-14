;;;; -*- Mode: Lisp -*-
;;;
;;; cl-homoglyph.asd
;;;
;;; System definition
;;;

(defsystem #:cl-homoglyph-tests
  :description "Test suite for Common Lisp functions to handle (single-character) unicode homoglyphs."
  :author "Yrjänä Rankka <ghard@zonk.net>"
  :license "MIT"
  :depends-on (#:fiveam #:cl-homoglyph)
  :components ((:module #:cl-homoglyph-tests
                        :serial t
                        :pathname "t/"
                        :components ((:file "package")
                                     (:file "tests"))))
  :perform (test-op (o s)
                    (uiop:symbol-call :fiveam
                                      '#:run!
                                      (uiop:find-symbol* '#:all-tests :cl-homoglyph-tests))))

;;; EOF

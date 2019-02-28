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
  :serial t
  :perform (test-op (o s)
                    (uiop:symbol-call :fiveam :run! 'cl-homoglyph-tests:all-tests))
  :components ((:module #:cl-homoglyph-tests
                        :pathname "t/"
                        :components ((:file "package")
                                     (:file "tests")))))

;;; EOF

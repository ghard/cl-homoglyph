;;;; -*- Mode: Lisp -*-
;;;
;;; cl-homoglyph.asd
;;;
;;; System definition
;;;

(defsystem #:cl-homoglyph
  :description "Common Lisp functions to handle (single-character) unicode homoglyphs."
  :author "Yrjänä Rankka <ghard@zonk.net>"
  :license "MIT"
  :depends-on (#:alexandria #:drakma #:split-sequence)
  :serial t
  :in-order-to ((test-op (test-op "cl-homoglyph-tests")))
  :components ((:module #:cl-homoglyph-lib
                        :pathname "src/"
                        :components ((:file "package")
                                     (:file "database")
                                     (:file "search")))))

;;; EOF

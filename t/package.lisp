;;;; -*- Mode: Lisp -*-
;;;
;;; package.lisp
;;;
;;; Tests package def
;;;
;;; License: MIT
;;;
;;; Copyright (c) 2019 Yrjänä Rankka
;;;

(defpackage #:cl-homoglyph-tests
  (:use #:cl #:5am)
  (:export #:run! #:all-tests)
  (:import-from #:cl-homoglyph
                #:homoglyphise-string
                #:homoglyph-str-p
                #:make-homoglyph-db-from-uri))

;;; EOF

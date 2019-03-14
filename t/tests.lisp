;;;; -*- Mode: Lisp -*-
;;;
;;; tests.lisp
;;;
;;; Some trivial tests for the homoglyph library
;;;
;;; License: MIT
;;;
;;; Copyright (c) 2019 Yrjänä Rankka
;;;

(in-package #:cl-homoglyph-tests)

(def-suite :all-tests :description "Simple tests")

(in-suite :all-tests)

(def-fixture db-from-uri ()
  (let ((homoglyph-db (make-homoglyph-db-from-uri)))
    (&body)))

(test test1
  (with-fixture db-from-uri ()
    (let ((tstr "Rivon rovion orit toreilla"))
      (is-true 
       (homoglyph-str-p (homoglyphise-string tstr homoglyph-db) tstr homoglyph-db)))))

;;; EOF

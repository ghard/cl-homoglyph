;;;; -*- Mode: Lisp -*-
;;;
;;; search.lisp
;;;
;;; License: MIT
;;;
;;; Copyright (c) 2019 Yrjänä Rankka
;;;
;;; BUGS: doesn't handle multiple-character homoglyphs, such as rn (m) or cl (d)
;;;

(in-package :cl-homoglyph)

(defun homoglyph-p (char1 char2 normalise-ht)
  "Are char1 and char2 homoglyphs?"
  (let ((cp1 (char-code char1))
        (cp2 (char-code char2)))
    (eql (or (gethash cp1 normalise-ht) cp1)
         (or (gethash cp2 normalise-ht) cp2))))

(defun homoglyph-str-p (str1 str2 &optional (db *homoglyph-db*))
  "Test if str1 is a homoglyph equivalent to str2"
  (and (= (length str1)
          (length str2))
       (every #'(lambda (c1 c2)
                  (homoglyph-p c1 c2 (car db)))
              str1
              str2)))

(defun find-random-homoglyph (c &optional (db *homoglyph-db*))
  "Return a random homoglyph of char c - returns c if none is found"
  (let ((homoglyphs (gethash (char-code c) (cadr db))))
    (if (null homoglyphs)
        c
        (code-char (nth (random (length homoglyphs)) homoglyphs)))))

(defun homoglyphise-string (str &optional (db *homoglyph-db*))
  "Return a new string built from random homoglyphs of str"
  (loop
     for c across str
     for i from 0 
     with new-str = (make-string (length str))
     do (setf (aref new-str i) (find-random-homoglyph c db))
     finally (return new-str)))

(defun homoglyphize-string (str &optional (db *homoglyph-db*))
  "i18n in simplified English"
  (homoglyphise-string str db))

;;; EOF

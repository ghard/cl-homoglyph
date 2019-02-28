;;;; -*- Mode: Lisp -*-
;;;
;;; database.lisp
;;;
;;; A part of cl-homoglyphs - a library to handle (single-char) unicode homoglyphs
;;;
;;; License: MIT
;;;
;;; Copyright (c) 2019 Yrjänä Rankka
;;;
;;; Functions to build the internal data structures from homoglyph database
;;; in the format used by the project https://github.com/codebox/homoglyph
;;;

(in-package :cl-homoglyph)

(defparameter *codebox-homoglyph-table-git-uri*
  "https://raw.githubusercontent.com/codebox/homoglyph/master/raw_data/char_codes.txt")

(defvar +comment-char+ #\#)

(defparameter *normalise-ht-sz* 8000)
(defparameter *homoglyph-ht-sz* 2000)

(defun comment-line-p (str)
  "Predicate that checks if a line begins with a comment char"
  (eql (aref str 0) +comment-char+))

(defun read-cp (str)
  (parse-integer str :radix 16))

;; Ugh butt-ugly but working

(defun parse-and-store-db-line (normalise-ht homoglyph-ht line)
  (let* ((datums (split-sequence #\, line))
         (norm-cp (read-cp (car datums))))
    (setf (gethash norm-cp homoglyph-ht) 
          (loop
             for n in (cdr datums)
             for cp = (read-cp n)
             do (setf (gethash cp normalise-ht) norm-cp)
             collect cp))))

(defun make-homoglyph-db-from-stream (s)
  "Make a homoglyph DB from data read from stream s"
  (let ((normalise-ht (make-hash-table :size *normalise-ht-sz*))
        (homoglyph-ht (make-hash-table :size *homoglyph-ht-sz*)))
    (handler-case
        (loop
           do (let ((in-line (read-line s)))
                (unless (comment-line-p in-line)
                  (parse-and-store-db-line normalise-ht homoglyph-ht in-line))))
      (end-of-file ()
        (list normalise-ht homoglyph-ht)))))

(defun make-homoglyph-db-from-file (fpath)
  "Read the database from filesystem"
  (with-open-file (s fpath)
    (make-homoglyph-db-from-stream s)))

(defun make-homoglyph-db-from-uri (&optional (uri *codebox-homoglyph-table-git-uri*))
  "Read the databse from (hopefully trusted) uri"
  (let ((s (drakma:http-request uri :want-stream t)))
    (make-homoglyph-db-from-stream s)))

;;; EOF

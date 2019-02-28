(defpackage #:cl-homoglyph
  (:use #:cl)
  (:import-from #:split-sequence #:split-sequence)
  (:export #:make-homoglyph-db-from-uri
           #:make-homoglyph-db-from-file
           #:make-homoglyph-db-from-stream
           #:homoglyph-str-p
           #:homoglyphise-string))

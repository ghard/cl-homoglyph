(in-package #:cl-homoglyph-tests)

(def-suite :all-tests :description "Simple tests")

(in-suite :all-tests)

(def-fixture db-from-uri ()
  (let ((homoglyph-db (make-homoglyph-db-from-uri)))
    (&body)))

(test homoglyphise-and-test
  (with-fixture db-from-uri ()
    (let ((tstr "Rivon rovion orit toreilla"))
      (is-true 
       (homoglyph-str-p (homoglyphise-string tstr homoglyph-db) tstr homoglyph-db)))))


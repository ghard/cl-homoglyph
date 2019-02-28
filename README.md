# cl-homoglyph

A Common Lisp library for handling unicode homoglyphs.

The homoglyphs db format is as is used by https://github.com/codebox/homoglyph. The function `(make-homoglyph-db-from-uri)` without the optional uri parameter will default to loading that project's database directly from github.

I recognize that most of the work involved is in generating and maintaining the database. If you use this library then you'll most likely want to use the one generated by @codebox - so kudos are due that way, too.

Tested with SBCL only - I *think* it should be pretty close to modern "standard" Common Lisp, but YMMV.

# Examples

```common-lisp

CL-USER> (push #p"/home/ghard/src/cl-homoglyph/" ql:*local-project-directories*)

CL-USER> (ql:quickload :cl-homoglyph)
To load "cl-homoglyph":
  Load 1 ASDF system:
    cl-homoglyph
; Loading "cl-homoglyph"

(:CL-HOMOGLYPH)

CL-USER> (asdf:test-system 'cl-homoglyph)
T

CL-HOMOGLYPH> (setf *homoglyph-db* (make-homoglyph-db-from-uri)) ; this loads the homoglyph data from https://raw.githubusercontent.com/codebox/homoglyph/master/raw_data/char_codes.txt

(#<HASH-TABLE :TEST EQL :COUNT 4317 {10048BFA43}>
 #<HASH-TABLE :TEST EQL :COUNT 1852 {10048D3EC3}>)

CL-HOMOGLYPH> (homoglyphise-string "Rivon orin roviot torilla")
"𝓡𝐢𝛎o𝕟 o𝘳ӏ𝕟 𝓻oｖⅰo𝘁 ｔoꮁⅰll𝖺"
CL-HOMOGLYPH> (let* ((tstr "Mieleni minun tekevi, aivoni ajattelevi.")
                     (hstr (homoglyphise-string tstr)))
                (list tstr hstr (homoglyph-str-p tstr hstr)))
("Mieleni minun tekevi, aivoni ajattelevi."
 "ℳ𝗶ｅl℮𝘯ⅈ ｍ𝖎ｎ𝕦ո 𝓉ⅇ𝗄𝒆𝝂𝜄‚ αᎥ𝘃o𝔫˛ 𝖆𝔧𝗮𝖙𝗍𝔢l𝓮𝗏𝕚꘎" T)

```

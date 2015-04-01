(define-generic-mode cwiki-mode
  ()
  '()
  (list
   ;; '("{\\([^{}:\n]+:?\\)[^{}\n]*}"
   ;;   (1 'font-lock-constant-face))

   ;; '("{[^{}\n]+[:|]title=\\([^}|\n]+\\)[^{}\n]*}"
   ;;   (1 'bold append))

   '("\\({warning\\(?:[:][^}\n]*\\)?}\\)[\n]?\\(\\(?:.\\|[\n]\\)*?\\)\\({warning}\\)"
     (1 'font-lock-type-face)
     (2 'font-lock-warning-face prepend)
     (3 'font-lock-type-face))
   '("\\({note\\(?:[:][^}\n]*\\)?}\\)[\n]?\\(\\(?:.\\|[\n]\\)*?\\)\\({note}\\)"
     (1 'font-lock-type-face)
     (2 'font-lock-minor-warning-face prepend)
     (3 'font-lock-type-face))
   '("\\({info\\(?:[:][^}\n]*\\)?}\\)[\n]?\\(\\(?:.\\|[\n]\\)*?\\)\\({info}\\)"
     (1 'font-lock-type-face)
     (2 'font-lock-doc-face prepend)
     (3 'font-lock-type-face))
   '("\\({tip\\(?:[:][^}\n]*\\)?}\\)[\n]?\\(\\(?:.\\|[\n]\\)*?\\)\\({tip}\\)"
     (1 'font-lock-type-face)
     (2 'font-lock-comment-face prepend)
     (3 'font-lock-type-face))

   ;; bold
   '("[^[:word:]\\*][*]\\([^*\n]+\\)[*]\\W"
     (1 'bold))

   ;; code
   '("\\({{\\)\\([^}\n]+\\)\\(}}\\)"
     (1 'font-lock-comment-face)
     (2 'font-lock-string-face)
     (3 'font-lock-comment-face)
     )

   ;; italics/emphasised
   '("[^[:word:]\\]_\\([^_\n]+\\)_\\W"
     (1 'italic prepend))
   '("[^[:word:]\\][?]\\{2\\}\\([^?\n]+\\)[?]\\{2\\}\\W"
     (1 'italic prepend))

   ;; underline
   '("[^[:word:]\\][+]\\([^+\n]+\\)[+]\\W"
     (1 'underline prepend))

   ;; strike-through
   '("[^[:word:]\\][-]\\([^-\n]+\\)[-]\\W"
     (1 '(:strike-through t) prepend))

   ;; headings
   '("^\\(h1[.]\\) \\(.*\\)$"
     (1 'font-lock-keyword-face)
     (2 '(bold underline) prepend))
   '("^\\(h2[.]\\) \\(.*\\)$"
     (1 'font-lock-keyword-face)
     (2 '(bold italic underline) prepend))
   '("^\\(h3[.]\\) \\(.*\\)$"
     (1 'font-lock-keyword-face)
     (2 '(italic underline) prepend))
   '("^\\(h[4-9][.]\\) \\(.*\\)$"
     (1 'font-lock-keyword-face)
     (2 'underline prepend))

   ;; separator lines
   '("^\\([-]\\{4\\}\\)$"
     (1 'font-lock-keyword-face))

   ;; bullet points
   '("^\\([*#]+\\)\\s-"
     (1 'font-lock-constant-face))

   ;; links
   '("\\(\\[\\)\\([^|\n]*\\)[|]\\([^]\n]+\\)\\(\\]\\)"
     (1 'font-lock-constant-face)
     (2 'font-lock-string-face)
     (3 'underline)
     (4 'font-lock-constant-face))
   '("\\(\\[\\)\\([^]|\n]+\\)\\(\\]\\)"
     (1 'font-lock-constant-face)
     (2 '(font-lock-string-face underline))
     (3 'font-lock-constant-face))
   '("{anchor:\\([^{}\n]+\\)}"
     (1 'font-lock-string-face))

   ;; images, embedded content
   '("\\([!]\\)\\([^|\n]+\\)[|]\\(?:[^!\n]*\\)\\([!]\\)"
     (1 'font-lock-constant-face)
     (2 '(font-lock-reference-face underline))
     (3 'font-lock-constant-face))
   '("\\([!]\\)\\([^!|\n]+\\)\\([!]\\)"
     (1 'font-lock-constant-face)
     (2 '(font-lock-reference-face underline))
     (3 'font-lock-constant-face))

   ;; tables
   '("[|]\\{2\\}\\([^|\n]+\\)"
     (1 'bold))
   '("\\([|]\\{1,2\\}\\)"
     (1 'font-lock-constant-face))

   ;; code/preformatted blocks
   '("\\({noformat\\(?:[:][^}\n]*\\)?}\\)[\n]?\\(\\(?:.\\|[\n]\\)*?\\)\\({noformat}\\)"
     (1 'font-lock-type-face)
     (2 'font-lock-string-face)
     (3 'font-lock-type-face))
   '("\\({code\\(?:[:][^}\n]*\\)?}\\)[\n]?\\(\\(?:.\\|[\n]\\)*?\\)\\({code}\\)"
     (1 'font-lock-type-face)
     (2 'font-lock-string-face)
     (3 'font-lock-type-face))

   ;; panels
   '("\\({panel\\(?:[:][^}\n]*\\)?}\\(?:\\s-*[\r]?[\n]\\)?\\)\\(\\(?:.\\|[\n]\\)*?\\)\\({panel}\\)"
     (1 'font-lock-type-face)
     (2 'font-lock-preprocessor-face)
     (3 'font-lock-type-face))
   )
  '("\\.cwiki$")
  nil
  "A generic mode for confluence wiki that just defines some highlighting"
  )

(with-eval-after-load 'aggressive-indent (add-to-list 'aggressive-indent-excluded-modes 'cwiki-mode))

(provide 'cwiki-mode)

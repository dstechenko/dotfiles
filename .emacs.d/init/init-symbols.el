;;; init-symbols.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Configuration for prettify-symbols to embed in other modes.
;;

;;; Code:

(setq prettify-symbols-unprettify-at-point t)

(defconst greek-pretty-symbols-alist
  '(("Alpha" . ?Α)
    ("Beta" . ?Β)
    ("Gamma" . ?Γ)
    ("Delta" . ?Δ)
    ("Epsilon" . ?Ε)
    ("Zeta" . ?Ζ)
    ("Eta" . ?Η)
    ("Theta" . ?Θ)
    ("Iota" . ?Ι)
    ("Kappa" . ?Κ)
    ("Lambda" . ?Λ)
    ("Mu" . ?Μ)
    ("Nu" . ?Ν)
    ("Xi" . ?Ξ)
    ("Omicron" . ?Ο)
    ("Pi" . ?Π)
    ("Rho" . ?Ρ)
    ("Sigma" . ?Σ)
    ("Tau" . ?Τ)
    ("Upsilon" . ?Υ)
    ("Phi" . ?Φ)
    ("Chi" . ?Χ)
    ("Psi" . ?Ψ)
    ("Omega" . ?Ω)
    ("alpha" . ?α)
    ("beta" . ?β)
    ("gamma" . ?γ)
    ("delta" . ?δ)
    ("epsilon" . ?ε)
    ("zeta" . ?ζ)
    ("eta" . ?η)
    ("theta" . ?θ)
    ("iota" . ?ι)
    ("kappa" . ?κ)
    ("lambda" . ?λ)
    ("mu" . ?μ)
    ("nu" . ?ν)
    ("xi" . ?ξ)
    ("omicron" . ?ο)
    ("pi" . ?π)
    ("rho" . ?ρ)
    ("sigma" . ?σ)
    ("tau" . ?τ)
    ("upsilon" . ?υ)
    ("phi" . ?φ)
    ("chi" . ?χ)
    ("psi" . ?ψ)
    ("omega" . ?ω))
  "Prettify rules for Greek letters.")

(defconst braced-pretty-symbols-alist
  '(("|A|" . ?𝔸)
    ("|B|" . ?𝔹)
    ("|C|" . ?ℂ)
    ("|D|" . ?𝔻)
    ("|E|" . ?𝔼)
    ("|F|" . ?𝔽)
    ("|G|" . ?𝔾)
    ("|H|" . ?ℍ)
    ("|I|" . ?𝕀)
    ("|J|" . ?𝕁)
    ("|K|" . ?𝕂)
    ("|L|" . ?𝕃)
    ("|M|" . ?𝕄)
    ("|N|" . ?ℕ)
    ("|O|" . ?𝕆)
    ("|P|" . ?ℙ)
    ("|Q|" . ?ℚ)
    ("|R|" . ?ℝ)
    ("|S|" . ?𝕊)
    ("|T|" . ?𝕋)
    ("|U|" . ?𝕌)
    ("|V|" . ?𝕍)
    ("|W|" . ?𝕎)
    ("|X|" . ?𝕏)
    ("|Y|" . ?𝕐)
    ("|Z|" . ?ℤ)

    ("|pi|" . ?ℼ)
    ("|Pi|" . ?ℿ)

    ("|gamma|" . ?ℽ)
    ("|Gamma|" . ?ℾ))
  "Prettify rules for double-struck letters.")

(defconst set-pretty-symbols-alist
  '(("empty" . ?∅)
    ("sum" . ?∑)
    ("product" . ?∏)
    ("contains" . ?∍)
    ("forall" . ?∀)
    ("any" . ?∃)
    ("exists" . ?∃)
    ("intersect" . ?∩)
    ("union" . ?∪)
    ("diff" . ?≏)

    ("isSubsetOf" . ?⊆)
    ("isProperSubsetOf" . ?⊂)
    ("isMemberOf" . ?∈)
    ("notMemberOf" . ?∉)

    ("++" . ?⧺)
    ("+++" . ?⧻)

    ("|||" . ?⫴)
    ("::" . ?⸬)
    ("--" . ?╌))
  "Prettify rules for Set operations.")

(defconst arrow-pretty-symbols-alist
  '(("->" . ?→)
    ("-->" . ?⟶)
    ("<-" . ?←)
    ("<--" . ?⟵)
    ("<->" . ?↔)
    ("<-->" . ?⟷)

    ("=>" . ?⇒)
    ("==>" . ?⟹)
    ("<==" . ?⟸)
    ("<=>" . ?⇔)
    ("<==>" . ?⟺)

    ("|->" . ?↦)
    ("|-->" . ?⟼)
    ("<-|" . ?↤)
    ("<--|" . ?⟻)

    ("|=>" . ?⤇)
    ("|==>" . ?⟾)
    ("<=|" . ?⤆)
    ("<==|" . ?⟽)

    ("~>" . ?⇝)
    ("<~" . ?⇜)

    (">->" . ?↣)
    ("<-<" . ?↢)
    ("->>" . ?↠)
    ("<<-" . ?↞)

    (">->>" . ?⤖)
    ("<<-<" . ?⬻)

    ("<|-" . ?⇽)
    ("-|>" . ?⇾)
    ("<|-|>" . ?⇿)

    ("<-/-" . ?↚)
    ("-/->" . ?↛)

    ("<-|-" . ?⇷)
    ("-|->" . ?⇸)
    ("<-|->" . ?⇹)

    ("<-||-" . ?⇺)
    ("-||->" . ?⇻)
    ("<-||->" . ?⇼)

    ("-o->" . ?⇴)
    ("<-o-" . ?⬰))
  "Prettify rules for Arrow symbols.")

(defconst relational-pretty-symbols-alist
  '(("===" . ?≣)
    ("==" . ?≡)

    ("!" . ?¬)
    ("!=" . ?≢)
    ("<>" . ?≠)

    ("<=" . ?≤)
    (">=" . ?≥)

    ("/=" . ?≠)
    ("/<" . ?≮)
    ("/>" . ?≯))
  "Prettify rules for Relational symbols.")

(defconst boolean-pretty-symbols-alist
  '(("&&" . ?∧)
    ("||" . ?∨)

    ("/\\" . ?∧)
    ("\\/" . ?∨)

    ("&&" . ?∧)
    ("||" . ?∨)

    ("~" . ?¬)

    ("true" . ?⊤)
    ("false" . ?⊥)

    ("True" . ?⊤)
    ("False" . ?⊥))
  "Prettify rules for Boolean operations.")

(defconst misc-pretty-symbols-alist
  '(("|-" . ?⊢)

    ("<<" . ?≪)
    (">>" . ?≫)
    ("<<<" . ?⋘)
    (">>>" . ?⋙)

    ("<|" . ?⊲)
    ("|>" . ?⊳)
    ("><" . ?⋈)

    ("<*>" . ?⊛)
    ("|*|" . ?⊛)

    ("<+>" . ?⊕)
    ("|+|" . ?⊕)

    (":=" . ?≔)
    ("=:" . ?≕)

    ("=def" . ?≝)
    ("=?" . ?≟)

    ("..." . ?…)

    ("undefined" . ?⊥))
  "Prettify rules for misc operators.")

(defconst generic-pretty-symbols-alist
  (append
   greek-pretty-symbols-alist
   braced-pretty-symbols-alist
   set-pretty-symbols-alist
   arrow-pretty-symbols-alist
   relational-pretty-symbols-alist
   boolean-pretty-symbols-alist
   misc-pretty-symbols-alist)
  "All generic prettify rules combined.")

(defun extend-generic-and-enable-pretty-symbols (extension)
  "Extend generic prettify rules with an `EXTENSION' and enable prettify mode."
  (setq-local prettify-symbols-alist (append generic-pretty-symbols-alist extension))
  (prettify-symbols-mode))

(defun enable-generic-pretty-symbols ()
  "Enable all generic pretty symbols."
  (extend-generic-and-enable-pretty-symbols nil))

(defconst scala-pretty-symbols-alist
  '(("mempty" . ?∅)
    ("mappend" . ?⊕)

    ("Unit" . ?∅)
    ("Boolean" . ?𝔹)
    ("Double" . ?ℝ)
    ("Int" . ?ℤ)
    ("Nat" . ?ℕ)

    ("flatMap" . ?⤜)
    (">>=" . ?⤜)
    ("bind" . ?⤜)

    (">>" . ?≫)
    ("followedBy" . ?≫)

    ("assert" . ?⊦))
  "Prettify rules extensions specific to Scala mode.")

(defun enable-scala-pretty-symbols ()
  "Enable all pretty symbols for Scala mode."
  (extend-generic-and-enable-pretty-symbols scala-pretty-symbols-alist))

(defconst coq-pretty-symbols-alist
  '(("||" . ?‖)

    ("fun" . ?λ)

    ("Prop" . ?ℙ)
    ("Real" . ?ℝ)
    ("nat" . ?ℕ)
    ("bool" . ?𝔹))
  "Prettify rules extensions specific to Coq mode.")

(defun enable-coq-pretty-symbols ()
  "Enable all pretty symbols for Coq mode."
  (extend-generic-and-enable-pretty-symbols coq-pretty-symbols-alist))

(defconst idris-pretty-symbols-alist
  '(("()" . ?∅)
    ("Bool" . ?𝔹)
    ("Double" . ?ℝ)
    ("Integer" . ?ℤ)
    ("Nat" . ?ℕ))
  "Prettify rules extensions specific to Idris mode.")

(defun enable-idris-pretty-symbols ()
  "Enable all pretty symbols for Idris mode."
  (extend-generic-and-enable-pretty-symbols idris-pretty-symbols-alist))


(provide 'init-symbols)

;;; init-symbols.el ends here

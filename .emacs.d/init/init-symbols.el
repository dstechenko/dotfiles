;;; init-symbols.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Configuration for prettify-symbols to embed in other modes.
;;

;;; Code:

(setq prettify-symbols-unprettify-at-point t)

(defconst greek-symbols-alist
  '(("Alpha" . ?Α) ("Beta" . ?Β) ("Gamma" . ?Γ)
    ("Delta" . ?Δ) ("Epsilon" . ?Ε) ("Zeta" . ?Ζ)
    ("Eta" . ?Η) ("Theta" . ?Θ) ("Iota" . ?Ι)
    ("Kappa" . ?Κ) ("Lambda" . ?Λ) ("Mu" . ?Μ)
    ("Nu" . ?Ν) ("Xi" . ?Ξ) ("Omicron" . ?Ο)
    ("Pi" . ?Π) ("Rho" . ?Ρ) ("Sigma" . ?Σ)
    ("Tau" . ?Τ) ("Upsilon" . ?Υ) ("Phi" . ?Φ)
    ("Chi" . ?Χ) ("Psi" . ?Ψ) ("Omega" . ?Ω)
    ("alpha" . ?α) ("beta" . ?β) ("gamma" . ?γ)
    ("delta" . ?δ) ("epsilon" . ?ε) ("zeta" . ?ζ)
    ("eta" . ?η) ("theta" . ?θ) ("iota" . ?ι)
    ("kappa" . ?κ) ("lambda" . ?λ) ("mu" . ?μ)
    ("nu" . ?ν) ("xi" . ?ξ) ("omicron" . ?ο)
    ("pi" . ?π) ("rho" . ?ρ) ("sigma" . ?σ)
    ("tau" . ?τ) ("upsilon" . ?υ) ("phi" . ?φ)
    ("chi" . ?χ) ("psi" . ?ψ) ("omega" . ?ω))
  "Prettify rules for Greek letters.")

(provide 'init-symbols)

;;; init-symbols.el ends here

;;; init-coq.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Coq packages configuration and tweaks.
;;

;;; Code:

(load (expand-file-name "./lisp/proof-general/generic/proof-site" user-emacs-directory))

(use-package company-coq
  :diminish
  company-coq-mode "cc"

  :config
  (add-hook 'coq-mode-hook #'company-coq-mode))

;; Diminish modes
(defun coq-mode-diminish ()
  "Abbreviate Coq minor modes."
  (diminish 'holes-mode "hl")
  (diminish 'outline-minor-mode "ol"))

;; Set configuration
(defun coq-mode-configuration ()
  "Configure all Coq mode properties."
  (defvar coq-modeline-string0)
  (setq coq-modeline-string0 " sc("))

(add-hook 'coq-mode-hook
          (lambda ()
            (company-coq-mode)
            (coq-mode-diminish)
            (coq-mode-configuration)))

(provide 'init-coq)

;;; init-coq.el ends here

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
  company-coq-mode "cc")

(defun coq-mode-diminish ()
  "Abbreviate Coq minor modes."
  (diminish 'holes-mode "hl")
  (diminish 'outline-minor-mode "ol"))

(defun coq-mode-configuration ()
  "Configure all Coq mode properties."
  (defvar coq-modeline-string0)
  (setq coq-modeline-string0 " sc(")
  (prettify-symbols-mode -1))

(defun coq-mode-tweaks ()
  "Add all Coq mode tweaks in the right order."
  (company-coq-mode)
  (coq-mode-diminish)
  (coq-mode-configuration))

(add-hook 'coq-mode-hook 'coq-mode-tweaks)

(provide 'init-coq)

;;; init-coq.el ends here

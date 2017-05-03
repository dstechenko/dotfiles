;;; init-coq.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Coq packages configuration and tweaks.
;;

;;; Code:

(require 'init-util)
(require 'init-symbols)

(load (expand-lisp "proof-general/generic/proof-site"))

(use-package company-coq
  :diminish
  company-coq-mode)

(defun coq-mode-diminish ()
  "Abbreviate Coq minor modes."
  (diminish 'holes-mode)
  (diminish 'outline-minor-mode))

(defun coq-mode-tweaks ()
  "Add all Coq mode tweaks in the right order."
  (company-coq-mode)
  (coq-mode-diminish)
  (enable-coq-pretty-symbols))

(add-hook 'coq-mode-hook 'coq-mode-tweaks)

(provide 'init-coq)

;;; init-coq.el ends here

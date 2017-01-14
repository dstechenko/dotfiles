;;; init-coq.el --- Emacs configuration

;; Copyright (C) 2016 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Coq packages configuration and tweaks.
;; Includes the following:
;; - proof-general
;; - company-coq
;;

;;; Code:

(load "~/.emacs.d/lisp/proof-general/generic/proof-site")

(use-package company-coq
  :config
  (add-hook 'coq-mode-hook #'company-coq-mode))

(provide 'init-coq)

;;; init-coq.el ends here

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

(provide 'init-coq)

;;; init-coq.el ends here

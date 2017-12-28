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

(use-package company-coq)

(defun coq-mode-tweaks ()
  "Add all Coq mode tweaks in the right order."
  (company-coq-mode)
  (enable-coq-pretty-symbols))

(add-hook 'coq-mode-hook 'coq-mode-tweaks)

(provide 'init-coq)

;;; init-coq.el ends here

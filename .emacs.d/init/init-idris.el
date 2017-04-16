;;; init-idris.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Idris packages configuration and tweaks.
;;

;;; Code:

(require 'init-symbols)

(use-package idris-mode
  :config
  (setq idris-repl-banner-functions '(idris-repl-text-banner)))

(defun idris-mode-diminish ()
  "Abbreviate Idris minor modes."
  (diminish 'idris-simple-indent-mode))

(defun idris-mode-configuration ()
  "Configure all Idris mode properties."
  (ctags-auto-update-mode -1)
  (enable-idris-pretty-symbols))

(defun idris-mode-tweaks ()
  "Add all Idris mode tweaks in the right order."
  (idris-mode-diminish)
  (idris-mode-configuration))

(add-hook 'idris-mode-hook 'idris-mode-tweaks)

(provide 'init-idris)

;;; init-idris.el ends here

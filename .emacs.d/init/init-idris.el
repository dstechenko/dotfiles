;;; init-idris.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Idris packages configuration and tweaks.
;;

;;; Code:

(require 'init-symbols)

(use-package idris-mode)

(defun idris-mode-diminish ()
  "Abbreviate Idris minor modes.")

(defun idris-mode-configuration ()
  "Configure all Idris mode properties."
  (enable-idris-pretty-symbols))

(defun idris-mode-tweaks ()
  "Add all Idris mode tweaks in the right order."
  (idris-mode-diminish)
  (idris-mode-configuration))

(add-hook 'idris-mode-hook 'idris-mode-tweaks)

(provide 'init-idris)

;;; init-idris.el ends here

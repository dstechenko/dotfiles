;;; init-haskell.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Haskell packages configuration and tweaks.
;;

;;; Code:

(use-package haskell-mode
  :config
  (setq haskell-tags-on-save t)

  :bind
  ("C-c C-c" . haskell-compile)
  ("C-S-q"   . haskell-mode-stylish-buffer)
  ("<f8>"    . haskell-navigate-imports))

(use-package hindent
  :diminish
  hindent-mode

  :bind
  ("C-q" . hindent-reformat-region))

(defun haskell-mode-tweaks ()
  "Add all Haskell mode tweaks in the right order."
  (haskell-decl-scan-mode)
  (hindent-mode))

(add-hook 'haskell-mode-hook 'haskell-mode-tweaks)

(provide 'init-haskell)

;;; init-haskell.el ends here

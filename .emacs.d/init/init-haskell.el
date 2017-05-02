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
  (setq
   haskell-tags-on-save                        t
   haskell-process-log                         t
   haskell-process-suggest-remove-import-lines t
   haskell-process-auto-import-loaded-modules  t)

  (setq haskell-process-type 'cabal-repl)

  :bind
  ("<f8>"    . haskell-navigate-imports)
  ("M-."     . haskell-mode-jump-to-def-or-tag)
  ("C-c C-o" . haskell-compile)
  ("C-S-q"   . haskell-mode-stylish-buffer)
  ("C-c C-d" . haskell-debug)
  ("C-c c"   . haskell-process-cabal))

(use-package ghc
  :bind
  ("C-c l" . ghc-toggle-check-command))

(use-package company-ghc)

(use-package hindent
  :diminish
  hindent-mode

  :bind
  ("C-q" . hindent-reformat-region))

(defun interactive-haskell-mode-bindings ()
  "Bind all Interactive Haskell custom keys."
  (defvar interactive-haskell-mode-map)
  (define-key interactive-haskell-mode-map (kbd "M-.")     'haskell-mode-goto-loc)
  (define-key interactive-haskell-mode-map (kbd "C-c C-t") 'haskell-mode-show-type-at))

(defun cabal-mode-bindings ()
  "Bind all Cabal custom keys."
  (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c C-o") 'haskell-compile))

(defun haskell-mode-tweaks ()
  "Add all Haskell mode tweaks in the right order."
  (ghc-init)
  (interactive-haskell-mode)
  (company-mode)
  (interactive-haskell-mode-bindings)
  (cabal-mode-bindings)
  (haskell-decl-scan-mode)
  (hindent-mode))

(add-hook 'haskell-mode-hook 'haskell-mode-tweaks)

(provide 'init-haskell)

;;; init-haskell.el ends here

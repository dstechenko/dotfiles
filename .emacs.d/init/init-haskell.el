;;; init-haskell.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Haskell packages configuration and tweaks.
;;

;;; Code:

(require 'init-util)

(expand-load (expand-lisp "ghc-hare"))
(load-fun 'hare 'hare-init)

(use-package haskell-mode
  :config
  (setq
   haskell-tags-on-save                        t
   haskell-process-log                         t
   haskell-process-suggest-remove-import-lines t
   haskell-process-auto-import-loaded-modules  t)

  (setq haskell-process-type 'cabal-repl)

  :bind
  ("M-."     . haskell-mode-jump-to-def-or-tag)
  ("C-c M-q" . haskell-navigate-imports)
  ("C-c C-o" . haskell-compile)
  ("C-c C-d" . haskell-debug)
  ("C-c c"   . haskell-process-cabal)
  ("C-S-q"   . haskell-mode-stylish-buffer))

(use-package ghc
  :bind
  ("C-c l" . ghc-toggle-check-command))

(use-package shm
  :diminish
  structured-haskell-mode)

(use-package company-ghc
  :config
  (setq company-ghc-show-info t)
  (add-to-list 'company-backends 'company-ghc))

(use-package hindent
  :diminish
  hindent-mode

  :bind
  ("C-q" . hindent-reformat-region))

(defun haskell-mode-bindings ()
  "Bind all Haskell custom keys."
  (define-key haskell-mode-map (kbd "C-c C-r") nil))

(defun interactive-haskell-mode-bindings ()
  "Bind all Interactive Haskell custom keys."
  (defvar interactive-haskell-mode-map)
  (define-key interactive-haskell-mode-map (kbd "C-c C-r")                     nil)
  (define-key interactive-haskell-mode-map (kbd "M-.")     'haskell-mode-goto-loc))

(defun cabal-mode-bindings ()
  "Bind all Cabal custom keys."
  (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c C-o") 'haskell-compile))

(defun haskell-mode-tweaks ()
  "Add all Haskell mode tweaks in the right order."
  (haskell-mode-bindings)
  (interactive-haskell-mode)
  (interactive-haskell-mode-bindings)
  (cabal-mode-bindings)
  (company-mode)
  (haskell-decl-scan-mode)
  (ghc-init)
  (hare-init)
  (hindent-mode)
  (structured-haskell-mode))

(add-hook 'haskell-mode-hook 'haskell-mode-tweaks)

(provide 'init-haskell)

;;; init-haskell.el ends here

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

  (setq haskell-process-type 'cabal-repl))

(use-package ghc)

(use-package shm
  :diminish
  structured-haskell-mode)

(use-package company-ghc
  :config
  (setq company-ghc-show-info t)
  (add-to-list 'company-backends 'company-ghc))

(use-package hindent
  :diminish
  hindent-mode)

(defun haskell-mode-bindings ()
  "Bind all Haskell custom keys."
  (bind-key "C-q"     'hindent-reformat-region         hindent-mode-map)
  (bind-key "M-."     'haskell-mode-jump-to-def-or-tag haskell-mode-map)
  (bind-key "C-c M-q" 'haskell-navigate-imports        haskell-mode-map)
  (bind-key "C-c C-o" 'haskell-compile                 haskell-mode-map)
  (bind-key "C-c C-d" 'haskell-debug                   haskell-mode-map)
  (bind-key "C-c c"   'haskell-process-cabal           haskell-mode-map)
  (bind-key "C-S-q"   'haskell-mode-stylish-buffer     haskell-mode-map)
  (bind-key "C-c C-r" nil                              haskell-mode-map)
  (bind-key "C-c l"   'ghc-toggle-check-command        haskell-mode-map))

(defun interactive-haskell-mode-bindings ()
  "Bind all Interactive Haskell custom keys."
  (defvar interactive-haskell-mode-map)
  (bind-key "C-c C-r" nil                    interactive-haskell-mode-map)
  (bind-key "M-."     'haskell-mode-goto-loc interactive-haskell-mode-map))

(defun cabal-mode-bindings ()
  "Bind all Cabal custom keys."
  (bind-key "C-c C-z" 'haskell-interactive-switch     haskell-cabal-mode-map)
  (bind-key "C-c C-k" 'haskell-interactive-mode-clear haskell-cabal-mode-map)
  (bind-key "C-c C-c" 'haskell-process-cabal-build    haskell-cabal-mode-map)
  (bind-key "C-c C-o" 'haskell-compile                haskell-cabal-mode-map))

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

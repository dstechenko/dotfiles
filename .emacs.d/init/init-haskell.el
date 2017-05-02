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
   haskell-process-type                        'cabal-repl
   haskell-process-log                         t
   haskell-process-suggest-remove-import-lines t
   haskell-process-auto-import-loaded-modules  t)

  :bind
  ("C-c C-c"     . haskell-compile)
  ("C-S-q"       . haskell-mode-stylish-buffer)
  ("<f8>"        . haskell-navigate-imports)
  ("C-c C-z"     . haskell-interactive-switch)
  ("C-c C-l"     . haskell-process-load-or-reload)
  ("C-c C-n C-t" . haskell-process-do-type)
  ("C-c C-n C-i" . haskell-process-do-info)
  ("C-c C-n C-c" . haskell-process-cabal-build)
  ("C-c C-n c"   . haskell-process-cabal))

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
  (define-key haskell-cabal-mode-map (kbd "C-c c")   'haskell-process-cabal))

(defun haskell-mode-tweaks ()
  "Add all Haskell mode tweaks in the right order."
  (interactive-haskell-mode)
  (interactive-haskell-mode-bindings)
  (haskell-decl-scan-mode)
  (hindent-mode))

(add-hook 'haskell-mode-hook 'haskell-mode-tweaks)

(provide 'init-haskell)

;;; init-haskell.el ends here

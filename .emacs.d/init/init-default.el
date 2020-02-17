;;; init-default.el --- Emacs configuration

;; Copyright (C) 2020 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Default packages configuration and tweaks.
;;

;;; Code:

(require 'package)
(require 'dired-x)
(require 'init-util)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package auto-package-update
  :config
  (auto-package-update-maybe))

(use-package aggressive-indent
  :config
  (global-aggressive-indent-mode 1))

(use-package highlight-symbol
  :bind
  (("M-s h ." . highlight-symbol)
   ("M-s h ," . highlight-symbol-nav-mode)))

(use-package ido
  :config
  (setq ido-save-directory-list-file (expand-tmp "ido.last")))

(use-package flx-ido
  :demand

  :commands
  ido-everywhere

  :init
  (setq
   ido-enable-dot-prefix    t
   ido-enable-flex-matching t
   ido-show-dot-for-dired   nil)

  :config
  (ido-mode       1)
  (ido-everywhere 1)
  (flx-ido-mode   1))

(use-package recentf
  :config
  (setq recentf-save-file (expand-tmp "recentf")))

(use-package bookmark
  :config
  (setq bookmark-default-file (expand-tmp "bookmarks")))

(use-package page-break-lines
  :config
  (global-page-break-lines-mode))

(use-package flyspell
  :hook
  ((prog-mode . flyspell-prog-mode)
   (text-mode . flyspell-mode)))

(use-package flycheck
  :init
  (global-flycheck-mode))

(use-package monokai-theme
  :config
  (load-theme 'monokai t))

(use-package telephone-line
  :config
  (setq telephone-line-lhs
        '((evil   . (telephone-line-process-segment telephone-line-vc-segment))
          (accent . (telephone-line-projectile-segment))
          (nil    . (telephone-line-buffer-name-segment))))
  (setq telephone-line-rhs
        '((nil    . (telephone-line-flycheck-segment))
          (accent . (telephone-line-major-mode-segment))
          (evil   . (telephone-line-position-segment))))
  (telephone-line-mode 1))

(use-package neotree
  :config
  (setq neo-window-width      40)
  (setq neo-theme        "ascii")
  (defun neotree-toggle-in-project ()
    (interactive)
    (if (and
         (not (neo-global--window-exists-p))
         (projectile-project-p))
        (neotree-projectile-action)
      (neotree-toggle)))

  :bind
  ("M-j" . neotree-toggle-in-project))

(use-package smex
  :config
  (setq smex-save-file (expand-tmp "smex-items"))

  :bind
  ("M-x" . smex)
  ("M-X" . smex-major-mode-commands))

(use-package anzu
  :config
  (global-anzu-mode 1))

(use-package projectile
  :demand

  :commands
  projectile-project-p

  :config
  (setq
   projectile-use-git-grep t
   projectile-known-projects-file (expand-tmp "projectile-bookmarks.eld")
   projectile-switch-project-action 'neotree-projectile-action)
  (projectile-mode 1)

  :bind-keymap
  ("C-c p" . projectile-command-map))

(use-package popup-imenu
  :commands
  popup-imenu

  :bind
  ("M-i" . popup-imenu)

  :config
  (setq popup-imenu-style 'indent))

(use-package magit
  :config
  (magit-auto-revert-mode -1))

(use-package git-timemachine)

(use-package git-gutter
  :config
  (custom-set-variables
   '(git-gutter:modified-sign " * ")
   '(git-gutter:added-sign    " + ")
   '(git-gutter:deleted-sign  " - ")))

(use-package company
  :commands
  company-mode

  :bind
  ("M-RET" . company-complete)

  :config
  (setq company-tooltip-align-annotations t))

(use-package yasnippet
  :commands
  (yas-minor-mode yas-reload-all)

  :config
  (yas-reload-all))

(use-package smartparens
  :after
  smartparens-config

  :commands
  sp-pair

  :bind
  ("C-M-y" . sp-down-sexp)

  :config
  (sp-use-smartparens-bindings)
  (sp-pair "(" ")" :wrap "s-(")
  (sp-pair "[" "]" :wrap "s-[")
  (sp-pair "{" "}" :wrap "s-{"))

(use-package whitespace-cleanup-mode
  :config
  (global-whitespace-cleanup-mode 1))

(use-package expand-region
  :commands
  er/expand-region

  :bind
  ("M-o" . er/expand-region))

(use-package ctags-update
  :commands
  turn-on-ctags-auto-update-mode

  :config
  (setq ctags-update-prompt-create-tags nil)

  :hook
  (prog-mode . turn-on-ctags-auto-update-mode))

(use-package subword
  :hook
  (prog-mode . subword-mode))

(add-window-hook             'toggle-frame-fullscreen)

(global-set-key (kbd "C-k")          'kill-whole-line)
(global-set-key (kbd "C-S-k")       'kill-visual-line)
(global-set-key (kbd "M-l")               'linum-mode)

(global-set-key [remap dabbrev-expand] 'hippie-expand)

(provide 'init-default)

;;; init-default.el ends here

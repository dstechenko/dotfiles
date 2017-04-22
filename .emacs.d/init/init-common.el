;;; init-common.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Common packages configuration and tweaks.
;;

;;; Code:

(require 'package)
(require 'dired-x)
(require 'init-util)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")
                         ("elpy" . "http://jorgenschaefer.github.io/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'exec-path "/usr/local/bin")

(setq
 user-full-name "Dmytro Stechenko"
 user-emacs-directory (file-truename "~/.emacs.d/")
 custom-file (expand-tmp "custom.el"))

(load custom-file)

(setq
 debug-on-error nil
 debug-on-quit nil)

(setq
 shell-file-name "/bin/bash"
 shell-command-switch "-ic")

(set-frame-font "PragmataPro")
(fset 'yes-or-no-p 'y-or-n-p)

(add-hook 'window-setup-hook 'toggle-frame-fullscreen)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(line-number-mode 1)
(column-number-mode 1)
(show-paren-mode 1)
(global-visual-line-mode 1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(mouse-wheel-mode -1)
(electric-indent-mode -1)
(blink-cursor-mode -1)

(setq
 mac-control-modifier 'control
 mac-command-modifier 'meta
 mac-pass-command-to-system nil
 mac-pass-control-to-system nil
 mac-right-command-modifier 'super
 mac-right-option-modifier 'hyper
 mac-option-modifier nil)

(defvar tags-revert-without-query t)
(defvar mac-command-key-is-meta t)

(setq
 vc-follow-symlinks t
 inhibit-startup-screen t
 scroll-error-top-bottom t
 tags-add-tables nil
 initial-scratch-message nil
 create-lockfiles nil
 make-backup-files nil
 tooltip-mode nil
 show-help-function nil
 sentence-end-double-space nil
 ring-bell-function 'ignore)

(setq-default
 fill-column 80
 tab-width 4
 c-basic-offset 4
 indent-tabs-mode nil
 cursor-in-non-selected-windows nil)

(diminish 'visual-line-mode)

(use-package ido
  :config
  (setq ido-save-directory-list-file (expand-tmp "ido.last")))

(use-package recentf
  :config
  (setq recentf-save-file (expand-tmp "recentf")))

(use-package bookmark
  :config
  (setq bookmark-default-file (expand-tmp "bookmarks")))

(use-package page-break-lines
  :diminish
  page-break-lines-mode)

(use-package flyspell
  :diminish
  flyspell-mode)

(use-package disable-mouse
  :diminish
  global-disable-mouse-mode

  :config
  (global-disable-mouse-mode))

(use-package base16-theme
  :config
  (load-theme 'base16-monokai t))

(use-package smart-mode-line
  :config
  (setq
   sml/no-confirm-load-theme t
   sml/theme 'respectful)
  (sml/setup))

(use-package neotree
  :commands
  (neo-buffer--lock-width
   neo-buffer--unlock-width
   neo-global--window-exists-p)

  :config
  (setq
   neo-window-width 40
   neo-theme "ascii")

  (defun toggle-neotree-projectile-mode ()
    (interactive)
    (if (and
         (not (neo-global--window-exists-p))
         (projectile-project-p))
        (neotree-projectile-action)
      (neotree-toggle)))

  :bind
  ("H-o" . toggle-neotree-projectile-mode))

(use-package smex
  :bind
  ("M-x" . smex)
  ("M-X" . smex-major-mode-commands)

  :config
  (setq smex-save-file (expand-tmp "smex-items")))

(use-package anzu
  :diminish
  anzu-mode

  :config
  (global-anzu-mode 1))

(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents  . 5)
                          (projects . 5)
                          (bookmarks . 5))))

(use-package projectile
  :diminish
  projectile-mode

  :demand
  (setq projectile-use-git-grep t)

  :commands
  projectile-project-p

  :config
  (projectile-mode 1)
  (setq
   projectile-known-projects-file (expand-tmp "projectile-bookmarks.eld")
   projectile-tags-backend 'etags-select
   projectile-switch-project-action 'neotree-projectile-action)

  :bind
  ("s-o" . projectile-find-file)
  ("s-p" . projectile-grep)
  ("M-." . projectile-find-tag)
  ("s-'" . projectile-regenerate-tags))

(use-package flx-ido
  :demand

  :commands
  ido-everywhere

  :init
  (setq
   ido-enable-flex-matching t
   ido-show-dot-for-dired nil
   ido-enable-dot-prefix t)

  :config
  (ido-mode 1)
  (ido-everywhere 1)
  (flx-ido-mode 1))

(use-package popup-imenu
  :commands
  popup-imenu

  :config
  (setq popup-imenu-style 'flat)

  :bind
  ("M-i" . popup-imenu))

(use-package magit
  :commands
  magit-status

  :config
  (magit-auto-revert-mode -1)

  :bind
  ("s-g" . magit-status))

(use-package git-timemachine
  :bind
  ("s-G" . git-timemachine-toggle))

(use-package git-gutter
  :diminish
  git-gutter-mode "Git"

  :config
  (custom-set-variables '(git-gutter:modified-sign "*")
                        '(git-gutter:added-sign "+")
                        '(git-gutter:deleted-sign "-"))

  :bind
  ("s-t" . git-gutter-mode)
  ("s-T" . git-gutter:revert-hunk))

(use-package company
  :diminish
  company-mode

  :commands
  company-mode

  :config
  (define-key company-active-map [tab] nil))

(use-package yasnippet
  :diminish
  yas-minor-mode

  :commands
  (yas-minor-mode yas-reload-all)

  :config
  (yas-reload-all)

  :bind
  ("C-<tab>" . yas-describe-tables))

(use-package smartparens
  :diminish
  smartparens-mode

  :commands
  sp-pair

  :config
  (require 'smartparens-config)
  (sp-use-smartparens-bindings)
  (sp-pair "(" ")" :wrap "s-(")
  (sp-pair "[" "]" :wrap "s-[")
  (sp-pair "{" "}" :wrap "s-{")

  :bind
  ("C-M-y" . sp-down-sexp))

(use-package whitespace-cleanup-mode
  :diminish
  whitespace-cleanup-mode

  :config
  (global-whitespace-cleanup-mode 1))

(use-package expand-region
  :commands
  er/expand-region

  :bind
  ("s-w" . er/expand-region))

(use-package etags-select
  :commands etags-select-find-tag)

(use-package ctags-update
  :diminish
  ctags-auto-update-mode

  :commands
  turn-on-ctags-auto-update-mode

  :init
  (add-hook 'prog-mode-hook  'turn-on-ctags-auto-update-mode))

(use-package exec-path-from-shell
  :init
  (exec-path-from-shell-initialize))

(use-package beacon
  :diminish
  beacon-mode

  :config
  (beacon-mode 1)
  (setq
   beacon-size 15
   beacon-blink-when-focused t
   beacon-blink-when-point-moves-vertically 2
   beacon-blink-when-point-moves-horizontally 2
   beacon-color (face-attribute 'cursor :background)))

(global-set-key (kbd "C-k") 'kill-whole-line)
(global-set-key (kbd "C-.") 'xref-find-definitions)
(global-set-key (kbd "C-S-k") 'kill-visual-line)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "s-i") 'ispell-word)
(global-set-key [remap dabbrev-expand] 'hippie-expand)

(provide 'init-common)

;;; init-common.el ends here

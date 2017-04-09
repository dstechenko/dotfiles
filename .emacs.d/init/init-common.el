;;; init-common.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Common packages configuration and tweaks.
;;

;;; Code:

;; Init package load
(require 'package)

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

;; Set home directory
(setq user-emacs-directory (file-truename "~/.emacs.d/"))

;; Set current user
(setq user-full-name "Dmytro Stechenko")

;; Set execution path
(add-to-list 'exec-path "/usr/local/bin")

;; Set debug mode
(setq
 debug-on-error nil
 debug-on-quit nil)

;; Set default shell
(setq shell-file-name "/bin/bash")
(setq shell-command-switch "-ic")

;; Set default font
(set-frame-font "PragmataPro")

;; Set fullscreen on startup
(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)

;; Set spell check
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; Set yes/no shortcuts
(fset 'yes-or-no-p 'y-or-n-p)

;; Set minor modes
(line-number-mode 1)
(column-number-mode 1)
(show-paren-mode 1)
(global-visual-line-mode 1)

;; Disable minor modes
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(mouse-wheel-mode -1)
(electric-indent-mode -1)

;; Set macOS modifiers
(setq
 mac-control-modifier 'control
 mac-command-modifier 'meta
 mac-option-modifier 'nil
 mac-right-command-modifier 'super
 mac-right-option-modifier 'hyper)

;; Set undefined configuration
(defvar show-paren-delay)

;; Set default configuration
(setq
 inhibit-startup-screen t
 initial-scratch-message nil
 create-lockfiles nil
 make-backup-files nil
 tooltip-mode nil
 scroll-error-top-bottom t
 show-paren-delay 0.5
 sentence-end-double-space nil
 ring-bell-function 'ignore)

;; Set default buffer local configuration
(setq-default
 fill-column 80
 indent-tabs-mode nil
 tab-width 4
 c-basic-offset 4)

;; Diminish minor modes
(diminish 'visual-line-mode "vl")
(diminish 'defining-kbd-macro "dm")

(require 'dired-x)

(use-package page-break-lines
  :diminish
  page-break-lines-mode "pb")

(use-package flyspell
  :diminish
  flyspell-mode "fs")

(use-package disable-mouse
  :diminish
  global-disable-mouse-mode "dm"

  :config
  (global-disable-mouse-mode))

(use-package zenburn-theme
  :config
  (load-theme 'zenburn t))

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
  ("M-X" . smex-major-mode-commands))

(use-package anzu
  :diminish
  anzu-mode "az"

  :config
  (global-anzu-mode 1))

(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq
   dashboard-startup-banner 'logo
   dashboard-items '((recents  . 5) (projects . 5) (bookmarks . 5))))

(use-package projectile
  :diminish
  projectile-mode "pj"

  :demand
  (setq projectile-use-git-grep t)

  :commands
  projectile-project-p

  :config
  (projectile-mode 1)
  (setq
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
  git-gutter-mode "gg"

  :config
  (custom-set-variables '(git-gutter:modified-sign "*")
                        '(git-gutter:added-sign "+")
                        '(git-gutter:deleted-sign "-"))

  :bind
  ("s-t" . git-gutter-mode)
  ("s-T" . git-gutter:revert-hunk))

(use-package company
  :diminish
  company-mode "cm"

  :commands
  company-mode

  :config
  (define-key company-active-map [tab] nil))

(use-package yasnippet
  :diminish
  yas-minor-mode "ys"

  :commands
  (yas-minor-mode yas-reload-all)

  :config
  (yas-reload-all)

  :bind
  ("C-<tab>" . yas-describe-tables))

(use-package smartparens
  :diminish
  smartparens-mode "sp"

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
  whitespace-cleanup-mode "wc"

  :config
  (global-whitespace-cleanup-mode 1))

(use-package expand-region
  :commands
  er/expand-region

  :bind
  ("s-w" . er/expand-region))

(use-package etags-select
  :commands etags-select-find-tag)

;; Set general bindings
(global-set-key (kbd "C-k") 'kill-whole-line)
(global-set-key (kbd "C-.") 'xref-find-definitions)
(global-set-key (kbd "C-S-k") 'kill-visual-line)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "s-i") 'ispell-word)
(global-set-key [remap dabbrev-expand] 'hippie-expand)

;; Init package
(provide 'init-common)

;;; init-common.el ends here

;;; init-common.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Common packages configuration and tweaks.
;;
;; Includes the following:
;; - zenburn-theme
;; - smart-mode-line
;; - neotree
;; - sunrise-commander
;; - sunrise-x-buttons
;; - smex
;; - anzu
;; - dashboard
;; - projectile
;; - highlight-symbol
;; - flx
;; - ido
;; - popup-imenu
;; - undo-tree
;; - goto-chg
;; - magit
;; - git-gutter
;; - git-timemachine
;; - company
;; - yasnippet
;; - smartparens
;; - aggressive-indent
;; - whitespace-cleanup-mode
;; - expand-region
;;

;;; Code:

;; Init package load
(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")
                         ("elpy" . "http://jorgenschaefer.github.io/packages/")
                         ("sc"  . "http://joseito.republika.pl/sunrise-commander/")))

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
(setq exec-path (append exec-path '("/usr/local/bin")))

;; Set debug mode
(setq
 debug-on-error nil
 debug-on-quit nil)

;; Set default shell
(setq shell-file-name "/bin/bash")

;; Set default font
(set-frame-font "Source Code Pro")

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
(global-hl-line-mode 1)
(global-visual-line-mode 1)

;; Disable minor modes
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(mouse-wheel-mode -1)
(electric-indent-mode -1)

(when window-system
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

;; Set Mac OS X modifiers
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

(use-package zenburn-theme
  :config
  (load-theme 'zenburn t))

(use-package smart-mode-line
  :config
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme 'respectful)
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

(use-package sunrise-commander
  :commands
  (sr-detect-switch
   sr-select-window)

  :bind
  ("H-O" . sunrise))

(use-package sunrise-x-buttons)

(use-package smex
  :bind
  ("M-x" . smex)
  ("M-X" . smex-major-mode-commands))

(use-package anzu
  :diminish
  anzu-mode

  :config
  (global-anzu-mode 1))

(use-package dashboard
  :config
  (setq dashboard-startup-banner 'logo)
  (dashboard-setup-startup-hook))

(use-package projectile
  :diminish
  projectile-mode

  :demand
  (setq projectile-use-git-grep t)

  :commands
  projectile-project-p

  :config
  (projectile-mode 1)
  (setq projectile-switch-project-action 'neotree-projectile-action)

  :bind
  ("H-f" . projectile-find-file)
  ("H-F" . projectile-grep))

(use-package highlight-symbol
  :diminish
  highlight-symbol-mode

  :commands
  highlight-symbol

  :config
  (defun toggle-highlight-symbol ()
    (interactive)
    (if (bound-and-true-p highlight-symbol-nav-mode)
        (highlight-symbol-nav-mode -1)
      (highlight-symbol-nav-mode 1))
    (highlight-symbol))

  :bind
  ("M-h" . toggle-highlight-symbol))

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

(use-package undo-tree
  :diminish
  undo-tree-mode

  :config
  (global-undo-tree-mode 1)

  :bind
  ("C-?" . undo-tree-visualize))

(use-package goto-chg
  :commands
  goto-last-change

  :bind
  ("C-<" . goto-last-change)
  ("C->" . goto-last-change-reverse))

(use-package magit
  :commands
  magit-status

  :config
  (magit-auto-revert-mode -1)

  :bind
  ("H-g" . magit-status))

(use-package git-gutter
  :diminish
  git-gutter-mode

  :config
  (global-git-gutter-mode t)
  (custom-set-variables
   '(git-gutter:modified-sign "*")
   '(git-gutter:added-sign "+")
   '(git-gutter:deleted-sign "-"))

  :bind
  ("H-r" . git-gutter:revert-hunk))

(use-package git-timemachine
  :bind
  ("H-t" . git-timemachine-toggle))

(use-package company
  :diminish
  company-mode

  :commands
  company-mode

  :config
  (defvar company-dabbrev-code-ignore-case)
  (defvar company-dabbrev-ignore-case)
  (defvar company-dabbrev-downcase)

  (setq
   company-dabbrev-ignore-case nil
   company-dabbrev-code-ignore-case nil
   company-dabbrev-downcase nil
   company-idle-delay 0
   company-minimum-prefix-length 4)

  (define-key company-active-map [tab] nil))

(use-package yasnippet
  :diminish
  yas-minor-mode

  :commands
  (yas-minor-mode
   yas-reload-all)

  :config
  (yas-reload-all))

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

(use-package whole-line-or-region
  :config
  (whole-line-or-region-mode))

;; Set general bindings
(global-set-key (kbd "s-e") 'ispell-word)
(global-set-key (kbd "s-r") 'replace-string)
(global-set-key (kbd "H-h") 'shr-render-buffer)

;; Init package
(provide 'init-common)

;;; init-common.el ends here

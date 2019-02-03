;;; init-default.el --- Emacs configuration

;; Copyright (C) 2019 Dmytro Stechenko
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
(setq use-package-always-defer t)
(setq use-package-always-ensure t)

(use-package exec-path-from-shell
  :init
  (exec-path-from-shell-initialize))

(use-package flyspell)

(use-package ido
  :config
  (setq ido-save-directory-list-file (expand-tmp "ido.last")))

(use-package recentf
  :config
  (setq recentf-save-file (expand-tmp "recentf")))

(use-package bookmark
  :config
  (setq bookmark-default-file (expand-tmp "bookmarks")))

(use-package page-break-lines)

(use-package flycheck
  :init
  (global-flycheck-mode))

(use-package base16-theme
  :ensure t
  :config
  (load-theme 'base16-tomorrow-night t))

(use-package smart-mode-line
  :config
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme               nil)
  (setq rm-blacklist             "")
  (sml/setup))

(use-package neotree
  :config
  (setq neo-show-hidden-files  t)
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
  :bind
  ("M-x" . smex)
  ("M-X" . smex-major-mode-commands)

  :config
  (setq smex-save-file (expand-tmp "smex-items")))

(use-package anzu
  :config
  (global-anzu-mode 1))

(use-package projectile
  :demand
  (setq projectile-use-git-grep t)

  :commands
  projectile-project-p

  :config
  (projectile-mode 1)
  (setq
   projectile-known-projects-file (expand-tmp "projectile-bookmarks.eld")
   projectile-switch-project-action 'neotree-projectile-action))

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

  :config
  (setq company-tooltip-align-annotations t)

  :bind
  ("M-RET" . company-complete))

(use-package yasnippet
  :commands
  (yas-minor-mode yas-reload-all)

  :config
  (yas-reload-all))

(use-package smartparens
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
  (setq ctags-update-prompt-create-tags nil))

(use-package subword)

(use-package rainbow-delimiters)

(use-package auto-package-update
  :config
  (auto-package-update-maybe))

(add-window-hook             'toggle-frame-fullscreen)
(add-prog-hook               'rainbow-delimiters-mode)
(add-prog-hook        'turn-on-ctags-auto-update-mode)
(add-prog-hook                          'subword-mode)
(add-text-hook                         'flyspell-mode)
(add-prog-hook                    'flyspell-prog-mode)

(global-set-key (kbd "s-i")              'ispell-word)
(global-set-key (kbd "C-k")          'kill-whole-line)
(global-set-key (kbd "C-S-k")       'kill-visual-line) ;; FIX ME


(global-set-key [remap dabbrev-expand] 'hippie-expand)

(provide 'init-default)

;;; init-default.el ends here

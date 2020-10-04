;;; init-shared.el --- Shared Emacs configuration

;; Copyright (C) Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Code:

;;;
;;  TODO:
;;    add tabnine
;;    add flymake/flycheck
;;    add clang format to default
;;;

;;;
;; FUNCTIONS
;;;

(defun expand-emacs (path)
  "Expands `PATH' with Emacs home directory."
  (expand-file-name path user-emacs-directory))

(defun expand-tmp (path)
  "Expand `PATH' with Emacs temporary directory."
  (expand-emacs (concat "tmp" "/" path)))

(defun expand-bin (path)
  "Expand `PATH' with Emacs binaries directory."
  (expand-emacs (concat "bin" "/" path)))

(defun ensure-dir-exists (directory)
  "Create `DIRECTORY' if does not exist."
  (when (not (file-exists-p directory))
    (make-directory directory t)))

(defun ensure-file-exists (file)
  "Create `FILE' if does not exist."
  (when (not (file-exists-p file))
    (with-temp-buffer (write-file file))))

(defun close-all-buffers ()
  "Kill all buffers."
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

(defun close-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

;;;
;; CONFIGS
;;;

;; Set current user

(setq user-full-name "Dmytro Stechenko")

;; Set minor modes

(delete-selection-mode   1)
(transient-mark-mode     1)
(line-number-mode        1)
(column-number-mode      1)
(show-paren-mode         1)
(menu-bar-mode          -1)
(electric-indent-mode   -1)
(blink-cursor-mode      -1)

;; Set global minor modes

(global-auto-revert-mode 1)
(global-visual-line-mode 1)

;; Set config variables

(setq
 read-file-name-completion-ignore-case t
 inhibit-startup-screen                t
 scroll-error-top-bottom               t
 make-pointer-invisible                t
 package-check-signature               nil
 debug-on-error                        nil
 debug-on-quit                         nil
 tags-add-tables                       nil
 initial-scratch-message               nil
 create-lockfiles                      nil
 make-backup-files                     nil
 tooltip-mode                          nil
 show-help-function                    nil
 sentence-end-double-space             nil
 ring-bell-function                   'ignore)

(fset 'yes-or-no-p 'y-or-n-p)

;; Set config default variables

(setq-default
 find-file-visit-truename       t
 fill-column                    80
 tab-width                      2
 c-basic-offset                 2
 python-indent-offset           4
 show-trailing-whitespace       nil
 indent-tabs-mode               nil
 cursor-in-non-selected-windows nil)

;; Set repositories

(setq package-archives
      '(("gnu"          . "http://elpa.gnu.org/packages/")
        ("org"          . "http://orgmode.org/elpa/")
        ("melpa"        . "http://melpa.org/packages/")
        ("melpa-stable" . "http://stable.melpa.org/packages/")
        ("elpy"         . "http://jorgenschaefer.github.io/packages/")))

;; Set custom file handling

(ensure-dir-exists (expand-tmp ""))
(setq custom-file  (expand-tmp "custom.el"))
(ensure-file-exists custom-file)
(load custom-file t)

;; Set default hooks

(add-hook
 'prog-mode-hook
 (lambda ()
   (setq show-trailing-whitespace t)))

(add-hook
 'smerge-mode-hook
 (lambda ()
   (set-face-attribute
    'smerge-markers nil
    :background "brightred" :foreground "brightwhite")))

;; Set faces

(set-face-background 'trailing-whitespace "brightred")

(set-face-attribute
 'fringe nil
 :foreground (face-foreground 'default)
 :background (face-background 'default))

;;;
;; PACKAGES
;;;

;; Load package manager

(require 'package)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

(setq use-package-always-ensure t)

;; Load default packages

(require 'dired-x)

(load-theme 'tango-dark t)

(use-package auto-package-update
  :config
  (auto-package-update-maybe))

(use-package highlight-symbol
  :hook
  (prog-mode . highlight-symbol-mode)
  (prog-mode . highlight-symbol-nav-mode))

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

(use-package flycheck)

(use-package telephone-line
  :config
  (telephone-line-defsegment
    telephone-line-buffer-fb-project-mode-segment
    () fb-project-mode)

  (set-face-attribute
   'mode-line-inactive nil
   :background (face-background 'default)
   :foreground (face-background 'default))

  (set-face-attribute
   'mode-line nil
   :background (face-background 'default)
   :foreground (face-background 'default))

  (set-face-attribute
   'telephone-line-accent-active nil
   :background "black"
   :foreground "brightwhite")

  (set-face-attribute
   'telephone-line-accent-inactive nil
   :background (face-background 'default)
   :foreground "brightwhite")

  (setq
   telephone-line-primary-right-separator   'telephone-line-nil
   telephone-line-secondary-right-separator 'telephone-line-nil
   telephone-line-primary-left-separator    'telephone-line-nil
   telephone-line-secondary-left-separator  'telephone-line-nil)

  (setq
   telephone-line-lhs
   '((accent . (telephone-line-buffer-modified-segment))
     (accent . (telephone-line-buffer-fb-project-mode-segment))
     (accent . (telephone-line-buffer-name-segment)))
   telephone-line-rhs
   '((accent . (telephone-line-flycheck-segment))
     (accent . (telephone-line-major-mode-segment))
     (accent . (telephone-line-position-segment))))
  (telephone-line-mode 1))

(use-package git-gutter
  :bind
  ("M-g M-h" . git-gutter-mode)

  :config

  :config
  (setq git-gutter:handled-backends '(git hg))
  (custom-set-variables
   '(git-gutter:modified-sign " * ")
   '(git-gutter:added-sign    " + ")
   '(git-gutter:deleted-sign  " - ")))

(use-package smex
  :config
  (setq smex-save-file (expand-tmp "smex-items"))

  :bind
  ("M-x" . smex)
  ("M-X" . smex-major-mode-commands))

(use-package anzu
  :config
  (global-anzu-mode 1))

(use-package popup-imenu
  :commands
  popup-imenu

  :bind
  ("M-i" . popup-imenu)

  :config
  (setq popup-imenu-style 'indent))

(use-package company
  :commands
  company-mode

  :bind
  ("M-RET" . company-complete)

  :hook
  (prog-mode . company-mode)

  :config
  (customize-set-variable
   'company-minimum-prefix-length 1)
  (customize-set-variable
   'company-backends
   '(company-bbdb
     company-nxml
     company-css
     company-capf
     company-dabbrev
     (company-dabbrev-code company-keywords)))
  (setq
   company-tooltip-align-annotations t
   company-dabbrev-downcase          nil))

(use-package goto-last-change
  :commands
  goto-last-change

  :bind
  ("M-/" . goto-last-change))

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

(use-package subword
  :hook
  (prog-mode . subword-mode))

(use-package shell
  :hook
  (shell-mode
   . (lambda ()
       (setq show-trailing-whitespace nil))))

(use-package warnings
  :custom
  (warning-minimum-level :error))

;; Load elisp packages

(use-package auto-compile
  :init
  (auto-compile-on-load-mode 1)
  (auto-compile-on-save-mode 1))

(use-package eldoc
  :commands
  eldoc-mode)

(use-package emacs
  :bind
  (:map emacs-lisp-mode-map
        ("RET" . comment-indent-new-line))

  :hook
  (emacs-lisp-mode
   . (lambda ()
       (setq-default flycheck-emacs-lisp-load-path 'inherit)
       (setq         show-trailing-whitespace             t)
       (eldoc-mode)
       (yas-minor-mode)
       (show-paren-mode)
       (smartparens-strict-mode))))

;; Load python packages

(use-package elpy
  :commands
  elpy-enable

  :init
  (elpy-enable)
  (unbind-key "C-c C-f" elpy-mode-map)

  :config
  (setq
   elpy-rpc-virtualenv-path 'current
   elpy-rpc-timeout         nil
   elpy-rpc-python-command  "/usr/bin/python3"
   elpy-modules             (delete 'elpy-module-flymake elpy-modules))

  :hook
  (elpy-mode
   . (lambda ()
       (highlight-indentation-mode -1))))

;; Load org packages

(use-package org
  :commands
  org-mode

  :mode
  ("\\.org\\'" . org-mode))

;; Load markdown packages

(use-package markdown-mode
  :commands
  (markdown-mode gfm-mode)

  :mode
  (("README\\.md\\'" . gfm-mode)
   ("\\.md\\'"       . markdown-mode)
   ("\\.markdown\\'" . markdown-mode)))

;; Load cpp packages

(use-package modern-cpp-font-lock
  :config
  (add-hook
   'c-common-mode
   (lambda () (modern-c++-font-lock-mode 1))))

;;;
;; GLOBAL BINDINGS
;;;

;; Set common keybindings
(global-set-key (kbd       "C-k")  'kill-whole-line)
(global-set-key (kbd   "M-g M-l")  'linum-mode)
(global-set-key (kbd      "M-\\")  'comment-or-uncomment-region)
(global-set-key (kbd      "C-\\")  'indent-region)
(global-set-key (kbd     "C-x l")  'revert-buffer)
(global-set-key (kbd "C-x C-k a")  'close-all-buffers)
(global-set-key (kbd "C-x C-k o")  'close-other-buffers)

(global-set-key [C-M-tab]        'clang-format-region)

;; Unset xref-find functionality
(global-unset-key     (kbd "M-."))
(global-unset-key     (kbd "M-?"))
(global-unset-key   (kbd "C-M-."))
(global-unset-key (kbd "C-x 4 ."))
(global-unset-key (kbd "C-x 5 ."))

(provide 'init-default)

;;; init-shared.el ends here
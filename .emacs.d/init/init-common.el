;;; init-common.el --- Emacs configuration

;; Copyright (C) 2016 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Common packages configuration and tweaks.
;;
;; Includes the following:
;; - solarized-theme
;; - neotree
;; - sunrise-commander
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
;; - move-dup
;; - aggressive-indent
;; - whitespace-cleanup-modec
;; - multiple-cursors
;; - expand-region
;; - subword
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
(set-frame-font "Menlo")

;; Set fullscreen on startup
(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)

;; Set spell check
;; (add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; Set yes/no shortcuts
(fset 'yes-or-no-p 'y-or-n-p)

;; Set minor modes
(line-number-mode 1)
(column-number-mode 1)
(show-paren-mode 1)

;; Disable minor modes
(scroll-bar-mode -1)
(menu-bar-mode -1)
(mouse-wheel-mode -1)
(electric-indent-mode -1)

(when window-system
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

;; Set Mac OS X modifiers
(setq
 mac-control-modifier nil
 mac-command-modifier 'control
 mac-option-modifier 'meta
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
 scroll-error-top-bottom t
 show-paren-delay 0.5
 sentence-end-double-space nil
 ring-bell-function 'ignore)

;; Set default buffer local configuration
(setq-default
 indent-tabs-mode nil
 tab-width 4
 c-basic-offset 4)

(use-package solarized-theme
  :config
  (load-theme 'solarized-dark t))

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

(use-package projectile
  :demand
  (setq projectile-use-git-grep t)

  :config
  (projectile-mode 1)
  (setq projectile-switch-project-action 'neotree-projectile-action)

  :bind
  (("H-f" . projectile-find-file)
   ("H-F" . projectile-grep)))

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
  ("s-/" . undo-tree-visualize))

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
  (smartparens-strict-mode
   smartparens-mode
   sp-pair
   sp-local-pair
   sp-kill-sexp
   sp-backward-kill-sexp
   sp-backward-kill-word
   sp-restrict-to-pairs-interactive)

  :config
  (require 'smartparens-config)
  (sp-use-smartparens-bindings)

  (sp-pair "(" ")" :wrap "s-(")
  (sp-pair "[" "]" :wrap "s-[")
  (sp-pair "{" "}" :wrap "s-{")

  ;; WORKAROUND https://github.com/Fuco1/smartparens/issues/543
  (bind-key "C-<left>" nil smartparens-mode-map)
  (bind-key "C-<right>" nil smartparens-mode-map)

  (bind-key "s-<kp-delete>" 'sp-kill-sexp smartparens-mode-map)
  (bind-key "s-<backspace>" 'sp-backward-kill-sexp smartparens-mode-map))

(use-package move-dup
  :bind
  ("s-p" . md/move-lines-up)
  ("s-n" . md/move-lines-down)
  ("s-d" . md/duplicate-down))

(use-package whitespace-cleanup-mode
  :diminish
  whitespace-cleanup-mode

  :config
  (global-whitespace-cleanup-mode 1))

(use-package multiple-cursors
  :commands
  rrm/switch-to-multiple-cursors

  :bind
  ("s-[" . mc/mark-previous-like-this)
  ("s-]" . mc/mark-next-like-this)
  ("s-\\" . mc/mark-all-like-this)
  ("s-|" . mc/edit-lines))

(use-package expand-region
  :commands
  er/expand-region

  :bind
  ("s-w" . er/expand-region))

(use-package subword
  :diminish
  subword-mode

  :commands
  subword-backward-kill

  :config
  (global-subword-mode t))

;; Set a proper goto command
(defun goto-line-and-column (input)
  "Go to a line, an optional column could be provided using 'line:column' as INPUT."
  (interactive "sGoto: ")
  (if (and (stringp input)
           (string-match "\\([0-9]+\\)\\(:[0-9]+\\)?" input))
      (let* ((line-string (match-string 1 input))
             (column-string (match-string 2 input))
             (line (string-to-number line-string))
             (column (if (null column-string)
                         0 (string-to-number (substring column-string 1)))))
        (goto-char (point-min))
        (forward-line (1- line))
        (move-to-column column))
    (error "Wrong arguments, try <line:column> or simply <line>")))

;; Set comment toggle
(defun toggle-comment-on-line ()
  "Toggle comment on the current line."
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

;; Set I-search selection
(defun search-selection (beg end)
  "Search for the selected text with I-search, providing beginning as BEG, and ending with END."
  (interactive "r")
  (let ((selection (buffer-substring-no-properties beg end)))
    (deactivate-mark)
    (isearch-mode t)
    (isearch-yank-string selection)))

;; Set lock for mouse actions
(dolist (type '(mouse down-mouse drag-mouse double-mouse triple-mouse))
  (dolist (prefix '("" C- M- S- M-S- C-M- C-S- C-M-S-))
    (dotimes (index 7)
      (let ((binding (format "%s%s-%s" prefix type index)))
        (global-set-key (vector (intern binding)) #'ignore)))))

;; Set lock for keyboard arrow actions
(dolist (side '(left right up down))
  (dolist (type '("" wheel- double-wheel- tripple-wheel-))
    (dolist (prefix '("" C- M- S- M-S C-M- C-S- C-M-S-))
      (let ((binding (format "<%s%s%s>" prefix type side)))
        (global-set-key (kbd binding) #'ignore)))))

;; Set general bindings
(global-set-key (kbd "C-k") 'kill-whole-line)
(global-set-key (kbd "C-S-k") 'kill-line)

(global-set-key (kbd "s-a") 'mark-whole-buffer)
(global-set-key (kbd "s-e") 'ispell-word)
(global-set-key (kbd "s-l") 'goto-line-and-column)
(global-set-key (kbd "s-q") 'search-selection)
(global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "s-z") 'undo)
(global-set-key (kbd "s-;") 'toggle-comment-on-line)


;; Init package
(provide 'init-common)

;;; init-common.el ends here

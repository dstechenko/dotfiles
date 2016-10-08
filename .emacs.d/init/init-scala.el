;;; init-scala.el --- Emacs configuration

;; Copyright (C) 2016 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Scala packages configuration and tweaks.
;;
;; Includes the following:
;; - scala-mode
;; - ensime
;;

;;; Code:

(require 'init-common)

(use-package scala-mode
  :commands
  scala-indent:insert-asterisk-on-multiline-comment

  :interpreter
  ("scala" . scala-mode))

(use-package ensime
  :pin
  melpa-stable

  :commands
  (ensime
   ensime-mode
   ensime-reload)

  :config
  (require 'ensime-expand-region)

  :bind
  ("H-e" . ensime)
  ("H-E" . ensime-reload))

;; Set newline functionality for comments
(defun scala-mode-newline-comments ()
  "Custom newline appropriate for `scala-mode'."
  (interactive)
  (newline-and-indent)
  (scala-indent:insert-asterisk-on-multiline-comment))

;; Set parenthesis
(sp-local-pair 'scala-mode "(" nil :post-handlers '(("||\n[i]" "RET")))
(sp-local-pair 'scala-mode "{" nil :post-handlers '(("||\n[i]" "RET") ("| " "SPC")))

;; Set parenthesis navigation
(defun sp-restrict-c (sym)
  "Smartparens restriction on `SYM' for C-derived parenthesis."
  (sp-restrict-to-pairs-interactive "{([" sym))

;; Set bindings
(defun scala-mode-bindings ()
  "Bind all Scala custom keys."
  (bind-key "RET" 'scala-mode-newline-comments scala-mode-map)
  (bind-key "s-<delete>" (sp-restrict-c 'sp-kill-sexp) scala-mode-map)
  (bind-key "s-<backspace>" (sp-restrict-c 'sp-backward-kill-sexp) scala-mode-map)
  (bind-key "s-<home>" (sp-restrict-c 'sp-beginning-of-sexp) scala-mode-map)
  (bind-key "s-<end>" (sp-restrict-c 'sp-end-of-sexp) scala-mode-map)
  (bind-key "s-{" 'sp-rewrap-sexp smartparens-mode-map)
  (bind-key "C-<tab>" 'dabbrev-expand scala-mode-map))

;; Set hooks
(add-hook 'scala-mode-hook
          (lambda ()
            (setq comment-start "/* "
                  comment-end " */"
                  comment-style 'multi-line
                  comment-empty-lines t)

            (scala-mode-bindings)
            (show-paren-mode)
            (smartparens-mode)
            (yas-minor-mode)
            (git-gutter-mode)
            (company-mode)
            (ensime-mode)

            (scala-mode:goto-start-of-code)))

;; Init package
(provide 'init-scala)

;;; init-scala.el ends here

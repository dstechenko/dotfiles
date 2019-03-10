;;; init-scala.el --- Emacs configuration

;; Copyright (C) 2019 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Scala packages configuration and tweaks.
;;

;;; Code:

(use-package scala-mode
  :pin
  melpa-stable

  :mode
  "\\.s\\(cala\\|bt\\)$"

  :interpreter
  ("scala" . scala-mode))

(use-package sbt-mode
  :pin
  melpa-stable

  :commands
  sbt-command sbt-start

  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; Allows using SPACE when in the minibuffer

  :config
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

(use-package lsp-mode)

(use-package lsp-ui
  :hook
  (lsp-mode . lsp-ui-mode))

(use-package lsp-scala
  :demand t

  :load-path
  lsp-scala-load-path

  :after
  scala-mode

  :hook
  (scala-mode . lsp))

(use-package company-lsp)

(defun scala-restrict-sp (sym)
  "Parenthesis restriction on `SYM' for Scala."
  (sp-restrict-to-pairs-interactive "{([" sym))

(defun run-cli-scalafmt (pos)
  "Format current file using `scalafmt' command line interface, preserving position `POS'."
  (interactive "d")
  (save-buffer)
  (call-process "scalafmt" nil nil nil (format "-i -f %s" (buffer-file-name)))
  (revert-buffer :ignore-auto :noconfirm)
  (goto-char pos))

(defun scala-mode-multi-line-comments ()
  "Bind multi-line comments."
  (setq comment-start "/* "
        comment-end   " */"
        comment-style 'multi-line
        comment-empty-lines t))

(defun scala-mode-smartparens ()
  "Bind parenthesis padding."
  (sp-local-pair 'scala-mode "(" nil :post-handlers '(("||\n[i]" "RET")))
  (sp-local-pair 'scala-mode "{" nil :post-handlers '(("||\n[i]" "RET") ("| " "SPC"))))

(defun scala-mode-newline-comments ()
  "Extend newline operation for `scala-mode' comments."
  (interactive)
  (newline-and-indent)
  (scala-indent:insert-asterisk-on-multiline-comment))

(defun scala-mode-bindings ()
  "Bind all Scala custom keys."
  (bind-key "RET"           'scala-mode-newline-comments                     scala-mode-map)
  (bind-key "H-l"           'run-cli-scalafmt                                scala-mode-map)
  (bind-key "M-<return>"    'dabbrev-expand                                  scala-mode-map)
  (bind-key "s-<delete>"    (scala-restrict-sp 'sp-kill-sexp)                scala-mode-map)
  (bind-key "s-<backspace>" (scala-restrict-sp 'sp-backward-kill-sexp)       scala-mode-map)
  (bind-key "s-{"           'sp-rewrap-sexp                            smartparens-mode-map))

(defun scala-mode-tweaks ()
  "Add all Scala mode tweaks in the right order."
  (show-paren-mode)
  (smartparens-mode)
  (yas-minor-mode)
  (company-mode)
  (scala-mode-bindings)
  (scala-mode-multi-line-comments)
  (scala-mode-smartparens)
  (scala-mode:goto-start-of-code))

(add-hook 'scala-mode-hook 'scala-mode-tweaks)

(provide 'init-scala)

;;; init-scala.el ends here

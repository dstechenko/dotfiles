;;; init-external.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Emacs external profile configuration.
;; Windows packages configuration and tweaks.
;;
;; Includes support of the following:
;; - Python
;; - Emacs Lisp
;; - Markdown
;; - Org
;;
;; Configuration is broken down into sections.
;; Sections outline common modes, hacks or tweaks.
;;

;;; Code:

(defvar win-bash-home        "")
(defvar external-proxy-url   "")
(defvar external-ctags-file  "")

(defvar url-proxy-services '(("no_proxy" . "^\\(localhost\\|10.*\\)")
                             ("http"     .       ,external-proxy-url)
                             ("https"    .       ,external-proxy-url)))

(defvar explicit-shell-file-name (expand-file-name "bash.exe" win-bash-home))
(setq   find-program             (expand-file-name "find.exe" win-bash-home))
(setq   grep-program             (expand-file-name "grep.exe" win-bash-home))

(defvar explicit-bash-args       '("--login" "-i"))
(defvar shell-file-name          explicit-shell-file-name)

(set-frame-font "Consolas")

(add-to-list 'exec-path win-bash-home)

(defadvice grep-compute-defautls (around grep-compute-defaults-advice-null-device)
  "Use /dev/null as the `null-device' for grep."
  (let ((null-device "/dev/null")) ad-do-it))

(ad-activate 'grep-compute-defaults)

(require 'init-default)
(require 'init-python)
(require 'init-elisp)
(require 'init-markdown)
(require 'init-org)

(add-hook 'ctags-auto-update-mode-hook
          (lambda () (setq ctags-update-command external-ctags-file)))

(provide 'init-external)

;;; init-external.el ends here

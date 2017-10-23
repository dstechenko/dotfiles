;;; init-internal.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Emacs internal profile configuration.
;; Mac OS X packages configuration and tweaks.
;;
;; Includes support of the following:
;; - Python
;; - Haskell
;; - Idris
;; - Scala
;; - Emacs Lisp
;; - Coq
;; - Markdown
;; - Org
;;
;; Configuration is broken down into sections.
;; Sections outline common modes, hacks or tweaks.
;;

;;; Code:

(set-frame-font "PragmataPro")

(add-to-list 'exec-path "/usr/local/bin")

(setq
 shell-file-name "/bin/bash"
 shell-command-switch "-ic")

(setq
 mac-control-modifier 'control
 mac-command-modifier 'meta
 mac-pass-command-to-system nil
 mac-pass-control-to-system nil
 mac-right-command-modifier 'super
 mac-right-option-modifier 'hyper
 mac-option-modifier nil)

(defvar mac-command-key-is-meta t)

(use-package exec-path-from-shell
  :init
  (exec-path-from-shell-initialize))

(require 'init-default)
(require 'init-python)
(require 'init-haskell)
(require 'init-idris)
(require 'init-scala)
(require 'init-elisp)
(require 'init-coq)
(require 'init-markdown)
(require 'init-org)

(use-package flyspell
  :diminish
  flyspell-mode)

(add-text-hook 'flyspell-mode)
(add-prog-hook 'flyspell-prog-mode)

(global-set-key (kbd "s-i") 'ispell-word)

(provide 'init-internal)

;;; init-internal.el ends here

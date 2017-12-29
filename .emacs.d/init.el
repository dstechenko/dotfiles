;;; init.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Emacs tweaks an hacks for personal usage.
;; Loads an internal/external profile and default configuration.
;;

;;; Code:

(setq package-archives '(("gnu"          . "http://elpa.gnu.org/packages/")
                         ("org"          . "http://orgmode.org/elpa/")
                         ("melpa"        . "http://melpa.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")
                         ("elpy"         . "http://jorgenschaefer.github.io/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(add-to-list
 'load-path
 (expand-file-name "init" user-emacs-directory))

(require 'init-util)

(require-lin 'init-lin)
(require-mac 'init-mac)
(require-win 'init-win)

(require 'init-constant)
(require 'init-symbols)

(require 'init-default)
(require 'init-c)
(require 'init-python)
(require 'init-haskell)
(require 'init-idris)
(require 'init-scala)
(require 'init-elisp)
(require 'init-coq)
(require 'init-markdown)
(require 'init-org)

(provide 'init)

;;; init.el ends here

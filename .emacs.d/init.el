;;; init.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Emacs tweaks an hacks for personal usage.
;;
;; Includes support of the following:
;; - Idris
;; - Scala
;; - Emacs Lisp
;; - Coq
;; - Markdown
;;
;; Configuration is broken down into sections.
;; Sections outline common modes, hacks or tweaks.

;;; Code:

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(package-initialize)
(add-to-list 'load-path (expand-file-name "init" user-emacs-directory))

(require 'init-symbols)
(require 'init-common)
(require 'init-idris)
(require 'init-scala)
(require 'init-elisp)
(require 'init-coq)
(require 'init-markdown)

(provide 'init)

;;; init.el ends here

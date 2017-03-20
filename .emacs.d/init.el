;;; init.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Emacs tweaks an hacks for personal usage.
;;
;; Includes support of the following:
;; - Emacs Lisp
;; - Scala
;; - Python
;; - Markdown
;; - Coq
;; - Octave
;;
;; Configuration is broken down into sections.
;; Sections outline common modes, hacks or tweaks.

;;; Code:

;; Load customized configuration
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Load init configuration
(package-initialize)
(add-to-list 'load-path (expand-file-name "init" user-emacs-directory))

;; Init bootstrap
(require 'init-common)
(require 'init-elisp)
(require 'init-scala)
(require 'init-python)
(require 'init-markdown)
(require 'init-coq)
(require 'init-octave)

;; Init package
(provide 'init)

;;; init.el ends here

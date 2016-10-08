;;; init.el --- Emacs configuration

;; Copyright (C) 2016 Dmytro Stechenko
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
;;
;; Configuration is broken down into sections.
;; Sections outline common modes, hacks or tweaks.

;;; Code:

;; Load init configuration

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path
             (expand-file-name "init" user-emacs-directory))

;; Init bootstrap
(require 'init-common)
(require 'init-elisp)
(require 'init-scala)
(require 'init-python)
(require 'init-markdown)

;; Init package
(provide 'init)

;;; init.el ends here

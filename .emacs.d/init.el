;;; init.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Emacs tweaks an hacks for personal usage.
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

;;; Code:

(package-initialize)
(add-to-list 'load-path (expand-file-name "init" user-emacs-directory))

(require 'init-util)

(require-mac 'init-mac)
(require-win 'init-win)

(require 'init-symbols)
(require 'init-default)

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

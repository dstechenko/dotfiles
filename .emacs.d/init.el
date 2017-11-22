;;; init.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Emacs tweaks an hacks for personal usage.
;; Loads an internal/external profile and default configuration.
;;

;;; Code:


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path
             (expand-file-name "init" user-emacs-directory))

(require 'init-util)
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

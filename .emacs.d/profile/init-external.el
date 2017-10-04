;;; init-external.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Emacs external profile configuration.
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

(defvar url-proxy-services '(("no_proxy" . "^\\(localhost\\|10.*\\)")
                             ("http"     . ""                       )
                             ("https"    . ""                       )))

(require 'init-default)
(require 'init-python)
(require 'init-elisp)
(require 'init-markdown)
(require 'init-org)

(provide 'init-external)

;;; init-external.el ends here

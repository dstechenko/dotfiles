;;; init-internal.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Emacs internal profile configuration.
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

(use-package flyspell
  :diminish
  flyspell-mode)

(add-text-hook 'flyspell-mode)
(add-prog-hook 'flyspell-prog-mode)

(global-set-key (kbd "s-i") 'ispell-word)

(require 'init-python)
(require 'init-haskell)
(require 'init-idris)
(require 'init-scala)
(require 'init-elisp)
(require 'init-coq)
(require 'init-markdown)
(require 'init-org)

(provide 'init-internal)

;;; init-internal.el ends here

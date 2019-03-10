;;; init.el --- Emacs configuration

;; Copyright (C) 2019 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Emacs tweaks and hacks for personal usage.
;; Loads OS specific and default configuration.
;;

;;; Code:

(setq package-archives
      '(("gnu"          . "http://elpa.gnu.org/packages/")
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
(require 'init-default)

(require 'init-markdown)
(require 'init-org)

(require 'init-elisp)
(require 'init-scala)
(require 'init-python)
(require 'init-c)

(provide 'init)

;;; init.el ends here

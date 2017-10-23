;;; init.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Emacs tweaks an hacks for personal usage.
;; Loads an internal/external profile and default configuration.
;;

;;; Code:

(package-initialize)
(add-to-list 'load-path (expand-file-name "init"    user-emacs-directory))
(add-to-list 'load-path (expand-file-name "profile" user-emacs-directory))

(require 'init-util)
(require 'init-symbols)
(require 'init-internal)

(provide 'init)

;;; init.el ends here

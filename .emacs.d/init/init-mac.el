;;; init-mac.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Mac OS configuration and tweaks.
;;

;;; Code:

(setq user-emacs-directory (file-truename "~/.emacs.d/"))

(add-to-list 'exec-path "/usr/local/bin")

(setq
 shell-file-name "/bin/bash"
 shell-command-switch "-ic")

(setq
 mac-control-modifier       'control
 mac-command-modifier       'meta
 mac-right-command-modifier 'super
 mac-right-option-modifier  'hyper
 mac-option-modifier         nil)

(provide 'init-mac)

;;; init-mac.el ends here

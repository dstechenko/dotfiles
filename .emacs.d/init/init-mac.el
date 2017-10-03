;;; init-mac.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Mac OS X packages configuration and tweaks.
;;

;;; Code:

(add-to-list 'exec-path "/usr/local/bin")

(setq
 shell-file-name "/bin/bash"
 shell-command-switch "-ic")

(setq
 mac-control-modifier 'control
 mac-command-modifier 'meta
 mac-pass-command-to-system nil
 mac-pass-control-to-system nil
 mac-right-command-modifier 'super
 mac-right-option-modifier 'hyper
 mac-option-modifier nil)

(defvar mac-command-key-is-meta t)

(use-package exec-path-from-shell
  :init
  (exec-path-from-shell-initialize))

(provide 'init-mac)

;;; init-mac.el ends here

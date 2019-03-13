;;; init-mac.el --- Emacs configuration

;; Copyright (C) 2019 Dmytro Stechenko
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

(use-package exec-path-from-shell
  :init
  (exec-path-from-shell-initialize))

(provide 'init-mac)

;;; init-mac.el ends here

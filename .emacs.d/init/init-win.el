;;; init-win.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Windows packages configuration and tweaks.
;;

;;; Code:

(defvar win-bash-home            "C:/Program Files (x86)/Git/bin")
(defvar explicit-shell-file-name (expand-file-name "bash.exe" win-bash-home))
(defvar explicit-bash-args       '("--login" "-i"))
(defvar shell-file-name          explicit-shell-file-name)

(add-to-list 'exec-path win-bash-home)

(provide 'init-win)

;;; init-win.el ends here

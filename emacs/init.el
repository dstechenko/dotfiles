;;; init.el --- Default Emacs configuration

;; Copyright (C) Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Code:

(add-to-list
 'load-path
 (expand-file-name "init" user-emacs-directory))

(defvar config-project-mode "home")

(require 'init-shared)

;;; init.el ends here

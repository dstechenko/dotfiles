;;; init-util.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Utility functions and definitions.
;;

;;; Code:

;; Init package load

(defun expand-emacs (path)
  "Expands `PATH' with Emacs directory."
  (expand-file-name path user-emacs-directory))

(defun expand-tmp (path)
  "Expand `PATH' with Emacs tmp directory."
  (expand-emacs (format "tmp/%s" path)))

(provide 'init-util)

;;; init-util.el ends here

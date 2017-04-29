;;; init-util.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Utility functions and definitions.
;;

;;; Code:

(defun expand-emacs (path)
  "Expands `PATH' with Emacs directory."
  (expand-file-name path user-emacs-directory))

(defun expand-tmp (path)
  "Expand `PATH' with Emacs tmp directory."
  (expand-emacs (format "tmp/%s" path)))

(defmacro in-system (type &rest body)
  "If `system-type' is  `TYPE' then evaluate `BODY'."
  `(when (eq system-type ',type) ,@body))

(defmacro require-in-system (type file)
  "If `system-type' is `TYPE' then require `FILE'."
  `(in-system ,type (require ,file)))

(defmacro require-mac (file)
  "If `system-type' is Mac OS X then require `FILE'."
  `(require-in-system darwin ,file))

(defmacro require-win (file)
  "If `system-type' is Windows then require `FILE'."
  `(require-in-system windows-nt ,file))

(provide 'init-util)

;;; init-util.el ends here

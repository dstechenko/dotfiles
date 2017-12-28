;;; init-util.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Utility functions and definitions.
;;

;;; Code:

(defun in-system (type body)
  "If `system-type' is  `TYPE' then evaluate `BODY'."
  (when (eq system-type type) (eval body)))

(defun require-in-system (type file)
  "If `system-type' is `TYPE' then require `FILE'."
  (in-system type '(require file)))

(defun require-lin (file)
  "If `system-type' is GNU Linux then require `FILE'."
  (require-in-system 'gnu/linux file))

(defun require-mac (file)
  "If `system-type' is Mac OS X then require `FILE'."
  (require-in-system 'darwin file))

(defun require-win (file)
  "If `system-type' is Windows then require `FILE'."
  (require-in-system 'windows-nt file))

(defun expand-emacs (path)
  "Expands `PATH' with Emacs home directory."
  (expand-file-name path user-emacs-directory))

(defun expand-tmp (path)
  "Expand `PATH' with Emacs temporary directory."
  (expand-emacs (format "tmp/%s" path)))

(defun expand-lisp (path)
  "Expand `PATH' with Emacs LISP directory."
  (expand-emacs (format "lisp/%s" path)))

(defun expand-load (path)
  "Expand `load-path' list with `PATH'."
  (add-to-list 'load-path path))

(defun add-prog-hook (mode)
  "Add `prog-mode-hook' with `MODE'."
  (add-hook 'prog-mode-hook mode))

(defun add-text-hook (mode)
  "Add `text-mode-hook' with `MODE'."
  (add-hook 'text-mode-hook mode))

(defun add-window-hook (mode)
  "Add `window-setup-hook' with `MODE'."
  (add-hook 'window-setup-hook mode))

(defmacro load-fun (file fun)
  "Load `FILE' and a `FUN' from it."
  `(progn
     (require  ,file)
     (autoload ,fun (symbol-name ,file) nil t)))

(defun ensure-dir-exists (directory)
  "Create `DIRECTORY' if does not exist."
  (when (not (file-exists-p directory)) (make-directory directory t)))

(defun ensure-file-exists (file)
  "Create `FILE' if does not exist."
  (when (not (file-exists-p file)) (with-temp-buffer (write-file file))))

(provide 'init-util)

;;; init-util.el ends here

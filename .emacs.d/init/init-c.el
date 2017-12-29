;;; init-c.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; C packages configuration and tweaks.
;;

;;; Code:

(require 'semantic)
(require 'semantic/bovine/gcc)

(defun c-mode-tweaks ()
  "Add all C mode tweaks in the right order."
  (show-paren-mode)
  (smartparens-mode)
  (yas-minor-mode)
  (company-mode))

(add-hook 'c-mode-hook 'c-mode-tweaks)

(provide 'init-c)

;;; init-c.el ends here

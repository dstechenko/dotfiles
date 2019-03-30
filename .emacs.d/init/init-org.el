;;; init-org.el --- Emacs configuration

;; Copyright (C) 2019 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Org packages configuration and tweaks.
;;

;;; Code:

(use-package org
  :commands
  org-mode

  :mode
  (("\\.org\\'"     . org-mode)
   ("\\.org.txt\\'" . org-mode)))

(provide 'init-org)

;;; init-org.el ends here

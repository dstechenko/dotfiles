;;; init-haskell.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Haskell packages configuration and tweaks.
;;

;;; Code:

(use-package haskell-mode)

(use-package hindent
  :diminish
  hindent-mode)

(defun haskell-mode-tweaks ()
  "Add all Haskell mode tweaks in the right order."
  (hindent-mode))

(add-hook 'haskell-mode-hook 'haskell-mode-tweaks)

(provide 'init-haskell)

;;; init-haskell.el ends here

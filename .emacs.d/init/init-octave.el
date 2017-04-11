;;; init-octave.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Octave packages configuration and tweaks.
;;

;;; Code:

(require 'octave)

(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))
(add-to-list 'auto-mode-alist '("\\.oct$" . octave-mode))

(setq inferior-octave-startup-args '("-i"))

(defun octave-mode-tweaks ()
  "Add all Octave mode tweaks in the right order."
  (auto-fill-mode 1)
  (font-lock-mode 1))

(add-hook 'octave-mode-hook 'octave-mode-tweaks)

(provide 'init-octave)

;;; init-octave.el ends here

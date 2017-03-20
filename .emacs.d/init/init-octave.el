;;; init-octave.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Octave packages configuration and tweaks.
;; Includes the following:
;; - octave-mode
;;

;;; Code:

(require 'octave)

;; Set mode files
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))
(add-to-list 'auto-mode-alist '("\\.oct$" . octave-mode))

;; Set octave inferior interactive mode
(setq inferior-octave-startup-args '("-i"))

;; Set mode hook
(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x) (font-lock-mode 1))))

;; Init package
(provide 'init-octave)

;;; init-octave.el ends here

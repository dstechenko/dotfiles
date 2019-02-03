;;; init-constant.el --- Emacs configuration

;; Copyright (C) 2019 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Constant configuration and tweaks.
;;

;;; Code:

(require 'init-util)

(setq user-full-name "Dmytro Stechenko")

(ensure-dir-exists (expand-tmp ""))

(setq custom-file (expand-tmp "custom.el"))
(load custom-file t)

(setq
 debug-on-error nil
 debug-on-quit  nil)

(set-frame-font "PragmataPro")
(fset 'yes-or-no-p 'y-or-n-p)

(line-number-mode        1)
(column-number-mode      1)
(show-paren-mode         1)
(global-visual-line-mode 1)
(scroll-bar-mode        -1)
(menu-bar-mode          -1)
(tool-bar-mode          -1)
(mouse-wheel-mode       -1)
(electric-indent-mode   -1)
(blink-cursor-mode      -1)

(defvar tags-revert-without-query t)

(setq
 vc-follow-symlinks         t
 inhibit-startup-screen     t
 scroll-error-top-bottom    t
 tags-add-tables            nil
 initial-scratch-message    nil
 create-lockfiles           nil
 make-backup-files          nil
 tooltip-mode               nil
 show-help-function         nil
 sentence-end-double-space  nil
 ring-bell-function        'ignore)

(setq-default
 fill-column                    80
 tab-width                      4
 c-basic-offset                 4
 indent-tabs-mode               nil
 cursor-in-non-selected-windows nil)

(provide 'init-constant)

;;; init-constant.el ends here

;;; init.el --- Emacs configuration

;; Copyright (C) 2016 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Emacs tweaks an hacks for personal usage.
;;
;; Includes support of the following:
;; - Emacs Lisp
;; - Scala
;; - Python
;; - Markdown
;;
;; Configuration is broken down into sections.
;; Sections outline common modes, hacks or tweaks.

;;; Code:

;; Load init configuration
(package-initialize)

(add-to-list 'load-path
             (expand-file-name "init" user-emacs-directory))

(add-to-list 'load-path
             (expand-file-name "themes" user-emacs-directory))

;; Init bootstrap
(require 'init-common)
(require 'init-elisp)
(require 'init-scala)
(require 'init-python)
(require 'init-markdown)

;; Init package
(provide 'init)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d9aa9a847dd90dd32164a2377c788a5cbd7b44d096c67ee194c78291fec8c722" default)))
 '(package-selected-packages
   (quote
    (leuven-theme zenburn-theme whitespace-cleanup-mode use-package undo-tree sunrise-x-buttons solarized-theme smartparens smart-mode-line-powerline-theme rainbow-delimiters py-autopep8 projectile popup-imenu neotree multiple-cursors move-dup markdown-mode magit highlight-symbol goto-chg git-timemachine git-gutter flycheck expand-region ensime elpy color-theme auto-compile aggressive-indent))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

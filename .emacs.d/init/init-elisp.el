;;; init-elisp.el --- Emacs configuration

;; Copyright (C) 2020 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Emacs Lisp packages configuration and tweaks.
;;

;;; Code:

(use-package auto-compile
  :init
  (auto-compile-on-load-mode 1)
  (auto-compile-on-save-mode 1))

(use-package eldoc
  :commands
  eldoc-mode)

(use-package emacs
  :bind
  (:map emacs-lisp-mode-map
        ("RET" . comment-indent-new-line))

  :hook
  (emacs-lisp-mode
   . (lambda ()
       (setq-default flycheck-emacs-lisp-load-path 'inherit)
       (setq         show-trailing-whitespace             t)
       (eldoc-mode)
       (flycheck-mode)
       (yas-minor-mode)
       (company-mode)
       (show-paren-mode)
       (smartparens-strict-mode))))

(provide 'init-elisp)

;;; init-elisp.el ends here

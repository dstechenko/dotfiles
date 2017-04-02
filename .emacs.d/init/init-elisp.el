;;; init-elisp.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Emacs Lisp packages configuration and tweaks.
;;
;; Includes the following:
;; - auto-compile
;; - eldoc
;; - flycheck
;; - rainbow-delimiters
;;

;;; Code:

(use-package auto-compile
  :init
  (auto-compile-on-load-mode 1)
  (auto-compile-on-save-mode 1))

(use-package eldoc
  :diminish
  eldoc-mode

  :commands
  eldoc-mode)

(use-package flycheck
  :diminish
  flycheck-mode

  :config
  (setq-default flycheck-emacs-lisp-load-path 'inherit))

(use-package rainbow-delimiters)

(use-package aggressive-indent
  :diminish
  aggressive-indent-mode)

;; Set bindings
(defun emacs-lisp-mode-bindings ()
  "Bind all Emacs Lisp custom keys."
  (bind-key "RET" 'comment-indent-new-line emacs-lisp-mode-map))

;; Set hooks
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (setq show-trailing-whitespace t)
            (emacs-lisp-mode-bindings)
            (aggressive-indent-mode 1)
            (rainbow-delimiters-mode)
            (prettify-symbols-mode)
            (eldoc-mode)
            (flycheck-mode)
            (yas-minor-mode)
            (company-mode)
            (show-paren-mode)
            (smartparens-strict-mode)))

;; Init package
(provide 'init-elisp)

;;; init-elisp.el ends here

;;; init-elisp.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
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
  :diminish
  eldoc-mode "ed"

  :commands
  eldoc-mode)

(use-package flycheck
  :diminish
  flycheck-mode "fc"

  :config
  (setq-default flycheck-emacs-lisp-load-path 'inherit))

(use-package rainbow-delimiters
  :diminish
  rainbow-delimiters-mode "rd")

(use-package aggressive-indent
  :diminish
  aggressive-indent-mode "ai")

(defun emacs-lisp-mode-bindings ()
  "Bind all Emacs Lisp custom keys."
  (bind-key "RET" 'comment-indent-new-line emacs-lisp-mode-map))

(defun emacs-lisp-mode-configuration ()
  "Configure all Emacs Lisp properties."
  (setq show-trailing-whitespace t))

(defun emacs-lisp-mode-tweaks ()
  "Add all Emacs Lisp mode tweaks in the right order."
  (emacs-lisp-mode-bindings)
  (emacs-lisp-mode-configuration)
  (aggressive-indent-mode 1)
  (rainbow-delimiters-mode)
  (eldoc-mode)
  (flycheck-mode)
  (yas-minor-mode)
  (company-mode)
  (show-paren-mode)
  (smartparens-strict-mode))

(add-hook 'emacs-lisp-mode-hook 'emacs-lisp-mode-tweaks)

(provide 'init-elisp)

;;; init-elisp.el ends here

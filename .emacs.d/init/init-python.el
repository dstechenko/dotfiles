;;; init-python.el --- Emacs configuration

;; Copyright (C) 2017 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Python packages configuration and tweaks.
;;

;;; Code:

(use-package elpy
  :commands
  elpy-enable
  elpy-use-cpython

  :init
  (elpy-enable)

  :config
  (elpy-use-cpython "python3")
  (setq
   elpy-modules (delete 'elpy-module-flymake elpy-modules)
   elpy-rpc-python-command "python3"))

(use-package py-autopep8
  :commands
  py-autopep8-enable-on-save)

;; Add hooks
(add-hook 'elpy-mode-hook
          (lambda ()
            (flycheck-mode)
            (py-autopep8-enable-on-save)))

;; Init package
(provide 'init-python)

;;; init-python.el ends here

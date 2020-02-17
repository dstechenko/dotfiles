;;; init-python.el --- Emacs configuration

;; Copyright (C) 2020 Dmytro Stechenko
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;; Python packages configuration and tweaks.
;;

;;; Code:

(use-package elpy
  :commands
  elpy-enable

  :init
  (elpy-enable)

  :hook
  (elpy-mode
   . (lambda ()
       (flycheck-mode)
       (py-autopep8-enable-on-save)))

  :config
  (setq
   elpy-rpc-timeout        nil
   elpy-rpc-python-command "python3"
   elpy-modules            (delete 'elpy-module-flymake elpy-modules)))

(use-package py-autopep8
  :commands
  py-autopep8-enable-on-save)

(provide 'init-python)

;;; init-python.el ends here

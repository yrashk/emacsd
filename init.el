;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;; Theme
(add-to-list 'load-path "~/.emacs.d/color-theme")
(require 'color-theme)
(color-theme-initialize)
(color-theme-arjen)

;; Editor
(setq-default tab-width 4)


;; Coffee-mode
(add-to-list 'load-path "~/.emacs.d/coffee-mode")
(require 'coffee-mode)

(defun coffee-custom ()
  "coffee-mode-hook"

  ;; CoffeeScript uses two spaces.
  (set (make-local-variable 'tab-width) 2)

  ;; If you don't want your compiled files to be wrapped
  (setq coffee-args-compile '("-c" "--no-wrap"))

  ;; *Messages* spam
  (setq coffee-debug-mode t))


(add-hook 'coffee-mode-hook '(lambda () (coffee-custom)))

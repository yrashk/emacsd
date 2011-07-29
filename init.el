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
(add-to-list 'load-path "~/.emacs.d/emacs-color-theme-solarized")
(require 'color-theme-solarized)
(require 'color-theme)
(color-theme-initialize)
(color-theme-solarized-dark)

;; Editor
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq backup-inhibited t)
(normal-erase-is-backspace-mode 1)
(delete-selection-mode t)
(setq visible-bell 'top-bottom)
(put 'narrow-to-region 'disabled nil)


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

;; Erlang
(setq load-path (cons  "/usr/local/lib/erlang/lib/tools-2.6.6.1/emacs"  load-path))
(setq load-path (cons  "/usr/local/lib/erlang/lib/tools-2.6.6.2/emacs" load-path))
(setq load-path (cons  "/usr/local/lib/erlang/lib/tools-2.6.6.3/emacs" load-path))
(setq load-path (cons  "/usr/local/lib/erlang/lib/tools-2.6.6.4/emacs" load-path))
(setq erlang-root-dir "/usr/local/lib/erlang")
(setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path))
(require 'erlang-start)

;; Keys

;;; Version management
(global-set-key (kbd "C-x C-g") 'magit-status)

;;; Editor
(global-set-key (kbd "M-DEL") 'backward-kill-word)

;; Git

(setq magit-git-executable "/usr/local/bin/git")

(add-to-list 'load-path "~/.emacs.d")

;; Markdown
(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\\.text" "\\.md" . markdown-mode) auto-mode-alist))
;; Fonts

(set-face-attribute 'default nil :font "Anonymous Pro" :height 140)

;; Terminal
(require 'multi-term)
(setq multi-term-program "/bin/zsh")

;; YANG
(require 'yang-mode)
(autoload 'yang-mode "yang-mode" "Major mode for editing YANG modules." t)
(add-to-list 'auto-mode-alist '("\\.yang$" . yang-mode))


;; LFE
(add-to-list 'load-path "~/.emacs.d/lfe")
(require 'lfe-mode)
(require 'lfe-start)

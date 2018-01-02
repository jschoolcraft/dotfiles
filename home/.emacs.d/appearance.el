;;; package --- appearance customizations

;;; Commentary:

;;; Code:

(use-package color-theme
  :ensure t)

(use-package base16-theme
  :ensure t)

(use-package moe-theme
  :ensure t)

(use-package alect-themes
  :ensure t)

(use-package molokai-theme
  :ensure t)

(use-package apropospriate-theme
  :ensure t)

(use-package color-theme-sanityinc-solarized
  :ensure t)

;; (moe-dark)
;; (use-package powerline
;;   :ensure t
;;   :config
;;   (powerline-moe-theme))

(load-theme 'base16-irblack)

(set-face-attribute 'default nil :font "Monaco 18")

(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t
      initial-scratch-message ""
      visible-bell t)

;; no bars, no gui menus
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; replace yes/no questions with y/n
(fset 'yes-or-no-p 'y-or-n-p)
;; show the empty lines at the end (bottom) of the buffer
(toggle-indicate-empty-lines)
;; delete the previous selection when overrides it with a new insertion.
(delete-selection-mode)
;; the blinking cursor is pretty annoying, so disable it.
(blink-cursor-mode -1)
;; more thinner window divisions
(fringe-mode '(1 . 1))

;; show matching parenthesis
(setq show-paren-delay 0)
(show-paren-mode t)

(global-visual-line-mode nil)
(setq-default indent-tabs-mode nil)
(eval-after-load "vc" '(setq vc-handled-backends nil))
(setq vc-follow-symlinks t
      large-file-warning-threshold nil
      split-width-threshold nil)

;; display line numbers
(global-linum-mode 1)
;; highlight the current line
(global-hl-line-mode 1)

;; settings for the mode line
(column-number-mode t)
(setq size-indication-mode t)
(which-function-mode 1)
(line-number-mode 1)

(use-package linum-relative
  :ensure t)
(linum-relative-on)


;;; appearance.el ends here

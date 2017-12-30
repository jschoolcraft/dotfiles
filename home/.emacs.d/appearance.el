;;; package --- appearance customizations

;;; Commentary:

;;; Code:

(load-theme 'molokai)
;(load-theme 'apropospriate-dark t)
(set-face-attribute 'default nil :font "Monaco 18")

(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t
      initial-scratch-message "")

(menu-bar-mode -1)
(tool-bar-mode -1)
;(scroll-bar-mode -1)

(show-paren-mode 1)
;(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
(global-visual-line-mode nil)
;(setq-default left-fringe-width nil)
(setq-default indent-tabs-mode nil)
(eval-after-load "vc" '(setq vc-handled-backends nil))
(setq vc-follow-symlinks t
      large-file-warning-threshold nil
      split-width-threshold nil
      visible-bell t)

(global-linum-mode 1)  ; display line numbers
(line-number-mode 1)
(column-number-mode 1) ; display column/row of cursor in mode-line
(global-hl-line-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)


;;; appearance.el ends here

; Use solarized dark (in GUI)
(when (display-graphic-p) (load-theme 'solarized-dark t))

; Use Source Code Pro 14pt in GUI
(when (display-graphic-p) (set-face-attribute 'default nil :font "Source Code Pro for Powerline-14"))

(setq inhibit-splash-screen t
            inhibit-startup-message t
                  inhibit-startup-echo-area-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(when (boundp 'scroll-bar-mode)
    (scroll-bar-mode -1))
(show-paren-mode 1)
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
(global-visual-line-mode nil)
(setq-default left-fringe-width nil)
(setq-default indent-tabs-mode nil)
(eval-after-load "vc" '(setq vc-handled-backends nil))
(setq vc-follow-symlinks t)
(setq large-file-warning-threshold nil)
(setq split-width-threshold nil)
(setq visible-bell t)

; (global-linum-mode 1) ; display line numbers
; (column-number-mode 1) ; display column/row of cursor in mode-line

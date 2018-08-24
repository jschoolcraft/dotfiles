;;; package --- evil configuration
;;; Commentary:

;;; Code:
(require 'use-package)

;; the basics
(use-package evil
  :defer nil
  :init
  (setq evil-want-integration nil)
  :config
  (evil-mode 1))

;; loads of stuff
;; https://github.com/emacs-evil/evil-collection
(use-package evil-collection
  :after evil
  :custom (evil-collection-setup-minibuffer t)
  :config
  (evil-collection-init))

;; magit
;; https://github.com/emacs-evil/evil-magit
(use-package evil-magit
  :after evil)

;; https://github.com/cofi/evil-leader
;; alternative using hydra: https://github.com/noctuid/evil-guide/wiki#using-hydra-for-leader-key
(use-package evil-leader
  :defer nil
  :config
  (global-evil-leader-mode))

;; https://github.com/linktohack/evil-commentary
(use-package evil-commentary
  :config
  (evil-commentary-mode))

;; https://github.com/emacs-evil/evil-surround
(use-package evil-surround
  :config
  (global-evil-surround-mode 1))

;; (use-package evil-visualstar
;;   :ensure t
;;   (global-evil-visualstar-mode 1))

;; https://github.com/cofi/evil-indent-textobject
(use-package evil-indent-textobject)

;; https://github.com/redguardtoo/evil-matchit
(use-package evil-matchit)

(global-set-key [escape] 'evil-exit-emacs-state)

; Set cursor colors depending on mode
(when (display-graphic-p)
  (setq evil-emacs-state-cursor '("red" box)
        evil-normal-state-cursor '("green" box)
        evil-visual-state-cursor '("orange" box)
        evil-insert-state-cursor '("red" bar)
        evil-replace-state-cursor '("red" bar)
        evil-operator-state-cursor '("red" hollow)))

(progn
  (setq evil-default-state 'normal
        evil-auto-indent t
        evil-shift-width 2
        evil-search-wrap t
        evil-find-skip-newlines t
        evil-move-cursor-back nil
        evil-mode-line-format 'before
        evil-esc-delay 0.001
        evil-cross-lines t))

(setq evil-overriding-maps nil)
(setq evil-intercept-maps nil)

;; swap 0 and ^ so 0 goes back to first non-whitespace character
;(define-key evil-motion-state-map (kbd "0") 'evil-first-non-blank)
;(define-key evil-motion-state-map (kbd "^") 'evil-beginning-of-line)

(evil-leader/set-leader ";")
(evil-leader/set-key
  "." 'find-tag
  "t" 'helm-find-files
  "f" 'helm-find-files
  "b" 'helm-mini
  "e" 'flycheck-list-errors
  "ag" 'projectile-ag
  "vs" 'split-window-right
  "hs" 'split-window-below
  "mx" 'helm-M-x
  "p" 'helm-show-kill-ring
  "oc" 'org-capture
  "q" 'evil-quit
  "g" 'magit
  "l" 'org-mac-grab-link
  )

(defun fix-underscore-word ()
  (modify-syntax-entry ?_ "w"))

;; Make ";" behave like ":" in normal mode
;; (define-key evil-normal-state-map (kbd ";") 'evil-ex)
;; (define-key evil-visual-state-map (kbd ";") 'evil-ex)
;; (define-key evil-motion-state-map (kbd ";") 'evil-ex)

;; moving around windows
(eval-after-load "evil"
  '(progn
     (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
     (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
     (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
     (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)))



(provide 'evil)
;;; evil.el ends here

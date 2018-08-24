;;; package --- evil configuration
;;; Commentary:

;;; Code:
(require 'use-package)

(use-package evil
  :diminish undo-tree-mode
  :init
  (setq evil-want-integration nil)
  :config
  (evil-mode 1))

(use-package evil-leader

(use-package evil-nerd-commenter
  :ensure t)

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

;; (use-package evil-visualstar
;;   :ensure t
;;   (global-evil-visualstar-mode 1))

(use-package evil-indent-textobject
  :ensure t)

(use-package evil-matchit
  :ensure t)

;; provides a ton of evil keybindings
(use-package evil-collection
  :ensure t
  ;;:custom (evil-collection-setup-minibuffer t)
  :init (evil-collection-init))

(use-package evil-org
  :ensure t
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme))))

(evil-mode)

;; I think evil-collection should fix this, we'll see.
;; (defun minibuffer-keyboard-quit ()
;;   "Abort recursive edit.
;;   In Delete Selection mode, if the mark is active, just deactivate it;
;;   then it takes a second \\[keyboard-quit] to abort the minibuffer."
;;   (interactive)
;;   (if (and delete-selection-mode transient-mark-mode mark-active)
;;     (setq deactivate-mark  t)
;;     (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
;;     (abort-recursive-edit)))

;; (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;; (define-key evil-normal-state-map [escape] 'keyboard-quit)
;; (define-key evil-visual-state-map [escape] 'keyboard-quit)
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

;; Don't wait for any other keys after escape is pressed.
;; handled above?
;; (setq evil-esc-delay 0)

(global-evil-leader-mode)
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

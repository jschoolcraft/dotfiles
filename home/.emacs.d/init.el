;;; config --- my configuration
;;; Commentary:

;(require 'cl)
(require 'package)

; places to look for config options
; https://github.com/aaronbieber/dotfiles/tree/master/configs/emacs.d
; https://github.com/chrismccord/dot_emacs
; https://github.com/syl20bnr/evil-tutor
; http://doc.rix.si/projects/fsem.html
; https://github.com/joedicastro/dotfiles/tree/master/emacs
; https://github.com/howardabrams/dot-files/blob/master/emacs.org

;;; Code:
(add-to-list 'package-archives '("mela-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

(setq use-package-always-pin "melpa")

(package-initialize)
(package-refresh-contents)

; Let's use use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(provide 'setup-package)

;; Some Emacs Lisp enhancements that I'll probably never use
;; stolen from: https://github.com/howardabrams/dot-files/blob/master/emacs.org#init-file-support
(require 'cl)

(use-package dash
  :ensure t
  :config (eval-after-load "dash" '(dash-enable-font-lock)))

(use-package s
  :ensure t)

(use-package f
  :ensure t)

;; UTF-8
(set-terminal-coding-system  'utf-8)
(set-keyboard-coding-system  'utf-8)
(set-language-environment    'utf-8)
(set-selection-coding-system 'utf-8)
(setq locale-coding-system   'utf-8)
(prefer-coding-system        'utf-8)
(setq-default buffer-file-coding-system 'utf-8-auto-unix)
(set-input-method nil)

(setq echo-keystrokes 0.25) ;display unfinished keystroke more quickly (defaults 1 second)

;;  big fast machines now
(setq gc-cons-threshold 50000000)
(setq gnutls-min-prime-bits 4096)

(defvar my-packages '(
                      alchemist
                      autopair
                      deft
                      diminish
                      elixir-mode
                      evil
                      evil-leader
                      evil-nerd-commenter
                      evil-surround
                      evil-visualstar
                      flx-ido
                      golden-ratio
                      haml-mode
                      helm
                      helm-ag
                      helm-projectile
                      jsx-mode
                      key-chord
                      magit
                      markdown-mode
                      org-bullets
                      pbcopy
                      powerline
                      projectile
                      rbenv
                      saveplace
                      smartparens
                      smex
                      smooth-scrolling
                      web-mode
                      ;writeroom-mode
                      yaml-mode
                      ; themes
                      apropospriate-theme
                      color-theme-sanityinc-solarized
                      molokai-theme
                      ))

(dolist (p my-packages)
    (when (not (package-installed-p p))
          (package-install p)))

(use-package diminish
  :ensure t
  :demand t
  :diminish (visual-line-mode . "ω")
  :diminish hs-minor-mode
  :diminish abbrev-mode
  :diminish auto-fill-function
  :diminish subword-mode)

(use-package ag
  :ensure    t
  :commands  ag
  :init      (setq ag-highlight-search t)
  :config    (add-to-list 'ag-arguments "--word-regexp"))

(use-package company
  :ensure t
  :init
  (setq company-dabbrev-ignore-case t
        company-show-numbers t)
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (add-to-list 'company-backends 'company-math-symbols-unicode)
  :diminish company-mode)

(require 'evil)
(evil-mode t)

(require 'projectile)
(projectile-mode t)

(require 'autopair)

;; better sized splits
(require 'golden-ratio)
(golden-ratio-mode 1)

;; use helm
(require 'helm)
(require 'helm-projectile)

(setq helm-M-x-fuzzy-match                  t
      helm-bookmark-show-location           t
      helm-buffers-fuzzy-matching           t
      helm-completion-in-region-fuzzy-match t
      helm-file-cache-fuzzy-match           t
      helm-imenu-fuzzy-match                t
      helm-mode-fuzzy-match                 t
      helm-locate-fuzzy-match               t
      helm-quick-update                     t
      helm-recentf-fuzzy-match              t
      helm-semantic-fuzzy-match             t)
(helm-mode 1)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(setq helm-ag-base-command "ag --hidden --nocolor --nogroup --ignore-case")
(helm-projectile-on)
(setq projectile-sort-order (quote recently-active))

;; flycheck
(use-package flycheck
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-flycheck-mode)
  :config
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  (setq flycheck-highlighting-mode 'lines))

;; yasnippet
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1)
  :config
  (add-to-list 'yas-snippet-dirs "~/.emacs-snippets"))

;; git related stuffs
(use-package git-gutter-fringe
   :ensure t
   :diminish git-gutter-mode
   :init (setq git-gutter-fr:side 'right-fringe)
   :config (global-git-gutter-mode t))

(use-package gitconfig-mode
  :ensure t)

(use-package gitignore-mode
  :ensure t)

;need to figure out where this goes with use-package variant
;(setq yas-indent-line nil)

(use-package markdown-mode
  :ensure t
  :mode ("\\.\\(m\\(ark\\)?down\\|md\\)$" . markdown-mode))

(use-package ruby-mode
  :ensure t
  :mode "\\.rb\\'"
  :mode "Rakefile\\'"
  :mode "Gemfile\\'"
  :mode "Berksfile\\'"
  :mode "Vagrantfile\\'"
  :interpreter "ruby"

  :init
  (setq ruby-indent-level 2
        ruby-indent-tabs-mode nil)
  (add-hook 'ruby-mode 'superword-mode))

(use-package web-mode
  :ensure t
  :mode "\\.erb\\'")

(custom-set-faces
 '(flycheck-error ((((class color)) (:underline "Red"))))
 '(flycheck-warning ((((class color)) (:underline "Orange")))))

;; deft
(require 'deft)
(setq deft-extensions '("txt" "tex" "org"))
(setq deft-directory "~/Dropbox/jschoolcraft/notes")
(setq deft-use-filename-as-title 1)

;; web mode stuff
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(add-to-list 'load-path (expand-file-name "lib" user-emacs-directory))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(defconst user-init-dir
          (cond ((boundp 'user-emacs-directory)
                 user-emacs-directory)
                ((boundp 'user-init-directory)
                 user-init-directory)
                (t "~/.emacs.d/")))


(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

;; system clipboard
(setq select-enable-clipboard t)

; Load configuration modules
(load-user-file "evil.el")
(load-user-file "orgmode.el")
(load-user-file "appearance.el")

; Kill backups
(setq make-backup-files nil)
(setq auto-save-default nil)

; Hate whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (color-theme-sanityinc-solarized yasnippet yaml-mode web-mode smooth-scrolling smex smartparens powerline pbcopy markdown-mode magit key-chord jsx-mode helm-projectile helm-ag helm flx-ido evil-visualstar evil-surround evil-nerd-commenter evil-leader evil ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)
;;; init.el ends here

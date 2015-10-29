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

;;; Code:

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))

; ("melpa-stable" . "http://stable.melpa.org/packages/")

(package-initialize)

; (setq package-pinned-packages '((gtags . "marmalade")
;                                 (php-extras . "marmalade")
;                                 (magit . "melpa-stable")))

(package-refresh-contents)

(defvar my-packages '(
                      ag
                      ;alchemist
                      ;browse-at-remote
                      ;coffee-mode
                      company
                      ;elixir-mode
                      enh-ruby-mode
                      evil
                      evil-leader
                      evil-nerd-commenter
                      evil-surround
                      evil-visualstar
                      flx-ido
                      flycheck
                      helm
                      helm-ag
                      helm-projectile
                      jsx-mode
                      key-chord
                      magit
                      markdown-mode
                      ;neotree
                      pbcopy
                      powerline
                      projectile
                      rbenv
                      ;ruby-mode
                      saveplace
                      smartparens
                      smex
                      smooth-scrolling
                      web-mode
                      ;writeroom-mode
                      yaml-mode
                      yasnippet
                      ; themes
                      apropospriate-theme
                      color-theme-sanityinc-solarized
                      molokai-theme
                      ))

(dolist (p my-packages)
    (when (not (package-installed-p p))
          (package-install p)))

(require 'evil)
(evil-mode t)

(require 'projectile)
(projectile-mode t)

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

(setq projectile-sort-order (quote recently-active))

(add-hook 'after-init-hook 'global-flycheck-mode)
(add-hook 'after-init-hook 'global-company-mode)

;; make startup nicer

;; yasnippet
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs-snippets"            ;; personal snippets
        ))
;(yas-load-directory "~/.emacs-snippets")
(setq yas-indent-line nil)
(yas-global-mode 1)

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

; Load configuration modules
(load-user-file "evil.el")
(load-user-file "appearance.el")

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

;(require 'cl)
(require 'package)
                                        ; places to look for config options
                                        ; https://github.com/aaronbieber/dotfiles/tree/master/configs/emacs.d
                                        ; https://github.com/chrismccord/dot_emacs
                                        ; https://github.com/syl20bnr/evil-tutor
                                        ; http://doc.rix.si/projects/fsem.html
                                        ; https://github.com/joedicastro/dotfiles/tree/master/emacs

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))
(package-initialize)

(setq package-pinned-packages '((gtags . "marmalade")
                                (php-extras . "marmalade")
                                (magit . "melpa-stable")))

(when (not package-archive-contents)
    (package-refresh-contents))

(defvar my-packages '(
                      ag
                      ;alchemist
                      ;browse-at-remote
                      ;coffee-mode
                      ;company
                      ;elixir-mode
                      evil
                      evil-leader
                      evil-nerd-commenter
                      evil-surround
                      evil-visualstar
                      flx-ido
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
                      ruby-mode
                      saveplace
                      smartparens
                      smex
                      smooth-scrolling
                      web-mode
                      ;writeroom-mode
                      yaml-mode
                      yasnippet
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
(setq helm-buffers-fuzzy-matching t)
(helm-mode 1)

(setq projectile-sort-order (quote recently-active))

(add-to-list 'load-path (expand-file-name "lib" user-emacs-directory))
(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))

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
    (helm-ag yasnippet yaml-mode web-mode smooth-scrolling smex smartparens powerline pbcopy markdown-mode magit key-chord jsx-mode helm-projectile flx-ido evil-visualstar evil-surround evil-nerd-commenter evil-leader company ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

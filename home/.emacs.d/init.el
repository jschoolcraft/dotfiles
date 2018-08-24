;;; config --- my configuration
;;; Commentary:

;(require 'cl)
(require 'package)

;; places to look for config options
;; https://github.com/joedicastro/dotfiles/tree/master/emacs
;; https://github.com/howardabrams/dot-files/blob/master/emacs.org
;; https://github.com/joedicastro/dotfiles/tree/master/emacs/.emacs.d

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;;; Code:
;; use package for most of our packages
(add-to-list 'package-archives '("mela-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(when (not (package-installed-p 'use-package))
  (package-install 'use-package))

(require 'use-package)

;;(setq use-package-always-pin "melpa")
(customize-set-variable 'use-package-always-ensure t)
(customize-set-variable 'use-package-always-defer t)

(customize-set-variable 'load-prefer-newer t)
(use-package auto-compile
  :defer nil
  :config (auto-compile-on-load-mode))

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
  :commands  (ag ag-project)
  :init      (setq ag-highlight-search t)
  :config
  (add-to-list 'ag-arguments "--word-regexp")
  ;; (setq ag-executable "/usr/local/bin/ag")
  (setq ag-highlight-search t)
  (setq ag-reuse-buffers t)
  (setq ag-reuse-window t))

(use-package company
  :ensure t
  :init
  (setq company-dabbrev-ignore-case t
        company-show-numbers t)
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (add-to-list 'company-backends 'company-math-symbols-unicode)
  :diminish company-mode)

(use-package projectile
  :defer 2
  :config
  (projectile-mode)
  (setq projectile-enable-caching t)
  (setq projectile-completion-system 'helm)
  (setq projectile-sort-order (quote recently-active))
  (setq projectile-mode-line
        '(:eval
          (format " Proj[%s]"
                  (projectile-project-name)))))

(use-package highlight-symbol
  :diminish ""
  :config
  (setq-default highlight-symbol-idle-delay 1.5))

(use-package helm
  :ensure t
  :diminish helm-mode
  :commands helm-mode
  :config
  (helm-mode 1)
  (setq helm-buffers-fuzzy-matching t
        helm-autoresize-mode t
        helm-M-x-fuzzy-match                  t
        helm-bookmark-show-location           t
        helm-buffers-fuzzy-matching           t
        helm-completion-in-region-fuzzy-match t
        helm-file-cache-fuzzy-match           t
        helm-imenu-fuzzy-match                t
        helm-mode-fuzzy-match                 t
        helm-locate-fuzzy-match               t
        helm-quick-update                     t
        helm-recentf-fuzzy-match              t
        helm-semantic-fuzzy-match             t))

(use-package helm-projectile
  :ensure t
  :commands (helm-projectile helm-projectile-switch-project))

(use-package helm-ag
  :ensure t)

(setq helm-ag-base-command "ag --hidden --nocolor --nogroup --ignore-case")
(helm-projectile-on)

;; flycheck
(use-package flycheck
  :init
  (add-hook 'after-init-hook 'global-flycheck-mode)
  :config
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  (setq flycheck-highlighting-mode 'lines))

(custom-set-faces
 '(flycheck-error ((((class color)) (:underline "Red"))))
 '(flycheck-warning ((((class color)) (:underline "Orange")))))

(use-package yasnippet
  :ensure t
  :defer t
  :init
  (yas-global-mode 1)
  :config
  (yas-reload-all)
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"
                           "~/.emacs.d/remote-snippets"))
  (setq yas-indent-line nil)
  (setq tab-always-indent 'complete)
  (setq yas-prompt-functions '(yas-completing-prompt
                               yas-ido-prompt
                               yas-dropdown-prompt))
  (define-key yas-minor-mode-map (kbd "<escape>") 'yas-exit-snippet))

;; git related stuffs
(use-package magit
  :ensure t
  :defer t
  :config
  (setq magit-branch-arguments nil)
  (setq magit-push-always-verify nil)
  (setq magit-last-seen-setup-instructions "1.4.0")
  (magit-define-popup-switch 'magit-log-popup ?f "first parent" "--first-parent"))

(use-package git-gutter-fringe
  :ensure t
  :defer t
  :diminish (git-gutter-mode . "")
  :init
  (global-git-gutter-mode +1)
  (setq-default indicate-buffer-boundaries 'left)
  (setq-default indicate-empty-lines +1))

(use-package gitconfig-mode
  :ensure t
  :defer t)

(use-package gitignore-mode
  :ensure t
  :defer t)

(use-package gitattributes-mode
  :ensure t
  :defer t)

(use-package which-key
  :config
  (which-key-mode t))

(use-package restclient)

(use-package markdown-mode

(use-package yaml-mode)
(use-package haml-mode)

(use-package ruby-mode
  :mode "\\.rb\\'"
  :mode "Rakefile\\'"
  :mode "Fastfile\\'"
  :mode "Matchfile\\'"
  :mode "Gemfile\\'"
  :mode "Berksfile\\'"
  :mode "Vagrantfile\\'"
  :interpreter "ruby"

  :init
  (setq ruby-indent-level 2
        ruby-indent-tabs-mode nil)
  (add-hook 'ruby-mode 'superword-mode))

(use-package web-mode


;; helps find the source of an error
(use-package bug-hunter
  :commands (bug-hunter-file bug-hunter-init-file))

;; deft
(use-package deft
  :commands (deft)
  :config
  (setq deft-extensions '("txt" "tex" "org"))
  (setq deft-use-filename-as-title t)
  (setq deft-directory "~/Dropbox/jschoolcraft/notes"))

(use-package web-mode
  :config
  (setq web-mode-attr-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-indent-style 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-sql-indent-offset 2))

;; editorconfig
;; for consistency among developers on a project
(use-package editorconfig
  :config
  (editorconfig-mode 1))

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(add-to-list 'load-path (expand-file-name "lib" user-emacs-directory))

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
(setq auto-save-default nil
      auto-save-list-file-prefix nil
      make-backup-files nil)

; Hate whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; electric-pair-mode
;; smartish parens/pairs stuff
(electric-pair-mode)

;; put that custom bullshit somewhere else
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

(provide 'init)
;;; init.el ends here
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-region 'disabled nil)

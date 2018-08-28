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

;;Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

; (unless (package-installed-p 'org)
;   (package-refresh-contents)
;   (package-install 'org))
;
; (unless (package-installed-p 'org-plus-contrib)
;   (package-refresh-contents)
;   (package-install 'org-plus-contrib))

(eval-when-compile
  (require 'use-package))

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
(setq gc-cons-threshold (* 500 1024 1024))
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

;; helm & projectile
(use-package helm
  :config (helm-mode t))

; globally enable fuzzy matching in helm
; (customize-set-variable 'helm-mode-fuzzy-match t)
; (customize-set-variable 'helm-completion-in-region-fuzzy-match t)

(use-package projectile
  :defer 2
  :diminish projectile-mode
  :config
  ;(setq projectile-indexing-method 'git)
  (projectile-global-mode))

(use-package helm-projectile)
(use-package helm-ag)

;; auto-completion
(use-package company
  :diminish company-mode
  :hook
  (after-init . global-company-mode))

(use-package highlight-symbol
  :diminish ""
  :config
  (setq-default highlight-symbol-idle-delay 1.5))

(setq helm-ag-base-command "ag --hidden --nocolor --nogroup --ignore-case")
(helm-projectile-on)

;; flycheck
(use-package flycheck
  :init
  (setq flycheck-indication-mode nil)
  (setq flycheck-display-errors-delay nil)
  (setq flycheck-idle-change-delay 2)
  (setq flycheck-highlighting-mode 'lines)
  ;;   (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  (global-flycheck-mode))
;; (flycheck-add-mode 'javascript-eslint 'web-mode)

;; Make sure eslint does not try to --print-config after each buffer opens.
;; Here’s a related Flycheck: https://github.com/flycheck/flycheck/issues/1129
(with-eval-after-load 'flycheck
  (advice-add 'flycheck-eslint-config-exists-p :override (lambda() t)))

(custom-set-faces
 '(flycheck-error ((((class color)) (:underline "Red"))))
 '(flycheck-warning ((((class color)) (:underline "Orange")))))

;; ;; make sure eslint is from local project
;; (defun my/use-eslint-from-node-modules ()
;;   (let* ((root (locate-dominating-file
;;                 (or (buffer-file-name) default-directory)
;;                 "node_modules"))
;;          (eslint (and root
;;                       (expand-file-name "node_modules/eslint/bin/eslint.js"
;;                                         root))))
;;     (when (and eslint (file-executable-p eslint))
;;       (setq-local flycheck-javascript-eslint-executable eslint))))
;; (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

;; no idea
;;(use-package yasnippet
;;  :init
;;  (yas-global-mode 1)
;;  :config
;;  (yas-reload-all)
;;  (setq yas-snippet-dirs '("~/.emacs.d/snippets"
;;                           "~/.emacs.d/remote-snippets"))
;;  (setq yas-indent-line nil)
;;  (setq tab-always-indent 'complete)
;;  (setq yas-prompt-functions '(yas-completing-prompt
;;                               yas-ido-prompt
;;                               yas-dropdown-prompt))
;;  (define-key yas-minor-mode-map (kbd "<escape>") 'yas-exit-snippet))

(use-package yasnippet)

;; git related stuffs
(use-package magit
  :ensure t
  :config (setq magit-diff-refine-hunk 'all))

(use-package diff-hl
  :init
  (setq diff-hl-side 'right))

(global-diff-hl-mode 1)
(diff-hl-margin-mode 1)
(diff-hl-flydiff-mode 1)

(use-package which-key
  :defer nil
  :diminish which-key-mode
  :config
  (which-key-mode t))

(use-package restclient)

(use-package markdown-mode
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

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
  :init
    (setq web-mode-content-types-alist '(("jsx" . "\\.tsx\\'")))
    (setq web-mode-content-types-alist '(("jsx" . "\\.js\\'")))
  :config
    (add-to-list 'auto-mode-alist '("\\.erb?\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.ts[x]?\\'" . web-mode)))

;; (use-package add-node-modules-path
;;   :ensure t)

(eval-after-load 'web-mode
    '(progn
       (add-hook 'web-mode-hook #'add-node-modules-path)
       (add-hook 'web-mode-hook #'prettier-js-mode)))

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

; Make files easier to distinguish
(use-package uniquify
  :defer 1
  :ensure nil
  :custom
  (uniquify-after-kill-buffer-p t)
  (uniquify-buffer-name-style 'post-forward)
  (uniquify-strip-common-suffix t))

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

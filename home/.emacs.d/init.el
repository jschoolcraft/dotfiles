;; DO NOT EDIT THIS FILE DIRECTLY
;; This file is programmatically generated from the corresponding .org file in this directory
;; You should make any changes there and regenerate it from Emacs org-mode using org-babel-tangle

(setq user-full-name "Jeff Schoolcraft")
(setq user-mail-address "jschoolcraft@aissaclabs.com")

(defun jas/config-setup-hook ()
  (eval-and-compile
  (setq gc-cons-threshold most-positive-fixnum
        gc-cons-percentage 0.6)))

(defun jas/config-exit-hook ()
  (setq gc-cons-threshold 80000
      gc-cons-percentage 0.1))

(add-hook 'before-init-hook #'jas/config-setup-hook)
(add-hook 'after-init-hook  #'jas/config-exit-hook)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("mela-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  (package-install 'diminish))

(eval-when-compile
  (require 'use-package)
  (require 'diminish))

(customize-set-variable 'use-package-always-ensure t)

;(customize-set-variable 'use-package-always-defer t)

(customize-set-variable 'load-prefer-newer t)

(use-package auto-compile
  :defer nil
  :config (auto-compile-on-load-mode))

(setq exec-path (append exec-path '("/usr/local/bin")))

(setq exec-path (append exec-path '("~/.asdf/installs")))

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

(use-package restart-emacs)

(setq select-enable-clipboard t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq auto-save-default nil
      auto-save-list-file-prefix nil
      make-backup-files nil)

(use-package evil-leader
  :defer nil
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader ";"))

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

(evil-leader/set-key
  "." 'find-tag
  "t" 'counsel-projectile-find-files
  "f" 'counsel-projectile-find-files
  "b" 'counsel-ibuffer
  "e" 'flycheck-list-errors
  "ag" 'projectile-ag
  "vs" 'split-window-right
  "hs" 'split-window-below
  "mx" 'counsel-M-x
  "p" 'counsel-yank-pop
  "oc" 'org-capture
  "ot" 'org-babel-tangle
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

(defun jas/open-init-file ()
  (interactive)
  (load-file "~/code/dotfiles/home/.emacs.d/init.org"))
(evil-leader/set-key "cl" 'jas/open-init-file)

(defun jas/reload-init-file ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))
(evil-leader/set-key "r" 'jas/reload-init-file)

(use-package evil
  :init
  (setq evil-want-integration nil)
  :bind
  ;; moving around windows
  (:map evil-normal-state-map
        ("C-h" . 'evil-window-left)
        ("C-j" . 'evil-window-down)
        ("C-k" . 'evil-window-up)
        ("C-l" . 'evil-window-right)
        )
  ;; swap 0 and ^ so 0 goes back to first non-whitespace character
  (:map evil-motion-state-map
        ("0" . 'evil-first-non-blank)
        ("^" . 'evil-beginning-of-line)
        )
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :custom (evil-collection-setup-minibuffer t)
  :config
  (evil-collection-init))

(use-package evil-org
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda () (evil-org-set-key-theme))))

(use-package evil-escape
  :after evil
  :config
  (evil-escape-mode t))

;; (defun minibuffer-keyboard-quit ()
;; (interactive)
;; (if (and delete-selection-mode transient-mark-mode mark-active)
;;     (setq deactivate-mark  t)
;; (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
;; (abort-recursive-edit)))
;;
;; (define-key evil-visual-state-map [escape] 'keyboard-quit)
;; (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

(use-package diminish
  :ensure t
  :demand t
  :diminish (visual-line-mode . "ω")
  :diminish hs-minor-mode
  :diminish abbrev-mode
  :diminish auto-fill-function
  :diminish subword-mode)

(use-package hydra)

(defhydra hydra-files (:color blue)
  "Files"

  ("d" (lambda () (interactive)
         (find-file "~/code/dotfiles/home/.emacs.d/init.org")) "dot-file")
  ("g" (lambda () (interactive) (find-file "~/Dropbox/org/gtd.org"))
   "gtd")
  ("n" (lambda () (interactive) (find-file "~/Dropbox/org/notes.org"))
   "notes")
  ("f" helm-find-files "helm-find-files")
  ("m" helm-multi-files "helm-multi-files")
  ("b" helm-filtered-bookmarks "helm-filtered-bookmarks")
  ("F" helm-tramp "helm-tramp")
  ("r" helm-recentf "recentf-open-files"))

(evil-leader/set-key "of" 'hydra-files/body)

(use-package flyspell
  :defer 1
  :hook (text-mode . flyspell-mode)
  :diminish
  :bind (:map flyspell-mouse-map
              ([down-mouse-3] . #'flyspell-correct-word)
              ([mouse-3]      . #'undefined)))

(use-package magit
  :config (setq magit-diff-refine-hunk 'all))

(use-package evil-magit
  :after evil)

(use-package diff-hl
  :disabled
  :custom
  (diff-hl-side 'right)
  :config
  (global-diff-hl-mode 1)
  (diff-hl-margin-mode 1)
  (diff-hl-flydiff-mode 1))

(use-package ag
  :ensure    t
  :commands  (ag ag-project)
  :custom
    (ag-highlight-search t)
    (ag-highlight-search t)
    (ag-reuse-buffers t)
    (ag-reuse-window t)
  :config
  (add-to-list 'ag-arguments "--word-regexp"))
  ;; (setq ag-executable "/usr/local/bin/ag")

(use-package which-key
  :defer nil
  :diminish which-key-mode
  :config
  (which-key-mode t))

(use-package helm
  :disabled
  :defer 1
  :diminish helm-mode
  :custom
    (helm-autoresize-max-height 0)
    (helm-autoresize-min-height 40)
    (helm-M-x-fuzzy-match t)
    (helm-buffers-fuzzy-matching t)
    (helm-recentf-fuzzy-match t)
    (helm-semantic-fuzzy-match t)
    (helm-imenu-fuzzy-match t)
    (helm-split-window-in-side-p nil)
    (helm-move-to-line-cycle-in-source nil)
    (helm-ff-search-library-in-sexp t)
    (helm-scroll-amount 8)
    (helm-echo-input-in-header-line nil)
    (helm-mode-fuzzy-match t)
    (helm-completion-in-region-fuzzy-match t)
  :init
  (helm-mode 1))

(use-package smex)

(use-package ivy
  :diminish ivy-mode
  :custom
  (ivy-initial-inputs-alist nil)
  :config
  (ivy-mode t))

(use-package counsel
    :bind (("M-x" . counsel-M-x)))
    ;:chords (("yy" . counsel-yank-pop)))

(use-package swiper
  :bind (("M-s" . swiper)))

(use-package ivy-hydra)

(use-package avy)
;    :chords (("jj" . avy-goto-char-2)
;             ("jl" . avy-goto-line)))

(use-package projectile
  :defer 2
  :diminish projectile-mode
  :config
  ;(setq projectile-indexing-method 'git)
  (projectile-global-mode))

(use-package counsel-projectile
  :after (counsel projectile))

(use-package helm-projectile
  :disabled
  :after (helm projectile)
  :config
  (helm-projectile-on))

(use-package helm-ag
  :disabled
  :after (helm ag))

                                        ; not sure if I care about this yet or not
                                        ;(setq helm-ag-base-command "ag --hidden --nocolor --nogroup --ignore-case")

(use-package company
  :diminish company-mode
  :hook
  (after-init . global-company-mode))

(use-package restclient)

(use-package flycheck
    :custom
    (flycheck-indication-mode nil)
    (flycheck-display-errors-delay nil)
    (flycheck-idle-change-delay 2)
    (flycheck-highlighting-mode 'lines)
    ;;   (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
   :diminish
   :config
    (global-flycheck-mode)
    (evil-leader/set-key "ej" 'flycheck-next-error)
    (evil-leader/set-key "ek" 'flycheck-previous-error)
    (use-package flycheck-pos-tip
       :config
       (flycheck-pos-tip-mode))
    (use-package helm-flycheck
       :disabled
       :after helm))
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

(use-package smartparens
  :disabled
  :diminish smartparens-mode
  :custom
  (sp-base-key-bindings 'paredit)
  (sp-autoskip-closing-pair 'always)
  (sp-hybrid-kill-entire-symbol nil)
  :init
  (sp-use-paredit-bindings)
  (show-smartparens-global-mode t)
  :hook
  ('prog-mode 'smartparens-mode))

(use-package rainbow-delimiters
  :disabled
  :hook
  ('prog-mode 'rainbow-delimiters-mode))

(use-package yasnippet
  :disabled)

(use-package bug-hunter
  :commands (bug-hunter-file bug-hunter-init-file))

(use-package uniquify
  :defer 1
  :ensure nil
  :custom
  (uniquify-after-kill-buffer-p t)
  (uniquify-buffer-name-style 'post-forward)
  (uniquify-strip-common-suffix t))

(use-package deft
  :commands (deft)
  :config
  (setq deft-extensions '("txt" "tex" "org"))
  (setq deft-use-filename-as-title t)
  (setq deft-directory "~/Dropbox/jschoolcraft/notes"))

(use-package editorconfig
  :config
  (editorconfig-mode 1))

(use-package expand-region)

(use-package undo-tree
  :diminish
  :config
  (global-undo-mode 1))

(use-package markdown-mode
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package yaml-mode)

(use-package haml-mode)

(use-package ruby-mode
  :mode (
         "Berksfile\\'"
         "Capfile\\'"
         "Fastfile\\'"
         "Gemfile\\'"
         "Guardfile\\'"
         "Matchfile\\'"
         "Rakefile\\'"
         "Thorfile\\'"
         "Vagrantfile\\'"
         "\\.cap\\'"
         "\\.gemspec\\'"
         "\\.jbuilder\\'"
         "\\.rabl\\'"
         "\\.rake\\'"
         "\\.rb\\'"
         "\\.ru\\'"
         "\\.thor\\'"
         )
  :init
  (setq ruby-indent-level 2
        ruby-indent-tabs-mode nil)
  (add-hook 'ruby-mode 'superword-mode))

(use-package ruby-tools
  :diminish ""
  :hook
  ('ruby-mode 'ruby-tools-mode)
  :config
  (ruby-tools-mode t))

(use-package rbenv
  :disabled
  :defer 25
  :init
  (setq rbenv-show-active-ruby-in-modeline nil)
  :config
  (global-rbenv-mode t))

(use-package json-mode)

(use-package js2-mode
  :mode "\\.js\\'"
  :hook
  ('js2-mode 'js2-imenu-extras-mode)
  :config
  (setq-default js-indent-level 2)
  (setq-default js-auto-indent-flag nil))

(use-package skewer-mode
  :disabled
  :hook
  ('js2-mode 'skewer-mode))

(use-package js2-refactor
  :disabled
  :init
  (add-hook 'js2-mode-hook 'js2-refactor-mode)
  :bind (:map js2-mode-map
              ("C-k" . js2r-kill))
  )

(use-package company-tern
  :disabled
  :init
  ;; (add-to-list 'company-backends 'company-tern)
  (add-hook 'js2-mode-hook (lambda () (tern-mode)))

  :config
  ;; Disable completion keybindings, as we use xref-js2 instead
  (define-key tern-mode-keymap (kbd "M-.") nil)
  (define-key tern-mode-keymap (kbd "M-,") nil)
  )

(use-package indium
  :disabled
  :hook
  ('js-mode 'indium-interaction-mode))

(use-package rjsx-mode
  :disabled
  :mode "\\.jsx\\'"
  :config
  (add-to-list 'auto-mode-alist '("components\\/.*\\.jsx\\'" . rjsx-mode)))

(use-package web-mode
  :init
    (setq web-mode-content-types-alist '(("jsx" . "\\.tsx\\'")))
    (setq web-mode-content-types-alist '(("jsx" . "\\.js\\'")))
  :config
    (add-to-list 'auto-mode-alist '("\\.erb?\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.ts[x]?\\'" . web-mode)))

(use-package org
      :pin "gnu"
      :custom
      (org-src-fontify-natively  t)
      (org-src-tab-acts-natively t)

                                            ; directories
      (org-directory "~/Dropbox/org")
      (org-default-notes-file (concat org-directory "/notes.org"))


      ;; refiling
      ;; all of this stolen from https://blog.aaronbieber.com/2017/03/19/organizing-notes-with-refile.html
      ;; look at this https://mollermara.com/blog/Fast-refiling-in-org-mode-with-hydras/
      (org-refile-targets '((org-agenda-files :maxlevel . 4)))
      (org-refile-use-outline-path 'file)
      (org-outline-path-complete-in-steps nil)
      (org-refile-allow-creating-parent-nodes 'confirm)

      (org-log-done t)
      :config
      (progn

        ;; highlight code blocks syntax
(setq org-ellipsis "↴")

                                            ; set the modules enabled by default
        (setq org-modules '(
                            org-bbdb
                            org-bibtex
                            org-docview
                            org-mhe
                            org-rmail
                            org-crypt
                            org-protocol
                            org-gnus
                            org-id
                            org-info
                            org-habit
                            org-irc
                            org-annotate-file
                            org-eval
                            org-expiry
                            org-man
                            org-panel
                            org-tempo
                            org-toc))




        ;; tasks management
        ;; (setq org-clock-idle-time nil)

        ;; agenda & diary
        (setq org-agenda-include-diary t)
        (setq org-agenda-files '("~/Dropbox/org/"
                                 "~/Dropbox/org/personal.org"
                                 "~/Dropbox/org/technical.org"
                                 "~/Dropbox/org/project.org"
                                 "~/Dropbox/org/clients/"))
        (setq org-agenda-inhibit-startup t)

        ;; show images inline
        ;; only works in GUI, but is a nice feature to have
        (when (window-system)
          (setq org-startup-with-inline-images t))
        ;; limit images width
        (setq org-image-actual-width '(800))

        ;; Some initial langauges we want org-babel to support
        (org-babel-do-load-languages 'org-babel-load-languages
                                     '((js     . t)
                                       (python . t)
                                       (ruby   . t)
                                       (dot    . t)
                                       (org . t)
                                       (sqlite . t)
                                       (perl   . t)))

        ;; easy elisp source blocks
        (add-to-list 'org-structure-template-alist '("el" "#+BEGIN_SRC emacs-lisp\n?\n#+END_SRC"))
        ;; refresh images after execution
        (add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)
        (add-hook 'after-save-hook 'org-babel-tangle
                  'run-at-end
                  'only-in-org-mode)
        )
      )

                                            ;(use-package org-mac-link
                                            ;  :disabled)

                                            ;(setq org-ellipsis "⤵")
  (use-package org-bullets
    :after org
    :hook (org-mode . (lambda () (org-bullets-mode 1))))

    '(org-agenda-date ((t (:inherit org-agenda-structure :weight semi-bold :height 1.2))) t)
    '(org-date ((t (:foreground "Purple" :underline t :height 0.8 :family "Helvetica Neue"))))
    '(org-done ((t (:foreground "gray57" :weight light))))
    '(org-level-1 ((t (:weight semi-bold :height 1.1 :family "Helvetica Neue"))))
    '(org-level-2 ((t (:inherit outline-2 :weight semi-bold :height 1.1))))
    '(org-level-3 ((t (:inherit outline-3 :weight bold :family "Helvetica Neue"))))
    '(org-level-5 ((t (:inherit outline-5 :family "Helvetica Neue"))))
    '(org-link ((t (:inherit link :weight normal))))
    '(org-meta-line ((t (:inherit font-lock-comment-face :height 0.8))))
    '(org-property-value ((t (:height 0.9 :family "Helvetica Neue"))) t)
    '(org-special-keyword ((t (:inherit font-lock-keyword-face :height 0.8 :family "Helvetica Neue"))))
    '(org-table ((t (:foreground "dim gray" :height 0.9 :family "Menlo"))))
    '(org-tag ((t (:foreground "dark gray" :weight bold :height 0.8))))
    '(org-todo ((t (:foreground "#e67e22" :weight bold))))

    (require 'org-install)
    (require 'ob-tangle)

    ;; should be able to use this, according to:
    ;; https://github.com/heikkil/emacs-literal-config/blob/master/emacs.org#url-copying
    ;; https://orgmode.org/worg/org-contrib/org-mac-link.html
    ;; (use-package org-mac-link
    ;;   :ensure t
    ;;   :if (eq system-type 'darwin)
    ;;   :bind ("C-c v" . my/quick-url-note)
    ;;   :config
    ;;   (defun my/quick-url-note ()
    ;;     "Fastest way to capture a web page link"
    ;;     (interactive)
    ;;     (org-capture nil "n")
    ;;     (org-mac-chrome-insert-frontmost-url)
    ;;     (org-capture-finalize)))

    ;; todo states
    ;; https://thraxys.wordpress.com/2016/01/14/pimp-up-your-org-agenda/
    ;; you can add UTF-8 bits to sequence keywords, something like:
    ;; (setq org-todo-keywords '((sequence "☛ TODO(t)" "|" "<img draggable="false" class="emoji" alt="✔" src="https://s0.wp.com/wp-content/mu-plugins/wpcom-smileys/twemoji/2/svg/2714.svg"> DONE(d)")
    ;;                           (sequence "⚑ WAITING(w)" "|")
    ;;                           (sequence "|" "✘ CANCELED(c)")))

    ;; todo state triggers
    ;; automatically do things based on todo state
    ;; http://doc.norang.ca/org-mode.html#ToDoStateTriggers

    ;; just evaluate, don't ask me
    (setq org-confirm-babel-evaluate nil)

    ;; syntax highlighting code blocks
    (setq org-src-fontify-natively t)
    (setq org-src-tab-acts-natively t)



      ;;; this is here for the alfred workflow
    ;;   all of this was stolen from:
    ;;   https://github.com/jjasghar/alfred-org-capture/blob/master/el/alfred-org-capture.el
    ;; for this to work the server has to be started: M-x start-server
    (defun make-orgcapture-frame ()
      "Create a new frame and run org-capture."
      (interactive)
      (make-frame '((name . "remember") (width . 80) (height . 16)
                    (top . 400) (left . 300)
                    (font . "-apple-Monaco-medium-normal-normal-*-13-*-*-*-m-0-iso10646-1")
                    ))
      (select-frame-by-name "remember")
      (org-capture))

(use-package toc-org
  :after org
  :init (add-hook 'org-mode-hook #'toc-org-enable))

;; evil keys
(use-package evil-org
  :ensure t
  :after (evil org)
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme)))
  (evil-leader/set-key-for-mode 'org-mode
    "." 'hydra-org-state/body
    "r" 'org-refile
    "s" 'org-schedule
    "d" 'org-deadline
    "t" 'org-todo
    "T" 'org-show-todo-tree
    "v" 'org-mark-element
    "a" 'org-agenda
    "c" 'org-archive-subtree
    "l" 'evil-org-open-links
    "C" 'org-resolve-clocks))

(setq org-capture-templates nil)

(add-to-list 'org-capture-templates
             '("t" "Todo" entry (file+headline "~/Dropbox/org/gtd.org" "Tasks")
               "* TODO %?\n  %i\n  %a"))

(add-to-list 'org-capture-templates
             '("r" "TODO" entry (file+headline "~/Dropbox/org/gtd.org" "Tasks")
               "* TODO %^{Task}  %^G\n   %?\n  %a"))

(add-to-list 'org-capture-templates
             '("j" "Journal" entry (file+datetree "~/Dropbox/org/journal.org")
               "* %?\nEntered on %U\n  %i\n  %a"))

(add-to-list 'org-capture-templates
             '("m" "Meeting"))

(add-to-list 'org-capture-templates
             '("mr" "Roth" entry (file+datetree "~/Dropbox/org/clients/Roth.org")
               "* %?\nEntered on %U\n  %i\n"))

(add-to-list 'org-capture-templates
             '("ms" "SkillScout" entry (file+datetree "~/Dropbox/org/clients/SkillScout.org")
               "* %?\nEntered on %U\n  %i\n"))

(add-to-list 'org-capture-templates
             '("mw" "SZW" entry (file+datetree "~/Dropbox/org/clients/Subzero.org")
               "* %?\nEntered on %U\n  %i\n"))

(add-to-list 'org-capture-templates
             '("p" "Phone" entry (file+datetree "~/Dropbox/org/inbox.org")
               "* %?\nEntered on %U\n  %i\n"))

(add-to-list 'org-capture-templates
             '("i" "Inbox" entry (file+datetree "~/Dropbox/org/inbox.org")
               "* %?\nEntered on %U\n  %i\n  %a"))

(add-to-list 'org-capture-templates
             '("I" "Read Later" entry (file+datetree "~/Dropbox/org/inbox.org")
               "* %?\n  %i\n %c\n"))

(add-to-list 'org-capture-templates
             '("n" "Notes" entry (file+headline "~/Dropbox/org/notes.org" "Notes")
               "* %^{Header}  %^G\n  %U\n\n  %?"))

(add-to-list 'org-capture-templates
             '("l" "Link" entry (file+headline "~/Dropbox/org/links.org" "Links")
               "* %? %^L %^g \n%T" :prepend t))

(add-to-list 'org-capture-templates
             '("f" "Meal Plan" entry (file+datetree "~/Dropbox/org/menu.org")
               "* %?\nEntered on %U\n  %i\n"))

(use-package org-web-tools
  :after org
  :config
  (setq org-web-tools-pandoc-sleep-time 0.5))

;(org-mode . (lambda () (add-hook 'after-save-hook 'org-babel-tangle
                                 ;'run-at-end 'only-in-org-mode)))

(use-package ox-twbs
  :ensure t)

(defun jas/my-org-publish-buffer ()
  (interactive)
  (save-buffer)
  (save-excursion (org-publish-current-file))
  (let* ((proj (org-publish-get-project-from-filename buffer-file-name))
         (proj-plist (cdr proj))
         (rel (file-relative-name buffer-file-name
                                  (plist-get proj-plist :base-directory)))
         (dest (plist-get proj-plist :publishing-directory)))
    (browse-url (concat "file://"
                        (file-name-as-directory (expand-file-name dest))
                        (file-name-sans-extension rel)
                        ".html"))))

(use-package ox-pandoc)

(use-package htmlize)

; (use-package moe-theme)
; (use-package alect-themes)
; (use-package molokai-theme)
; (use-package apropospriate-theme)
; (use-package color-theme-sanityinc-solarized)
; (use-package dracula-theme)
; (use-package atom-one-dark-theme)

(use-package base16-theme
  :disabled
  :config
  (load-theme 'base16-irblack t))

(use-package doom-themes
  :custom
    (doom-themes-enabled-bold t)
    (doom-themes-enabled-italic t)
  :config
    (doom-themes-visual-bell-config)
    (doom-themes-org-config)
    (load-theme 'doom-one t))

(setq initial-frame-alist
      '((width . 102)   ; characters in a line
        (height . 54))) ; number of lines

;; sebsequent frame
(setq default-frame-alist
      '((width . 100)   ; characters in a line
        (height . 52))) ; number of lines

(setq default-frame-alist
      '((width . 100)   ; characters in a line
        (height . 52))) ; number of lines

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(use-package powerline)
(use-package powerline-evil)

(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (setq powerline-default-separator (quote bar))
  (spaceline-highlight-face-evil-state)
  (spaceline-toggle-minor-modes-off)
  (spaceline-spacemacs-theme))

(use-package golden-ratio
  :diminish
  :custom
  (golden-ratio-adjust-factor .8)
  (golden-ratio-wide-adjust-factor .8)
  :config
  (golden-ratio-mode 1))

(set-face-attribute 'default nil :font "Monaco 16")

(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t
      initial-scratch-message ""
      visible-bell t)

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
;(global-hl-line-mode 1)

;; settings for the mode line
(column-number-mode t)
(setq size-indication-mode t)
(which-function-mode 1)
(line-number-mode 1)

(use-package linum-relative
  :hook
  (after-init . linum-relative-on))

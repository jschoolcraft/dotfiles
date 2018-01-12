;;; orgmode --- making orgmode look a little better

;;; Commentary:
; stolen from: http://mph.puddingbowl.org/2014/12/org-mode-face-lift/

;;; Other Sources:
; https://github.com/joedicastro/dotfiles/tree/master/emacs/.emacs.d#org-mode-settings

;;; Code:
(use-package org
  :ensure t
  :defer t
  :config
  (progn
    ;; set the modules enabled by default
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
                        org-toc))
    ;; set default directories
    (setq org-directory "~/Dropbox/org"
          org-default-notes-file (concat org-directory "/notes.org"))

    ;; set the archive
    (setq org-archive-location "~/Dropbox/org/archive/%s_archive::datetree/** Archived")

    ;; refiling
    ;; all of this stolen from https://blog.aaronbieber.com/2017/03/19/organizing-notes-with-refile.html
    ;; look at this https://mollermara.com/blog/Fast-refiling-in-org-mode-with-hydras/
    (setq org-refile-targets '((org-agenda-files :maxlevel . 3))
          org-refile-use-outline-path 'file
          org-outline-path-complete-in-steps nil
          org-refile-allow-creating-parent-nodes 'confirm)


    ;; capture templates
    (setq org-capture-templates
          '(
            ("t" "Todo" entry (file+headline "~/Dropbox/org/gtd.org" "Tasks")
             "* TODO %?\n  %i\n  %a")
            ("r" "TODO" entry (file+headline "~/Dropbox/org/gtd.org" "Tasks")
             "* TODO %^{Task}  %^G\n   %?\n  %a")
            ("j" "Journal" entry (file+datetree "~/Dropbox/org/journal.org")
             "* %?\nEntered on %U\n  %i\n  %a")
            ("i" "Inbox" entry (file+datetree "~/Dropbox/org/inbox.org")
             "* %?\nEntered on %U\n  %i\n  %a")
            ("n" "Notes" entry (file+headline "~/Dropbox/org/notes.org" "Notes")
             "* %^{Header}  %^G\n  %U\n\n  %?")
            ("l" "Link" entry (file+headline "~/Dropbox/org/links.org" "Links")
             "* %? %^L %^g \n%T" :prepend t)
            ))

    ;; highlight code blocks syntax
    (setq org-src-fontify-natively  t
          org-src-tab-acts-natively t)
    (add-to-list 'org-src-lang-modes (quote ("dot" . graphviz-dot)))

    ;; tasks management
    (setq org-log-done t)
    ;; (setq org-clock-idle-time nil)

    ;; agenda & diary
    (setq org-agenda-include-diary t)
    (setq org-agenda-files '("~/Dropbox/org/"
                             "~/Dropbox/org/personal.org"
                             "~/Dropbox/org/technical.org"
                             "~/Dropbox/org/project.org"))
    (setq org-agenda-inhibit-startup t)

    ;; show images inline
    ;; only works in GUI, but is a nice feature to have
    (when (window-system)
      (setq org-startup-with-inline-images t))
    ;; limit images width
    (setq org-image-actual-width '(800))

    ;; Some initial langauges we want org-babel to support
    (org-babel-do-load-languages 'org-babel-load-languages
                                 '((sh     . t)
                                   (js     . t)
                                   (python . t)
                                   (ruby   . t)
                                   (dot    . t)
                                   (org . t)
                                   (sqlite . t)
                                   (perl   . t)))

    ;; refresh images after execution
    (add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)
    )
  )

(use-package org-bullets
  :ensure t
  :config
  (progn
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))))

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

;; https://thraxys.wordpress.com/2016/01/14/pimp-up-your-org-agenda/
;; you can add UTF-8 bits to sequence keywords, something like:
;; (setq org-todo-keywords '((sequence "☛ TODO(t)" "|" "<img draggable="false" class="emoji" alt="✔" src="https://s0.wp.com/wp-content/mu-plugins/wpcom-smileys/twemoji/2/svg/2714.svg"> DONE(d)")
;;                           (sequence "⚑ WAITING(w)" "|")
;;                           (sequence "|" "✘ CANCELED(c)")))

;; just evaluate, don't ask me
(setq org-confirm-babel-evaluate nil)

;; syntax highlighting code blocks
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)

;; evil keys
(use-package evil-org
  :ensure t
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme)))
   (evil-leader/set-key-for-mode 'org-mode
     "." 'hydra-org-state/body
     "t" 'org-todo
     "T" 'org-show-todo-tree
     "v" 'org-mark-element
     "a" 'org-agenda
     "c" 'org-archive-subtree
     "l" 'evil-org-open-links
     "C" 'org-resolve-clocks))

;; Define a transient state for quick navigation
; (defhydra hydra-org-state ()
;   ;; basic navigation
;   ("i" org-cycle)
;   ("I" org-shifttab)
;   ("h" org-up-element)
;   ("l" org-down-element)
;   ("j" org-forward-element)
;   ("k" org-backward-element)
;   ;; navigating links
;   ("n" org-next-link)
;   ("p" org-previous-link)
;   ("o" org-open-at-point)
;   ;; navigation blocks
;   ("N" org-next-block)
;   ("P" org-previous-block)
;   ;; updates
;   ("." org-ctrl-c-ctrl-c)
;   ("*" org-ctrl-c-star)
;   ("-" org-ctrl-c-minus)
;   ;; change todo state
;   ("H" org-shiftleft)
;   ("L" org-shiftright)
;   ("J" org-shiftdown)
;   ("K" org-shiftup)
;   ("t" org-todo))

;; exporting
(use-package ox-html
  :init
  (setq org-html-postamble nil)
  (setq org-export-with-section-numbers nil)
  (setq org-export-with-toc nil)
  (setq org-html-head-extra "
     <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700,400italic,700italic&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
     <link href='http://fonts.googleapis.com/css?family=Source+Code+Pro:400,700' rel='stylesheet' type='text/css'>
     <style type='text/css'>
        body {
           font-family: 'Source Sans Pro', sans-serif;
        }
        pre, code {
           font-family: 'Source Code Pro', monospace;
        }
     </style>"))

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

(provide 'orgmode)
;;; orgmode.el ends here

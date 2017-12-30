;;; orgmode --- making orgmode look a little better

;;; Commentary:
; stolen from: http://mph.puddingbowl.org/2014/12/org-mode-face-lift/

;;; Code:
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

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

; refiling
; all of this stolen from https://blog.aaronbieber.com/2017/03/19/organizing-notes-with-refile.html
(setq org-refile-targets '((org-agenda-files :maxlevel . 3))
      org-refile-use-outline-path 'file
      org-outline-path-complete-in-steps nil
      org-refile-allow-creating-parent-nodes 'confirm)

(setq org-agenda-files '("~/orgnotes/"
                         "~/Dropbox/org/personal"
                         "~/Dropbox/org/technical"
                         "~/Dropbox/org/project"))

; capture templates
(setq org-capture-templates
      '(
        ("t" "Todo" entry (file+headline "~/orgnotes/gtd.org" "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/orgnotes/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a")
        ("i" "Inbox" entry (file+datetree "~/orgnotes/inbox.org")
         "* %?\nEntered on %U\n  %i\n  %a")
        ))
(require 'org-install)
(require 'ob-tangle)

; Some initial langauges we want org-babel to support
(org-babel-do-load-languages 'org-babel-load-languages
                             '((sh     . t)
                               (js     . t)
                               (python . t)
                               (ruby   . t)
                               (dot    . t)
                               (sqlite . t)
                               (perl   . t)))

;; just evaluate, don't ask me
(setq org-confirm-babel-evaluate nil)

;; syntax highlighting code blocks
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)

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

(provide 'orgmode)
;;; orgmode.el ends here

;;; orgmode --- making orgmode look a little better

;;; Commentary:
; stolen from: http://mph.puddingbowl.org/2014/12/org-mode-face-lift/

;;; Other Sources:
;; https://github.com/joedicastro/dotfiles/tree/master/emacs/.emacs.d#org-mode-settings
;; https://mollermara.com/blog/Fast-refiling-in-org-mode-with-hydras/
;; https://github.com/brainlessdeveloper/emacs.d/blob/master/config.org#gtd
;; https://thraxys.wordpress.com/2016/01/14/pimp-up-your-org-agenda/
;; https://emacs.cafe/emacs/orgmode/gtd/2017/06/30/orgmode-gtd.html
;; https://zzamboni.org/post/my-emacs-configuration-with-commentary/

;;; Code:
(use-package org-plus-contrib
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
    (setq org-refile-targets '((org-agenda-files :maxlevel . 4))
          org-refile-use-outline-path 'file
          org-outline-path-complete-in-steps nil
          org-refile-allow-creating-parent-nodes 'confirm)

    ;; Template Expansions (for reference, from: https://orgmode.org/manual/Template-expansion.html#Template-expansion)
    ;; %[file]     Insert the contents of the file given by file.
    ;; %(sexp)     Evaluate Elisp sexp and replace with the result.
    ;;                   For convenience, %:keyword (see below) placeholders
    ;;                   within the expression will be expanded prior to this.
    ;;                   The sexp must return a string.
    ;; %<...>      The result of format-time-string on the ... format specification.
    ;; %t          Timestamp, date only.
    ;; %T          Timestamp, with date and time.
    ;; %u, %U      Like the above, but inactive timestamps.
    ;; %i          Initial content, the region when capture is called while the
    ;;             region is active.
    ;;             The entire text will be indented like %i itself.
    ;; %a          Annotation, normally the link created with org-store-link.
    ;; %A          Like %a, but prompt for the description part.
    ;; %l          Like %a, but only insert the literal link.
    ;; %c          Current kill ring head.
    ;; %x          Content of the X clipboard.
    ;; %k          Title of the currently clocked task.
    ;; %K          Link to the currently clocked task.
    ;; %n          User name (taken from user-full-name).
    ;; %f          File visited by current buffer when org-capture was called.
    ;; %F          Full path of the file or directory visited by current buffer.
    ;; %:keyword   Specific information for certain link types, see below.
    ;; %^g         Prompt for tags, with completion on tags in target file.
    ;; %^G         Prompt for tags, with completion all tags in all agenda files.
    ;; %^t         Like %t, but prompt for date.  Similarly %^T, %^u, %^U.
    ;;             You may define a prompt like %^{Birthday}t.
    ;; %^C         Interactive selection of which kill or clip to use.
    ;; %^L         Like %^C, but insert as link.
    ;; %^{prop}p   Prompt the user for a value for property prop.
    ;; %^{prompt}  prompt the user for a string and replace this sequence with it.
    ;;             You may specify a default value and a completion table with
    ;;             %^{prompt|default|completion2|completion3...}.
    ;;             The arrow keys access a prompt-specific history.
    ;; %\1 … %\N Insert the text entered at the Nth %^{prompt}, where N is
    ;;             a number, starting from 1.(90)
    ;; %?          After completing the template, position cursor here.

    ;; capture templates
    (setq org-capture-templates
          '(
            ("t" "Todo" entry (file+headline "~/Dropbox/org/gtd.org" "Tasks")
             "* TODO %?\n  %i\n  %a")
            ("r" "TODO" entry (file+headline "~/Dropbox/org/gtd.org" "Tasks")
             "* TODO %^{Task}  %^G\n   %?\n  %a")
            ("j" "Journal" entry (file+datetree "~/Dropbox/org/journal.org")
             "* %?\nEntered on %U\n  %i\n  %a")
            ("m" "Meeting")
            ("mb" "Bibleschools" entry (file+datetree "~/Dropbox/org/clients/BibleSchools.org")
             "* %?\nEntered on %U\n  %i\n")
            ("mn" "NADE" entry (file+datetree "~/Dropbox/org/clients/NADE.org")
             "* %?\nEntered on %U\n  %i\n")
            ("mr" "Roth" entry (file+datetree "~/Dropbox/org/clients/Roth.org")
             "* %?\nEntered on %U\n  %i\n")
            ("ms" "SkillScout" entry (file+datetree "~/Dropbox/org/clients/SkillScout.org")
             "* %?\nEntered on %U\n  %i\n")
            ("mw" "SZW" entry (file+datetree "~/Dropbox/org/clients/Subzero.org")
             "* %?\nEntered on %U\n  %i\n")
            ("i" "Inbox" entry (file+datetree "~/Dropbox/org/inbox.org")
             "* %?\nEntered on %U\n  %i\n  %a")
            ("I" "Read Later" entry (file+datetree "~/Dropbox/org/inbox.org")
             "* %?\n  %i\n %c\n")
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
    (setq org-log-into-drawer 'LOGBOOK)
    ;; (setq org-clock-idle-time nil)

    ;; agenda & diary
    (setq org-agenda-include-diary t)
    (setq org-agenda-files '("~/Dropbox/org/"
                             "~/Dropbox/org/personal.org"
                             "~/Dropbox/org/technical.org"
                             "~/Dropbox/org/project.org"
                             "~/Dropbox/org/clients/"))
    (setq org-agenda-inhibit-startup t)
    (setq org-agenda-ndays 7)
    (setq org-agenda-show-all-dates t)
    (setq org-agenda-skip-deadline-if-done t)
    (setq org-agenda-skip-scheduled-if-done t)
    (setq org-agenda-start-on-weekday nil)
    (setq org-deadline-warning-days 14)

    ;; show images inline
    ;; only works in GUI, but is a nice feature to have
    (when (window-system)
      (setq org-startup-with-inline-images t))
    ;; limit images width
    (setq org-image-actual-width '(800))

    ;; Some initial langauges we want org-babel to support
    (org-babel-do-load-languages 'org-babel-load-languages
                                 '(
                                        ;(sh     . t)
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
  :pin melpa
  :config
  (add-hook 'org-mode-hook 'org-bullets-mode 1))
  ;;(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))


;; Setting the foreground color to nil causes the ellipsis to take the color of its heading.
(custom-set-faces
 '(org-ellipsis ((t (:foreground nil)))))

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

;; this exists in orgmode/contrib
;; could be installed with (use-package org-plus-contrib)
;; but it's messing with org-bullets
(use-package org-mac-link
  :ensure nil
  :after org
  :bind (:map org-mode-map
              ("C-c g" . org-mac-grab-link)))

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
              (evil-org-set-key-theme))))

;; (evil-leader/set-key-for-mode 'org-mode
;;   "." 'hydra-org-state/body
;;   "r" 'org-refile
;;   "s" 'org-schedule
;;   "d" 'org-deadline
;;   "t" 'org-todo
;;   "T" 'org-show-todo-tree
;;   "v" 'org-mark-element
;;   "a" 'org-agenda
;;   "c" 'org-archive-subtree
;;   "l" 'evil-org-open-links
;;   "C" 'org-resolve-clocks)

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

;; (use-package yankpad
;;   :init
;;   (setq yankpad-file (concat org-directory "/yankpad.org"))
;;   :bind
;;   ([f7]  . yankpad-map)
;;   ([f12] . yankpad-expand)
;;   :config
;;   ;; If you want to expand snippets with hippie-expand
;;   (add-to-list 'hippie-expand-try-functions-list #'yankpad-expand))

;; org mode
;; https://github.com/Somelauw/evil-org-mode
(use-package evil-org
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

;; might be useful inside org-mode, we'll see
;; (evil-leader/set-key-for-mode 'org-mode
;;   "A" 'org-archive-subtree
;;   "a" 'org-agenda
;;   "c" 'org-capture
;;   "d" 'org-deadline
;;   "l" 'evil-org-open-links
;;   "s" 'org-schedule
;;   "t" 'org-todo)

(provide 'orgmode)
;;; orgmode.el ends here

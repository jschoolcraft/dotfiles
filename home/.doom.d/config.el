;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Jeff Schoolcraft"
      user-mail-address "jeffrey.schoolcraft@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq
 doom-font (font-spec :family "Fira Code" :size 18)
 doom-big-font (font-spec :family "Fira Code" :size 24)
 doom-variable-pitch-font (font-spec :family "Overpass" :size 18))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)
(setq doom-theme 'doom-dark+)

;; Make the dealay for which-key a little more bearable
;; You could alternatively set which-key-idle-delay to 0.5 and which-key-idle-secondary-delay to 0.2
;; going too low could cause problems with which-key doing work it doesn't need to do
(setq
 which-key-idle-delay 0.5
 which-key-idle-secondary-delay 0.2)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq
 org-directory "~/Dropbox/org/"
 org-default-notes-file (concat org-directory "/notes.org")
 work-org (concat org-directory "octopi.org")
 org-agenda-files (list org-directory)
 org-agenda-skip-scheduled-if-done t
 org-ellipsis " ▾ "
 org-tags-column -80
 org-log-done 'time
 org-todo-keywords '((sequence "TODO(t)"  "|" "DONE(d)")
                     (sequence "WAITING(w@/!)" "|" "CANCELLED(c@/!)"))
 )

(after! org
  (add-to-list 'org-modules 'org-checklist 'org-habit)
  (setq
   ;; Don't indent org-mode files. This will make the buffer look more
   ;; prose-like than code-like.
   org-startup-indented nil
   org-indent-mode nil

   ;; Keep 1 blank line after collapsed list elements. Let them breathe.
   org-cycle-separator-lines 1

   ;; Images:
   org-startup-with-inline-images t     ; Load images by default
   mm-inline-large-images t             ; Resize very large images
   )

  ;; Capture templates
  ;; reference: https://orgmode.org/manual/Template-elements.html#Template-elements

  ;; nil the original list and start over
  (setq org-capture-templates '())

  ;; Personal Stuff

  (add-to-list 'org-capture-templates
               '("t" "Personal todo" entry
                  (file+headline +org-capture-todo-file "Inbox")
                  "* [ ] %?\n%i\n%a" :prepend t))
  (add-to-list 'org-capture-templates
               '("n" "Personal notes" entry
                 (file+headline +org-capture-notes-file "Inbox")
                 "* %u %?\n%i\n%a" :prepend t))
  (add-to-list 'org-capture-templates
               '("j" "Journal" entry
                 (file+olp+datetree +org-capture-journal-file)
                 "* %U %?\n%i\n%a" :prepend t))

  ;; General Code Stuff
  (add-to-list 'org-capture-templates
               '("p" "Templates for projects"))

  (add-to-list 'org-capture-templates
               '("pt" "Project-local todo" entry
                 (file +org-capture-project-todo-file)
                 "* TODO %?\n%i\n%a"))

  (add-to-list 'org-capture-templates
               '("pi" "Project-local idea" entry
                 (file+headline +org-capture-project-todo-file "Ideas")
                 "** %? %u\n%i\n%a"))

  ;; Octopi stuff
  (add-to-list 'org-capture-templates
               '("o" "Octopi"))

  ;; Retrospective Notes
  (add-to-list 'org-capture-templates
               '("or" "Retrospective Notes" entry (file+olp+datetree work-org "Retrospective")
                 "* %?"
                 :kill-buffer t))

  ;; 1:1 notes
  (add-to-list 'org-capture-templates
               '("o1" "1:1 Notes"))

  (add-to-list 'org-capture-templates
               '("o1g" "1:1 Notes Guille" entry (file+olp+datetree work-org "1:1" "Guille")
                 "* %?"
                 :kill-buffer t))

  (add-to-list 'org-capture-templates
               '("o1l" "1:1 Notes Luc" entry (file+olp+datetree work-org "1:1" "Luc")
                 "* %?"
                 :kill-buffer t))

  ;; Daily notes
  (add-to-list 'org-capture-templates
               '("od" "Daily Notes" entry (file+olp+datetree work-org "Daily Notes")
                 "* %U %?"
                 :kill-buffer t))

  ;; Glossary
  (add-to-list 'org-capture-templates
               '("og" "Glossary" entry (file+headline work-org "Glossary")
                 "* %^{Term}\n\t%?"
                 :kill-buffer t))

  ;; Bragging
  (add-to-list 'org-capture-templates
               '("ob" "Bragging" entry (file+headline work-org "Bragging")
                 "* %U %?"
                 :kill-buffer t))

  )

(use-package! org-super-agenda
  :after org-agenda
  (org-super-agenda-mode)
  :init
  (setq org-super-agenda-header-map nil)
  (setq org-super-agenda-groups '((:name "Today"
                                   :time-grid t
                                   :scheduled today)
                                  (:name "Due Today"
                                   :deadline today)
                                  (:name "Overdue"
                                   :deadline past)
                                  (:name "Due soon"
                                   :deadline future))))

;; org roam
;; (setq org-roam-directory "~/Dropbox/org/")

 (use-package! org-fancy-priorities
; :ensure t
  :hook
  (org-mode . org-fancy-priorities-mode)
  :config
   (setq org-fancy-priorities-list '("⚡" "⬆" "⬇" "☕")))

(setq
 deft-extensions '("txt" "tex" "org" "md")
 deft-use-filename-as-title t
 deft-directory "~/Dropbox/jschoolcraft/notes")

(after! ruby
  (add-to-list 'hs-special-modes-alist
               `(ruby-mode
                 ,(rx (or "def" "class" "module" "do" "{" "[")) ; Block start
                 ,(rx (or "}" "]" "end"))                       ; Block end
                 ,(rx (or "#" "=begin"))                        ; Comment start
                 ruby-forward-sexp nil)))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; Try to make emacs open full screen
;;(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;; disable autosave
(setq auto-save-default nil
      auto-save-visited-mode nil)

;; undo
(setq undo-limit 80000000
      evil-want-fine-undo t)

;; whitespace
;;   I realize this isn't the "doom" way but seriously,
;;   fuck all whitespace
(setq show-trailing-whitespace t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(map!
 (:after evil
  ;; make window movement similar to vim
  :en "C-h"   #'evil-window-left
  :en "C-j"   #'evil-window-down
  :en "C-k"   #'evil-window-up
  :en "C-l"   #'evil-window-right))

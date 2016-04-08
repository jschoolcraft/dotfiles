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

(require 'org-install)
(require 'ob-tangle)

; Some initial langauges we want org-babel to support
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (sh . t)
   (python . t)
   (ruby . t)
   (dot . t)
   (sqlite . t)
   (perl . t)
   ))

(provide 'orgmode)
;;; orgmode.el ends here

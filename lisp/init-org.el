
;;  __   __   __            __   __   ___
;; /  \ |__) / _` __  |\/| /  \ |  \ |__
;; \__/ |  \ \__>     |  | \__/ |__/ |___
;; Org-mode Related Setting
;; ===================================================================
;; Enable Code Block Syntax Highlight
(require 'org)
(setq org-src-fontify-natively 1)

;; Enable Org-indent-mode
(add-hook 'org-mode-hook 'org-indent-mode)

;; Set Org-mode Agenda File
(setq org-agenda-files '("~/org"))

;; Change Heading Size
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:inherit outline-1 :height 1.0))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.0))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.0)))))

;; Set Org-mode Image width-max
;; (setq org-image-actual-width 300)
;; Always resize inline image to 300 pixels
(setq org-image-actual-width '(300))
;; If there is a #+ATTR.*: width="200", resize to 200; Otherwise resize to 300
;; (setq org-image-actual-width nil)
;; If there is a #+ATTR.*: width="200", resize to 200; Otherwise do not resize

;; Org Template
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/GTD.org" "Inbox")
	 "* TODO [#B] %?\n  %i\n"
	 :empty-lines 1)))

;; Org Agendar Custome Command
;; ("H" "Context Lists"
;;  ((agendar)
;;   (tags-todo "OFFICE")
;;   (tags-todo "HOME")
;;   (tags-todo "READING")))


;; Set ToDos Type
(setq org-todo-keywords
      '((sequence "TODO" "STARTED" "WAITING" "DONE")))
(setq org-agenda-include-diary 1)
(setq org-agenda-include-all-todo 1)

;; Org-Refile
(setq org-refile-targets (list (cons nil (cons :maxlevel 2))))

;; Start Emacs with Agenda View
;; (org-agenda-list)
;; Start Emacs with GTD List
(find-file "~/org/GTD.org")

;; Add Python Org-babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . 1)))

(provide 'init-org)

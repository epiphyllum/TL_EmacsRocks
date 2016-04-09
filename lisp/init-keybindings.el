;;       ___
;; |__/ |__  \ /
;; |  \ |___  |
;;  __          __          __
;; |__) | |\ | |  \ | |\ | / _`
;; |__) | | \| |__/ | | \| \__>
;; Key Binding
;; ===================================================================
;; Quick Open Config File (init.el)
(global-set-key (kbd "<f2>") 'open-init-file)

;; Open Recent Files List
;; (global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; Better Find Definition for Vairbale, Function and Key Binding
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; Swiper
;; -------------------------------------------------------------------
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)

;; Counsel
;; -------------------------------------------------------------------
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; Deft
;; -------------------------------------------------------------------
(global-set-key (kbd "<f8>") 'deft)

;; Org-mode Related Key Binding
;; -------------------------------------------------------------------
;; Org mode agenda vide default key binding
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c b") 'org-iswitchb)

(provide 'init-keybindings)

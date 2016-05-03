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

;; Backward Delete One Word
(global-set-key (kbd "C-w") 'backward-kill-word)

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
(global-set-key (kbd "C-c p f") 'counsel-git)

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
(global-set-key (kbd "C-c r") 'org-capture)

;; Code Indentation
;; -------------------------------------------------------------------
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;; Hippie Expand
;; -------------------------------------------------------------------
(global-set-key (kbd "s-/") 'hippie-expand)

;; js2-refactor
;; -------------------------------------------------------------------
(js2r-add-keybindings-with-prefix "C-c C-m")

;; Occur Mode
;; -------------------------------------------------------------------
(global-set-key (kbd "M-s o") 'occur-dwi)

;; iMenu Mode
;; -------------------------------------------------------------------
(global-set-key (kbd "M-s i") 'counsel-imenu)

;; expand-region
;; -------------------------------------------------------------------
(global-set-key (kbd "C-=") 'er/expand-region)

;; iEdit Mode
;; -------------------------------------------------------------------
(global-set-key (kbd "M-s e") 'iedit-mode)

;; helm-ag
;; -------------------------------------------------------------------
(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)

;; Neotree
;; -------------------------------------------------------------------
(global-set-key (kbd "C-\\") 'neotree-toggle)

;; Evil
;; -------------------------------------------------------------------
(define-key evil-insert-state-map [escape] 'evil-normal-state)

(provide 'init-keybindings)

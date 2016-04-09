

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Package Management
;; -----------------------------------------------------------------
(require 'init-packages)

;;  ___  __    ___  __   __
;; |__  |  \ |  |  /  \ |__)
;; |___ |__/ |  |  \__/ |  \
;;  __   ___  ___                ___
;; |  \ |__  |__   /\  |  | |     |
;; |__/ |___ |    /~~\ \__/ |___  |
;; Better Default
;; ==================================================================
;; Disable Backup File
(setq make-backup-files nil)
;; Regular Replace Selection Behavior
(delete-selection-mode 1)
;; Auto Parenthesis Matching
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;; Enable Recent Files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
;; Load Editor Theme
(load-theme 'solarized-dark 1)
;; (load-theme 'solarized-light 1)

;;       __   __   ___       __             __   ___
;;  /\  |__) |__) |__   /\  |__)  /\  |\ | /  ` |__
;; /~~\ |    |    |___ /~~\ |  \ /~~\ | \| \__, |___
;; Appearance Related Setting
;; ===================================================================
;; Hide Startup screen
(setq inhibit-splash-screen 1)
;; Default Full-screen Mode
;; (setq initial-frame-alist (quote ((fullscreen . maximized))))
;; Hide menu bar
(tool-bar-mode -1)
;; Hide scroll bar
(scroll-bar-mode -1)
;; Highlight Current Line
(global-hl-line-mode 1)
;; Show line number
(global-linum-mode 1)
;; Change cursor style
(setq-default cursor-type 'bar)
;; Change Font-size
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 150)



;;       ___       __   ___  __
;; |__| |__  |    |__) |__  |__)
;; |  | |___ |___ |    |___ |  \
;;  ___            __  ___    __
;; |__  |  | |\ | /  `  |  | /  \ |\ |
;; |    \__/ | \| \__,  |  | \__/ | \|
;; Helper Functions
;; ===================================================================
;; Open Config Files (init.el)
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

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

;; Set ToDos Type
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.1)
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(org-startup-truncated nil)
 '(package-selected-packages (quote (company))))


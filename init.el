(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (add-to-list 'package-archives '("melpa" . "http://melpRETa.org/packages/") t)
    )

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar xinyang/packages '(
			   ;; --- Auto-completion ---
			   company
			   ;; --- Better Editor ---
			   hungry-delete
			   swiper
			   counsel
			   smartparens
			   ;; --- Major Mode ---
			   js2-mode
			   ;; --- Minor Mode ---
			   nodejs-repl
			   exec-path-from-shell
			   ;; --- Themes ---
			   ;; monokai-theme
			   solarized-theme
			   ) "Default packages")

(setq package-selected-packages xinyang/packages)
(defun xinyang/packages-installed-p ()
    (loop for pkg in xinyang/packages
          when (not (package-installed-p pkg)) do (return nil)
          finally (return t)))
(unless (xinyang/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg xinyang/packages)
      (when (not (package-installed-p pkg))
        (package-install pkg))))
;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


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
(load-theme 'solarized-light 1)


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


;; Package Related Setting
;; ===================================================================

;; Company Mode
;; -------------------------------------------------------------------
;; Enable global company mode
(global-company-mode t)

;; Hungry-delete
;; -------------------------------------------------------------------
;; Enable global hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode 1)

;; Smartparens
;; -------------------------------------------------------------------
(require 'smartparens-config)
(smartparens-global-mode 1)

;; Ivy-mode
;; -------------------------------------------------------------------
(ivy-mode 1)
(setq ivy-use-virtual-buffers 1)


;; js2-mode
;; -------------------------------------------------------------------
;; Enable js2-mode for JavaScript File
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;; Help Functions
;; ===================================================================
;; Open Config Files (init.el)
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))


;; Key Binding
;; ===================================================================
;; Quick Open Config File (init.el)
;; TODO: <f2> DOES NOT WORK
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

;; Org-mode Related Key Binding
;; -------------------------------------------------------------------
(global-set-key (kbd "C-c a") 'org-agenda)


;; Org-mode Related Setting
;; ===================================================================
;; Enable Code Block Syntax Highlight
(require 'org)
(setq org-src-fontify-natively 1)

;; Set Org-mode Agenda File
(setq org-agenda-files '("~/org"))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

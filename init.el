;;  __        __             __   ___
;; |__)  /\  /  ` |__/  /\  / _` |__
;; |    /~~\ \__, |  \ /~~\ \__> |___
;;                      __   ___        ___      ___
;; |\/|  /\  |\ |  /\  / _` |__   |\/| |__  |\ |  |
;; |  | /~~\ | \| /~~\ \__> |___  |  | |___ | \|  |
(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") 1))

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
			   markdown-mode
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
          finally (return 1)))

(unless (xinyang/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg xinyang/packages)
      (when (not (package-installed-p pkg))
        (package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

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
(set-face-attribute 'default nil :height 160)

;;  __        __             __   ___
;; |__)  /\  /  ` |__/  /\  / _` |__
;; |    /~~\ \__, |  \ /~~\ \__> |___
;;  __   ___ ___ ___         __
;; /__` |__   |   |  | |\ | / _`
;; .__/ |___  |   |  | | \| \__>
;; Package Related Setting
;; ===================================================================

;; Company Mode
;; -------------------------------------------------------------------
;; Enable global company mode
(global-company-mode 1)

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

;; markdown-mode
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

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

;; Org-mode Related Key Binding
;; -------------------------------------------------------------------
(global-set-key (kbd "C-c a") 'org-agenda)


;;  __   __   __            __   __   ___
;; /  \ |__) / _` __  |\/| /  \ |  \ |__
;; \__/ |  \ \__>     |  | \__/ |__/ |___
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
 '(company-idle-delay 0.1)
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-selected-packages (quote (company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

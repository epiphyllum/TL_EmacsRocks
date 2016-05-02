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
			   smooth-scrolling
			   hungry-delete
			   swiper
			   counsel
			   smartparens
			   popwin
			   ;; --- Major Mode ---
			   js2-mode
			   markdown-mode
			   web-mode
			   ;; --- Minor Mode ---
			   ;; Quick Note Taking
			   deft
			   ;; JavaScript REPL
			   nodejs-repl
			   ;; JavaScript Refactor Tool
			   js2-refactor
			   ;; Find OS X Executable Helper Package
			   exec-path-from-shell
			   ;; Quick Region Selection
			   expand-region
			   ;; Quick Search ag
			   helm-ag
			   ;; neotree tree plugin like NerdTree for Vim
			   neotree
			   ;; YASnippet, A template system for Emacs
			   yasnippet
			   ;; emment-mode
			   emmet-mode
			   ;; Pomodoro
			   org-pomodoro
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

;;  __        __             __   ___
;; |__)  /\  /  ` |__/  /\  / _` |__
;; |    /~~\ \__, |  \ /~~\ \__> |___
;;  __   ___ ___ ___         __
;; /__` |__   |   |  | |\ | / _`
;; .__/ |___  |   |  | | \| \__>
;; Package Related Setting
;; ===================================================================

;; Match file type to Major Modes
;; -------------------------------------------------------------------
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))    ;; *.js   -> js2-mode
       '(("\\.html\\'" . web-mode))  ;; *.html -> web-mode
       '(("\\.hbs\\'" . web-mode))   ;; *.hbs  -> web-mode
       auto-mode-alist))

;; Company Mode
;; -------------------------------------------------------------------
;; Enable global company mode
(global-company-mode 1)
(setq company-dabbrev-downcase nil)

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

;; Deft
;; -------------------------------------------------------------------
;; Set default Deft note file type
(setq deft-extensions '("md" "org" "txt" "tex"))
(setq deft-directory "~/.deft/")

;; js2-mode
;; -------------------------------------------------------------------
;; Enable js2-mode for JavaScript File

;; js2-refactor
;; -------------------------------------------------------------------
(add-hook 'js2-mode-hook #'js2-refactor-mode)

;; web-mode
;; -------------------------------------------------------------------
;; Set web-mode code indentations
(defun my-web-mode-indent-setup()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

;; markdown-mode
;; -------------------------------------------------------------------
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" 1)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; popwin
;; -------------------------------------------------------------------
(require 'popwin)
(popwin-mode 1)

;; yasnippet
;; -------------------------------------------------------------------
;; (yas-reload-all)
;; (add-hook 'prog-mode-hook #'yas-minor-mode)

(provide 'init-packages)

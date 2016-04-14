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

;; Disable Auto-save File
(setq auto-save-default nil)

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

;; Disable Warning Bell
(setq ring-bell-function 'ignore)

;; Auto Reload File
(global-auto-revert-mode 1)

;; Set Short Cut for (yes-or-no)
(fset 'yes-or-no-p 'y-or-n-p)

;; Abbreviation Mode and Setting
(abbrev-mode 1)
(define-abbrev-table 'global-abbrev-table '(
					    ("3lxy" "li-xinyang")
					    ))

;; Hippie Complete Function Lists
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))

;; Better Dired Mode
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

(put 'dired-find-alternate-file 'disabled nil)

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(require 'dired-x)
(setq dired-dwim-target 1)

(provide 'init-better-defaults)

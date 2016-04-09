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

(provide 'init-better-defaults)

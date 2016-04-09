;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Package Management
;; -----------------------------------------------------------------
(require 'init-packages)

;; Helper Functions
;; -----------------------------------------------------------------
(require 'init-helper)

;; UI Related
;; -----------------------------------------------------------------
(require 'init-ui)

;; Better Editor Default
;; -----------------------------------------------------------------
(require 'init-better-defaults)

;; Keybindings
;; -----------------------------------------------------------------
(require 'init-keybindings)

;; Org
;; -----------------------------------------------------------------
(require 'org)

;; Custom
;; -----------------------------------------------------------------
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)

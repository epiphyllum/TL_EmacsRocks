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

(provide 'init-ui)

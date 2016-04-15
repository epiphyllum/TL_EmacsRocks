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

;; Code Indent
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer. "
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region."))
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))

(provide 'init-helper)

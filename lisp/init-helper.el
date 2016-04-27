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

;; Hide ^M Char
(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

;; Delete ^M Char
(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with UNIX eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil 1) (replace-match "")))

;; Change web-mode indent level btween 2 and 4
(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
        (setq js-indent-level (if (= js-indent-level 2) 4 2))
        (setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))

  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
             (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
             (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))

  (setq indent-tabs-mode nil))

(provide 'init-helper)

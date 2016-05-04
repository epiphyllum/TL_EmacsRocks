(package-initialize)

(require 'org-install)
(require 'ob-tangle)
(org-babel-load-file (expand-file-name "xy-emacs-config.org" user-emacs-directory))

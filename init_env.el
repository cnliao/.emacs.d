
;; add necessary path
(setq tmp-path-to-add "/Library/Tex/texbin:/User/cnliao/anaconda3/bin:/usr/local/bin:")
(setenv "PATH" (concat tmp-path-to-add (getenv "PATH")))
(setq exec-path (append (split-string tmp-path-to-add ":") exec-path))
(add-to-list 'load-path "/usr/local/Cellar/mu/0.9.16/share/emacs/site-lisp/mu/mu4e")
;;packager settings
(require 'package)
(add-to-list
 'package-archives
 '("melpa" . "http://melpa.org/packages/")
 t)
(package-initialize)
(setq package-enable-at-startup nil)


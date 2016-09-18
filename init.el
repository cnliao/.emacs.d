
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)
;; (profiler-start 'cpu)
(load "~/.emacs.d/init_env.el")
(load "~/.emacs.d/init_mode.el")
(load "~/.emacs.d/init_mail.el")
(load "~/.emacs.d/init_keybinding.el")
(load "~/.emacs.d/init_appearance.el")
(load "~/.emacs.d/init_misc.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/Nutstore/sync/note/all.org")))
 '(package-selected-packages
   (quote
    (esup rtags rich-minority pdf-tools ido-vertical-mode flycheck fill-column-indicator evil disaster company-irony company-auctex auto-complete))))
;; (profiler-report)
;; (profiler-stop)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

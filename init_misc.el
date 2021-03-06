;; Dired mode
(require 'dired-x)
(setq-default dired-omit-files-p t)

;; indent with spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; Recentf mode
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;; Start up
(setq inhibit-startup-message t)
(toggle-frame-fullscreen)
(recentf-open-files)
(server-start)

(load-theme 'leuven t nil)

;; Misc bar mode
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)

(rich-minority-mode 1)
(setq rm-whitelist "NOTHING") ;; "NOTHING" is just a regexp that match nothing.

;; fringe on graphical display
(fringe-mode (cdr (assoc "right-only" fringe-styles)))
(set-face-attribute 'fringe nil :background "gray100" :foreground "gray50")

;; window seperator on terminal display
(set-face-attribute 'vertical-border nil
                    :inherit 'mode-line-inactive
                    :background "tan2"
                    :distant-foreground "firebrick2"
                    :foreground "gray0")

;; set default font
(add-to-list 'default-frame-alist
             '(font . "PT Mono-17"))
;; ;; "han" script should be larger to have double width as "english" script.
;; ;; Following is the ad-hoc correspondence in pixel-width, stolen from
;; ;; http://coldnew.github.io/blog/2013/11-16_d2f3a
;; (defvar emacs-font-size-pair-list
;;   '(( 5 .  6) (10 . 12)
;;     (13 . 16) (15 . 18) (17 . 20)
;;     (19 . 22) (20 . 24) (21 . 26)
;;     (24 . 28) (26 . 32) (28 . 34)
;;     (30 . 36) (34 . 40) (36 . 44))
;;   "This list is used to store matching (english . chinese) font-size.")
(set-fontset-font t 'han
                  (font-spec :family "PingFang SC" :size 20))

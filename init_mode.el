(evil-mode)

;; TRAMP
;; This session must come before Rtags
;; defvar for this variable (in tramp-loaddefs.el) causes a 30-sec hung at loading 'tramp (which 'rtags requires).
(setq tramp-ssh-controlmaster-options
      (concat
       "-o ControlMaster=auto "
       "-o ControlPath=/tmp/ssh-ControlPath-%%r@%%h:%%p "
       "-o ControlMaster=auto -o ControlPersist=yes "))
(setq tramp-copy-size-limit nil)

;; Rtags
(setq rtags-path "~/.emacs.d/rtags/bin")
(rtags-start-process-unless-running)
(setq rtags-autostart-diagnostics t)
(rtags-diagnostics)
(setq rtags-rc-log-enabled t)
;; (setq rtags-completions-enabled t)
(rtags-enable-standard-keybindings c-mode-base-map "\C-xr")
(require 'flycheck-rtags)

;; Flycheck
(defun my-flycheck-rtags-setup ()
  (flycheck-mode)
  (flycheck-select-checker 'rtags)
  (setq-local flycheck-highlighting-mode nil) ;; RTags creates more accurate overlays.
  (setq-local flycheck-check-syntax-automatically nil))
(add-hook 'c-mode-common-hook #'my-flycheck-rtags-setup)

;; ;; Irony mode
;; (setq irony-server-install-prefix "/usr/local/opt/irony-mode/bin")
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(with-eval-after-load 'company
  (push 'company-irony company-backends))

;; Company mode
(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 2)
(add-hook 'c++-mode-hook 'company-mode)
(add-hook 'c-mode-hook 'company-mode)
(add-hook 'emacs-lisp-mode-hook 'company-mode)
(add-hook 'LaTeX-mode-hook 'company-mode)

;; Ido mode
(require 'ido)
(ido-mode t)
(ido-vertical-mode 1)

;; ;; fill-column-indicator
;; (setq-default fci-rule-column 80)
;; (setq-default fci-rule-color "LightBlue1")
;; (setq fci-handle-truncate-lines nil)
;; (setq fci-handle-line-move-visual nil)
;; (defun auto-fci-mode-do ()
;;   (if (> (window-width) fci-rule-column) 
;;       (fci-mode 1) 
;;     (fci-mode 0)))
;; (defun auto-fci-mode ()
;;   (add-hook 'window-configuration-change-hook 'auto-fci-mode-do))
;; (add-hook 'c++-mode-hook 'auto-fci-mode)
;; (add-hook 'python-mode-hook 'auto-fci-mode)

;; Python mode
(setq python-shell-interpreter "/Users/cnliao/anaconda3/bin/ipython")
(setq python-shell-interpreter-args "--simple-prompt --pylab='osx'")
(defun my-python-mode-conf ()
  (setq truncate-lines 1))
(add-hook 'python-mode-hook 'my-python-mode-conf)
;; necessary for python cell to use utf-8
(setenv "LC_CTYPE" "UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LANG" "en_US.UTF-8")

;; C mode
(defun my-c-mode-conf ()
  (local-set-key (kbd "C-c c") 'compile)
  (setq truncate-lines 1))
(add-hook 'c-mode-common-hook 'my-c-mode-conf)

;; Disaster - Disassembler
(setq disaster-objdump "gobjdump -d -M att -Sl --no-show-raw-insn")
(define-key c-mode-base-map (kbd "C-c d") 'disaster)

;; Ispell
(setq ispell-program-name "hunspell")
(setq ispell-local-dictionary "en_US")

;; AucTex
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(defun my-LaTeX-conf ()
  (turn-on-reftex)
  (flyspell-mode)
  (LaTeX-math-mode)
  (visual-line-mode)
  (setq-local line-move-visual t)
  (setq-local TeX-electric-math (cons "$" "$"))
  (setq-local LaTeX-electric-left-right-brace t)
  (with-eval-after-load 'company
    (push 'company-auctex 'company-backends)))
(add-hook 'LaTeX-mode-hook 'my-LaTeX-conf)

;; ;; pdf-tools
;; (require 'pdf-tools)
;; (setq pdf-info-epdfinfo-program "/usr/local/bin/epdfinfo")
;; (pdf-tools-install)
;; (defun my-pdf-tools-latex-mode-conf ()
;;   (unless (assoc "PDF Tools" TeX-view-program-list-builtin)
;;     (push '("PDF Tools" TeX-pdf-tools-sync-view) TeX-view-program-list))
;;   (add-to-list 'TeX-view-program-selection '(output-pdf "PDF Tools"))
;;   (add-hook 'TeX-after-compilation-finished-functions
;; 	    #'TeX-revert-document-buffer)
;;   (TeX-source-correlate-mode))
;; (add-hook 'LaTeX-mode-hook 'my-pdf-tools-latex-mode-conf)

;; Org mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))


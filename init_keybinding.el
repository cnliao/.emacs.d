;; Global key-bindings
(global-set-key (kbd "<f9>") 'other-window)
(fset 'otherbuffer
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([24 98 return] 0 "%d")) arg)))
(global-set-key (kbd "<f8>") 'otherbuffer)
;; (global-set-key (kbd "<f8>")
;;                 (lambda () (interactive)
;;                   (switch-to-buffer (other-buffer (current-buffer) 1))))
;; (global-set-key (kbd "<f8>") 'ido-switch-buffer)
(global-set-key (kbd "<s-f9>") 'toggle-frame-maximized)
(global-set-key (kbd "<C-s-268632070>") 'toggle-frame-fullscreen)
(global-set-key (kbd "<C-s-268632093>") 'enlarge-window-horizontally) ;C-s-]
(global-set-key (kbd "<C-s-268632091>") 'shrink-window-horizontally) ;C-s-[
(global-set-key (kbd "C-x 3")
                (lambda () (interactive) (split-window-right 80)))
(global-set-key (kbd "s-=") 'text-scale-increase)
(global-set-key (kbd "s--") 'text-scale-decrease)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

(defun my-frame-decrement-font-size ()
  (set-face-attribute 'default nil :height (- (face-attribute 'default :height nil) 10)))
(defun my-frame-increment-font-size ()
  (set-face-attribute 'default nil :height (+ (face-attribute 'default :height nil) 10)))

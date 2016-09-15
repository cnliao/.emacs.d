(require 'mu4e)
(setq mu4e-maildir "~/.Mail")
(setq mu4e-attachment-dir  "~/Downloads")
(setq mu4e-drafts-folder "/loc/Drafts")
(setq mu4e-sent-folder   "/loc/Sent")
(setq mu4e-trash-folder  "/loc/Trash")
(setq mu4e-get-mail-command "true")
(setq mu4e-view-show-addresses t)
(setq mu4e-user-mail-address-list
      '("liaochongning@pku.edu.cn"
        "1301210051@pku.edu.cn"
        "00946162@pku.edu.cn"
        "stillsmil@gmail.com"
        "stillsmilmj1@gmail.com"))

(setq mu4e-compose-dont-reply-to-self nil)
(setq mu4e-headers-results-limit -1) 

(add-to-list 'mu4e-view-actions
  '("ViewInBrowser" . mu4e-action-view-in-browser) t)
(setq browse-url-browser-function 'browse-url-chromium)
(setq browse-url-chromium-program "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome")

"
Logic for context: If there is a message then it is in some maildir, so the send method can be properly deduced. If msg not yet present then ask me anyway.
"
(setq
 mu4e-context-policy 'ask ;; 
 mu4e-compose-context-policy 'ask
 mu4e-contexts
      `(,(make-mu4e-context
          :name "pku"
          :enter-func (lambda () (mu4e-message "Entering context:pku."))
          :match-func (lambda (msg)
                        (when msg
                          (string-match "^/pku/" (mu4e-message-field-at-point :maildir))))
          :vars '((user-mail-address . "liaochongning@pku.edu.cn")
                  (message-sendmail-envelope-from . "liaochongning@pku.edu.cn")
                  (user-full-name . "Chongning Liao")
                  (mu4e-compose-signature
                   . (concat
                      "Liao Chongning\n"
                      "Department of Scientific and Engineering Computing,\n"
                      "School of Mathematics,\n"
                      "Peking University."))
                  (mu4e-sent-messages-behavior . sent)
                  (mu4e-sent-folder . "/pku/Sent Items")
                  (mu4e-drafts-folder . "/pku/Drafts")))
        ,(make-mu4e-context
          :name "stillsmil"
          :enter-func (lambda () (mu4e-message "Entering context:stillsmil."))
          :match-func (lambda (msg)
                        (when msg
                          (string-match "^/stillsmil/" (mu4e-message-field-at-point :maildir))))
          :vars '((user-mail-address . "stillsmil@gmail.com")
                  (message-sendmail-envelope-from . "stillsmil@gmail.com")
                  (user-full-name . "Chongning Liao")
                  (mu4e-sent-messages-behavior . delete)
                  (mu4e-drafts-folder . "/loc/Drafts")))
        ,(make-mu4e-context
          :name "stillsmilmj1"
          :enter-func (lambda () (mu4e-message "Entering context:stillsmilmj1."))
          :match-func (lambda (msg)
                        (when msg
                          (string-match "^/stillsmilmj1/" (mu4e-message-field-at-point :maildir))))
          :vars '((user-mail-address . "stillsmilmj1@gmail.com")
                  (message-sendmail-envelope-from . "stillsmilmj1@gmail.com")
                  (user-full-name . "stillsmilmj1")
                  (mu4e-sent-messages-behavior . delete)
                  (mu4e-drafts-folder . "/loc/Drafts")))))


(setq message-send-mail-function 'message-send-mail-with-sendmail)
(setq message-sendmail-f-is-evil nil)
(setq message-sendmail-envelope-from user-mail-address)
(setq sendmail-program "/usr/local/bin/msmtp")
;; msmtp accepts then ignores -ox[x] options used by sendmail. Resulting call
;; becomes:
;; $ msmtp message-sendmail-extra-arguments -f=message-sendmail-envelope-from  -t
(setq message-kill-buffer-on-exit t)

"
display-time-string-forms: a list of expression controling what to show on modeline and how. Usually default is very robust.
read-mail-command: function to run when clicking on new mail indicator
display-time-update: calls display-time-mail-function if not-nil else check display-time-mail-directory else try to look at the mail spool
display-time-mail-function: should return t if new mail exists and nil otherwise
display-time-mail-directory:
"
(setq display-time-24hr-format t)
(setq display-time-string-forms
      '((if (and (not display-time-format) display-time-day-and-date)
            (format-time-string "%a %b %e " now)
          "")
        (propertize
         (format-time-string (or display-time-format
                                 (if display-time-24hr-format "%H:%M" "%-I:%M%p"))
                             now)
         'help-echo (format-time-string "%a %b %e, %Y" now))
        load
        (if mail
            (concat
             " "
             (propertize
              display-time-mail-string
              'display `(when (and display-time-use-mail-icon
                                   (display-graphic-p))
                          ,@display-time-mail-icon
                          ,@(if (and display-time-mail-face
                                     (memq (plist-get (cdr display-time-mail-icon)
                                                      :type)
                                           '(pbm xbm)))
                                (let ((bg (face-attribute display-time-mail-face
                                                          :background)))
                                  (if (stringp bg)
                                      (list :background bg)))))
              'face display-time-mail-face
              'help-echo "You have new mail; mouse-1: Read mail"
              'mouse-face 'mode-line-highlight
              'local-map (make-mode-line-mouse-map 'mouse-1
                                                   read-mail-command)))
          "")))
(setq display-time-mail-directory "~/.Mail/newmail")
(setq display-time-default-load-average nil)
(setq display-time-interval 30)
(setq read-mail-command 'mu4e)
(setq mail-user-agent 'mu4e-user-agent)
(display-time-mode)

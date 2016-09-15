(require 'mu4e)
(setq mu4e-maildir "~/.Mail")
(setq mu4e-attachment-dir  "~/Downloads")
(setq mu4e-drafts-folder "/loc/Drafts")
(setq mu4e-sent-folder   "/loc/Sent Mail")
(setq mu4e-trash-folder  "/loc/Trash")
(setq mu4e-get-mail-command "offlineimap")

(setq mu4e-compose-dont-reply-to-self t)
(setq mu4e-headers-results-limi]t -1) 

(setq mu4e-user-mail-address-list
      '("liaochongning@pku.edu.cn"
        "1301210051@pku.edu.cn"
        "00946162@pku.edu.cn"
        "stillsmil@gmail.com"
        "stillsmilmj1@gmail.com"))

(setq
 mu4e-context-policy 'ask-if-none
 mu4e-compose-context-policy 'ask-if-none
 mu4e-contexts
      `(,(make-mu4e-context
          :name "pku"
          :enter-func (lambda () (mu4e-message "Entering context:pku."))
          :match-func (lambda (msg)
                        (when msg
                          (mu4e-message-contact-field-matches
                           msg :to
                           '("liaochongning@pku.edu.cn"
                             "1301210051@pku.edu.cn"))))
          :vars '((user-mail-address . "liaochongning@pku.edu.cn")
                  (message-sendmail-envelope-from . "liaochongning@pku.edu.cn")
                  (user-full-name . "Chongning Liao")
                  (mu4e-compose-signature
                   . (concat
                      "Liao Chongning\n"
                      "Department of Scientific and Engineering Computing,\n"
                      "School of Mathematics,\n"
                      "Peking University."))
                  (mu4e-sent-messages-behavior . 'sent)
                  (mu4e-sent-folder . "/pku/Sent Items")
                  (mu4e-drafts-folder . "/pku/Drafts")))
        ,(make-mu4e-context
          :name "stillsmil"
          :enter-func (lambda () (mu4e-message "Entering context:stillsmil."))
          :match-func (lambda (msg)
                        (when msg
                          (mu4e-message-contact-field-matches
                           msg :to
                           "stillsmil@gmail.com")))
          :vars '((user-mail-address . "stillsmil@gmail.com")
                  (message-sendmail-envelope-from . "stillsmil@gmail.com")
                  (user-full-name . "Chongning Liao")
                  (mu4e-sent-messages-behavior . 'delete)
                  (mu4e-drafts-folder . "/loc/Drafts")))))

(add-to-list 'mu4e-view-actions
  '("ViewInBrowser" . mu4e-action-view-in-browser) t)
(setq browse-url-browser-function 'browse-url-chromium)
(setq browse-url-chromium-program "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome")

(setq message-sendmail-f-is-evil nil)
(setq message-sendmail-envelope-from user-mail-address)
(setq sendmail-program "/usr/local/bin/msmtp")
;; msmtp accepts then ignores -ox[x] options used by sendmail. Resulting call
;; becomes:
;; $ msmtp message-sendmail-extra-arguments -f=message-sendmail-envelope-from  -t
(setq message-kill-buffer-on-exit t)

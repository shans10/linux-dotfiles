;; Lsp show diagnostics
(map! :leader
      :desc "Show lsp flycheck diagnostics"
      "l d" #'lsp-ui-flycheck-list)

;; Show hover documentation
(map! :n "gh" #'lsp-ui-doc-glance)

;; Use jj to toggle back to normal mode from insert mode
(defun my-jk ()
  (interactive)
  (let* ((initial-key ?j)
         (final-key ?j)
         (timeout 0.7)
         (event (read-event nil nil timeout)))
    (if event
        ;; timeout met
        (if (and (characterp event) (= event final-key))
            (evil-normal-state)
          (insert initial-key)
          (push event unread-command-events))
      ;; timeout exceeded
      (insert initial-key))))

(define-key evil-insert-state-map (kbd "j") 'my-jk)

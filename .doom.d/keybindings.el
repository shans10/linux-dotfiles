;; Lsp Show Diagnostics
(map! :leader
      :desc "Show lsp flycheck diagnostics"
      "l d" #'lsp-ui-flycheck-list)

;; Run love2d
(global-set-key (kbd "M-p") (lambda () (interactive) (shell-command "love.exe .")))

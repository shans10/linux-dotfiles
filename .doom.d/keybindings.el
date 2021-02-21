;; Lsp Show Diagnostics
(map! :leader
      :desc "Show lsp flycheck diagnostics"
      "l d" #'lsp-ui-flycheck-list)

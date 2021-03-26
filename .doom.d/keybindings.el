;; Lsp show diagnostics
(map! :leader
      :desc "Show lsp flycheck diagnostics"
      "l d" #'lsp-ui-flycheck-list)

;; Show hover documentation
(map! :n "gh" #'lsp-ui-doc-glance)

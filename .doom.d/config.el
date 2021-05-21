;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "Cascadia Code" :size 13 :weight 'regular))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
; (setq doom-theme 'doom-monokai-pro)
; (if (not (display-graphic-p))
;       (setq doom-theme 'doom-monokai-pro)
(setq doom-theme 'doom-gruvbox)
(setq doom-gruvbox-dark-variant "hard")
; )

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


;;; USER SETTINGS ;;;
;; Open Emacs Maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))
; (add-hook 'window-setup-hook 'toggle-frame-maximized t)

;; Exit Emacs without vterm running process warning
(setq confirm-kill-processes nil)

;; Add space from both sides inside braces
(defun my/c-mode-insert-space (arg)
  (interactive "*P")
  (let ((prev (char-before))
        (next (char-after)))
    (self-insert-command (prefix-numeric-value arg))
    (if (and prev next
             (string-match-p "[[({]" (string prev))
             (string-match-p "[])}]" (string next)))
      (save-excursion (self-insert-command 1)))))

(defun my/c-mode-delete-space (arg &optional killp)
  (interactive "*p\nP")
  (let ((prev (char-before))
        (next (char-after))
        (pprev (char-before (- (point) 1))))
    (if (and prev next pprev
             (char-equal prev ?\s) (char-equal next ?\s)
             (string-match "[[({]" (string pprev)))
      (delete-char 1))
    (backward-delete-char-untabify arg killp)))

(add-hook 'c-mode-common-hook
          (lambda ()
            (local-set-key " " 'my/c-mode-insert-space)
            (local-set-key "\177" 'my/c-mode-delete-space)))

;; Fix doom-modeline flycheck icon out of view in emacsclient
(add-hook! 'doom-modeline-mode-hook
  (let ((char-table char-width-table))
    (while (setq char-table (char-table-parent char-table)))
    (dolist (pair doom-modeline-rhs-icons-alist)
      (let ((width 2)  ; <-- tweak this
            (chars (cdr pair))
            (table (make-char-table nil)))
        (dolist (char chars)
          (set-char-table-range table char width))
        (optimize-char-table table)
        (set-char-table-parent table char-table)
        (setq char-width-table table)))))


;;; EVIL SNIPE ;;;
(setq evil-snipe-scope 'visible)
(setq evil-snipe-repeat-scope 'whole-visible)
(setq evil-snipe-spillover-scope 'whole-buffer)


;;; FLYCHECK ;;;
;; Check syntax on idle
(after! flycheck
        (setq flycheck-check-syntax-automatically '(idle-change)))

;; Disable default fringe styling
(setq +vc-gutter-default-style nil)

;; Move flycheck to left margin
(setq-default flycheck-indication-mode 'left-fringe)


;;; LSP ;;;
;; Disable doc hover information unless key pressed
(setq lsp-ui-doc-enable nil)

;; Disable code action hints in sideline
(setq lsp-ui-sideline-show-code-actions nil)

;; Headerline Settings
; (setq lsp-headerline-breadcrumb-enable t)                           ; Enable headerline
; (setq lsp-headerline-breadcrumb-segments '(project file symbols))   ; Set segments
; (setq lsp-headerline-breadcrumb-icons-enable t)                     ; Enable Icons


;;; NEOTREE ;;;
;; Show File Icons in Neotree
(after! doom-themes
        (remove-hook 'doom-load-theme-hook #'doom-themes-neotree-config))


;;; DOOM MODELINE ;;;
;; Show major mode icon in doom modeline(filetype icon)
(setq doom-modeline-major-mode-icon t)

;; Disable code actions in doom modeline
(setq lsp-modeline-code-actions-enable nil)


;;; LOAD PACKAGES ;;;
;; Change cursor in insert mode in terminal
(use-package! evil-terminal-cursor-changer
              :hook (tty-setup . evil-terminal-cursor-changer-activate))

;;; LOAD CUSTOME FILES ;;;
;; Keybindings File
(load! "keybindings")

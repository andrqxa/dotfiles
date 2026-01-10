;; =============================
;; Go toolchain sanity checks
;; =============================
(unless (executable-find "go")
  (message "WARNING: go not found in PATH"))

(unless (executable-find "gopls")
  (message "WARNING: gopls not found in PATH"))

;; =============================
;; Go mode
;; =============================
(use-package go-mode
  :mode "\\.go\\'"
  :hook ((go-mode . eglot-ensure)
         (go-mode . my/go-mode-setup)))

(defun my/go-mode-setup ()
  ;; Canonical Go formatting on save (buffer-local)
  (add-hook 'before-save-hook #'eglot-format nil t)

  ;; Go conventions
  (setq-local indent-tabs-mode t)
  (setq-local tab-width 4)

  ;; Default compile command
  (setq-local compile-command "go test ./..."))

;; =============================
;; Go keybindings
;; =============================
(with-eval-after-load 'go-mode
  (define-key go-mode-map (kbd "C-c C-r") #'eglot-rename)
  (define-key go-mode-map (kbd "C-c C-f") #'eglot-format)
  (define-key go-mode-map (kbd "C-c C-d") #'eldoc)
  (define-key go-mode-map (kbd "C-c C-t") #'go-test-current-file)
  (define-key go-mode-map (kbd "C-c C-p") #'go-test-current-project)
  ;; Explicit completion-at-point (Lean-friendly)
  (when (eq my/profile 'lean)
    (define-key go-mode-map (kbd "C-c C-SPC") #'completion-at-point)))

(provide 'go-config)
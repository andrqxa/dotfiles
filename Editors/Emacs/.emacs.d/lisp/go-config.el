(let ((go-bin (expand-file-name "~/Projects/go/bin")))
  (when (file-directory-p go-bin)
    (add-to-list 'exec-path go-bin)
    (setenv "PATH" (concat go-bin ":" (getenv "PATH")))))


;; -----------------------------
;; Go mode
;; -----------------------------
(use-package go-mode
  :mode "\\.go\\'"
  :hook ((go-mode . eglot-ensure)
         (before-save . gofmt-before-save)))

;; -----------------------------
;; LSP (eglot)
;; -----------------------------
(use-package eglot
  :ensure nil)

(add-to-list 'eglot-server-programs
             '(go-mode . ("gopls")))

(setq eglot-autoshutdown t)
(setq eglot-send-changes-idle-time 0.5)

;; -----------------------------
;; gofmt / goimports
;; -----------------------------
(defun gofmt-before-save ()
  (when (eq major-mode 'go-mode)
    (eglot-format)))

;; -----------------------------
;; Keybindings
;; -----------------------------
(with-eval-after-load 'go-mode
  (define-key go-mode-map (kbd "C-c C-r") #'eglot-rename)
  (define-key go-mode-map (kbd "C-c C-f") #'eglot-format)
  (define-key go-mode-map (kbd "C-c C-d") #'eldoc)
  (define-key go-mode-map (kbd "C-c C-t") #'go-test-current-file)
  (define-key go-mode-map (kbd "C-c C-p") #'go-test-current-project))

(provide 'go-config)

;; Emacs settings

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Key bindings
(global-set-key (kbd "M-9") 'kill-whole-line)
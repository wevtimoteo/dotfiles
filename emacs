;; Emacs settings

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Key bindings
(global-set-key (kbd "M-9") 'kill-whole-line)

;; follow symlinks and don't ask
vc-follow-symlinks t

;; auto-mode-alist is the list Emacs uses to determine the major mode to use. Each item is a list, the first is the Em
;; acs regular expression Emacs uses to test the filename against, and if true, it uses the mode given in the third
;; item.
(setq auto-mode-alist
      (append '((".*\\.emacs\\'" . lisp-mode))
              auto-mode-alist))


(load "~/.emacs.d")
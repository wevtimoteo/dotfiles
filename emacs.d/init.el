(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/"))

;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(load-theme 'rubytapas t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("6097b88a6395ae44e32f7c835f04270d2ca045dd96549cab3bb917f7f6a75d5c" default))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; Show line numbers
(global-linum-mode t)
(setq linum-format "%d ")

; Trim whitespaces on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

; List directories first
(setq dired-listing-switches "-lXGh --group-directories-first")

; Disable autosaving
(setq auto-save-default nil)

; Always follow symlink
(setq vc-follow-symlinks t)

; Disable autoindent
(add-hook 'after-change-major-mode-hook (lambda() (electric-indent-mode -1)))

; Highlight current line
(global-hl-line-mode)
(set-face-background hl-line-face "color-233")

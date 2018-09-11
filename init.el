(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(add-to-list 'custom-theme-load-path "~/.emacs.d/custom_themes")
;; (load-theme 'blackboard t)

;; (require 'ruby-electric)
;; (add-hook 'ruby-mode-hook (lambda () (ruby-electric-mode t)))
(setq visible-bell nil) ;; The default
(setq ring-bell-function 'ignore)
(global-set-key (kbd "C-x g") 'magit-status)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(adaptive-fill-mode nil)
 '(js-indent-level 2)
 '(markdown-command "/usr/local/bin/markdown")
 '(server-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer
        (delq (current-buffer)
              (remove-if-not 'buffer-file-name (buffer-list)))))
(auto-fill-mode -1)
(remove-hook 'text-mode-hook #'turn-on-auto-fill)
(setq-default indent-tabs-mode nil) ; Don't use tabs damn it
(add-hook 'before-save-hook 'whitespace-cleanup)

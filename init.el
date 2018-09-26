;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(add-to-list 'custom-theme-load-path "~/.emacs.d/custom_themes")
(load-theme 'blackboard t)

(setq visible-bell nil) ;; The default
(setq ring-bell-function 'ignore)

(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (progn
    (message "Microsoft Windows")))
 ((string-equal system-type "darwin") ; Mac OS X
  (progn
    (message "Mac OS X")
    (require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")))
 ((string-equal system-type "gnu/linux") ; linux
  (progn
    (message "Linux")
    (require 'cask "~/.cask/cask.el"))))
(cask-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(adaptive-fill-mode nil)
 '(js-indent-level 2)
 '(markdown-command "/usr/local/bin/markdown")
 '(package-selected-packages
   (quote
    (yard-mode elisp-slime-nav idle-highlight-in-visible-buffers-mode alect-themes browse-at-remote cask dockerfile-mode find-file-in-project flymake-ruby gist hcl-mode magit markdown-mode paredit rspec-mode ruby-electric ruby-refactor ruby-tools smex terraform-mode yaml-mode ido-completing-read+ pallet)))
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
(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

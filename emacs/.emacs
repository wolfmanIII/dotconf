(setq backup-directory-alist `(("." . "~/.emacs-backup-saves")))
(setq-default indent-tabs-mode nil)

(require 'recentf)
(recentf-mode 1)
(setq recentf-exclude '("/home/wolfman/org/work.org"))

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(require 'dracula-theme)
(load-theme 'dracula t)

(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

(require 'org)
(global-set-key "\C-cl" 'org-store-link)
     (global-set-key "\C-ca" 'org-agenda)
     (global-set-key "\C-cc" 'org-capture)
     (global-set-key "\C-cb" 'org-iswitchb)
(setq org-agenda-files (list "~/org/work.org"))

(require 'dashboard)
(dashboard-setup-startup-hook)
(setq dashboard-banner-logo-title "Ciao bello!")
(setq dashboard-items '(;(agenda . 5)
                        (projects . 5)
                        (recents  . 5)
                        (bookmarks . 5)
                        (registers . 5)))

(require 'helm-config)
(helm-mode 1)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.blade\\.php\\'" . web-mode))

(require 'php-mode)
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-hook 'php-mode-hook '(lambda ()
                           (auto-complete-mode t)
                           (require 'ac-php)
                           (setq ac-sources  '(ac-source-php ) )
                           (yas-global-mode 1)

                           (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
                           (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
                           ))

(require 'twig-mode)
(add-to-list 'auto-mode-alist '("\\.twig\\'" . twig-mode))

(add-hook 'js-mode-hook 'js2-minor-mode)
(setq js2-highlight-level 4)

(desktop-save-mode 1)

(linum-mode 1)
(setq linum-format "%d ")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

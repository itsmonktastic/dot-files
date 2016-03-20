;; setup package management
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it's not.

Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(package-initialize)

(ensure-package-installed 'evil
                          'evil-leader
                          'evil-org
                          'helm
			  'magit
			  'neotree
			  'projectile
                          'monokai-theme
			  'zenburn-theme)

;; packages installed
(require 'evil)
(require 'evil-leader)
(require 'evil-org)
(require 'helm-config)
(require 'projectile)
(require 'magit)
(require 'grizzl)
(require 'neotree)

(setq projectile-completion-system 'grizzl)

;; evil
(evil-mode 1)

;; vim insert mode ctrl-u behaviour(ish)
(define-key evil-insert-state-map (kbd "C-u")
  (lambda ()
    (interactive)
    (evil-delete (point-at-bol) (point))))

;; evil-leader
(global-evil-leader-mode)
(evil-leader/set-leader ",")
;(evil-leader/set-key "b" 'find-file "b" 'switch-to-buffer "k" 'kill-buffer)
(evil-leader/set-key
  "b" 'projectile-switch-to-buffer
  "t" 'projectile-find-files
  "d" 'neotree-toggle
  "f" 'neotree-find)
(global-set-key (kbd "M-x") 'helm-M-x)

;; disable bell, v annoying
(setq ring-bell-function 'ignore)
;(load-theme 'monokai t)
(load-theme 'zenburn t)
(menu-bar-mode -1)
(tool-bar-mode -1)


(projectile-global-mode)

;; neotree evil
(add-hook 'neotree-mode-hook
  (lambda ()
   (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
    (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
    (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
    (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

(setq projectile-switch-project-action 'neotree-projectile-action)

(setq whitespace-style '(trailing tabs newline tab-mark newline-mark))

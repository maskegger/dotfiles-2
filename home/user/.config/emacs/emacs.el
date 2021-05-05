(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 2048 2048))

(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(setq use-package-always-ensure t)

(use-package which-key
  :config (which-key-mode)
  (which-key-setup-side-window-bottom)
  (setq which-key-idle-delay 0.05))

(use-package vterm)

(use-package neotree)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(add-hook 'neotree-mode-hook
         (lambda ()
           (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-quick-look)
           (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
           (define-key evil-normal-state-local-map (kbd "g") 'neotree-refresh)
           (define-key evil-normal-state-local-map (kbd "n") 'neotree-next-line)
           (define-key evil-normal-state-local-map (kbd "p") 'neotree-previous-line)
           (define-key evil-normal-state-local-map (kbd "A") 'neotree-stretch-toggle)
           (define-key evil-normal-state-local-map (kbd "H") 'neotree-hidden-file-toggle)))

(use-package magit
  :config (global-set-key (kbd "C-x g") 'magit-status))

(use-package smartparens
    :config (smartparens-global-mode))

(use-package evil
  :config (evil-mode))

(use-package evil-leader
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "<SPC>" 'helm-M-x
    "u" 'undo-tree-visualize))

(use-package helm
  :diminish
  :config
  (helm-mode t))

(use-package flx)
(use-package helm-flx
  :config
  (helm-flx-mode t))

(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner "~/Pictures/pfp_rounded_small.png")
  (setq dashboard-show-shortcuts nil)
  (setq dashboard-center-content t)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-navigator t))

(use-package doom-themes
  :config
  (doom-themes-neotree-config))
(load-theme 'quiet t)

(use-package all-the-icons)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 30)
  (setq doom-modeline-bar-width 1))

(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  (centaur-tabs-headline-match)
  (setq centaur-tabs-style "bar")
  (setq centaur-tabs-height 32)
  (setq centaur-tabs-set-icons t)
  (setq centaur-tabs-set-bar 'left)
  (setq centaur-tabs-set-modified-marker t)
  (centaur-tabs-change-fonts "Iosevka Nerd Font" 100)
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward))

(use-package format-all
  :config
  (format-all-mode 1)
  (add-hook 'prog-mode-hook 'format-all-mode))

(use-package undo-tree
  :config
  (global-undo-tree-mode))

(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package hydra)

(require 'mu4e)
(setq mu4e-maildir (expand-file-name "~/Mail/"))

(setq mu4e-drafts-folder "/Drafts")
(setq mu4e-sent-folder   "/Sent")
(setq mu4e-trash-folder  "/Deleted")

(setq mu4e-get-mail-command "offlineimap")

(setq
 user-mail-address "mcotocel@outlook.com"
 user-full-name  "Matei Cotocel")

(require 'org-mu4e)

(setq message-send-mail-function 'smtpmail-send-it)
(setq smtpmail-smtp-server "smtp-mail.outlook.com")
(setq smtpmail-smtp-service 587 )
(setq smtpmail-auth-credentials (expand-file-name "~/.authinfo"))

(setq-default erc-enable-logging t)
    (setq erc-save-buffer-on-part nil
          erc-save-queries-on-quit nil
          erc-log-write-after-send t
          erc-log-write-after-insert t
          erc-log-channels-directory (file-name-as-directory
                                      (concat user-emacs-directory "erc"))
          erc-server-auto-reconnect t
          erc-prompt 'my-erc-prompt
    )

    (setq erc-track-exclude-types
          '("JOIN" "KICK" "NICK" "PART" "QUIT" "MODE" "333" "353"))

  (defun my-erc-prompt ()
    (concat "[" (buffer-name) "]>"))

(setq erc-autojoin-channels-alist '(("freenode.net" "#archlinux" "#gentoo" "#emacs" "#org-mode")))

(use-package erc-hl-nicks
  :after erc)

(use-package erc-image
  :after erc)

(setq newsticker-url-list
      '(("Arch Linux News" "https://archlinux.org/feeds/news/")
      ("r/Linux" "https://www.reddit.com/r/linux/.rss")))

(use-package good-scroll
:config (good-scroll-mode 1))

(use-package lsp-jedi)

(use-package lua-mode)

(use-package json-mode)

(use-package lsp-mode
      :init
      :hook ((python-mode . lsp)
             (lua-mode . lsp)
             (sh-mode . lsp)
             (lisp-mode . lsp)
             (css-mode . lsp)
             (html-mode . lsp)
             (json-mode . lsp)
             (markdown-mode . lsp)
             (latex-mode . lsp)
             (lsp-mode . lsp-enable-which-key-integration))
      :commands lsp)
  (setq lsp-log-io nil)
(setq lsp-enable-file-watchers nil)

(use-package lsp-ui :commands lsp-ui-mode)

(setq lsp-enable-symbol-highlighting nil)
(custom-set-faces '(nobreak-space ((t nil))))

(use-package helm-lsp :commands helm-lsp-workspace-symbol)
(use-package dap-mode)

(use-package company
  :hook
  (after-init . global-company-mode)
  :bind (:map company-active-map
              ("<tab>" . company-select-next-or-abort)))
(setq company-idle-delay 0.1
      company-minimum-prefix-length 1
      company-selection-wrap-around t
      company-require-match 'never
      company-dabbrev-downcase nil
      company-dabbrev-ignore-case t
      company-dabbrev-other-buffers nil)

(use-package company-box
  :hook (company-mode . company-box-mode))

(when (equal ""
             (shell-command-to-string "git config user.name"))
  (shell-command "git config --global user.name \"MCotocel\"")
  (shell-command "git config --global user.email \"mcotocel@outlook.com\""))

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t)

(dolist (mode '(org-mode-hook
                term-mode-hook
                vterm-mode-hook
                eshell-mode-hook
                treemacs-mode-hook
                neotree-mode-hook))
(add-hook mode (lambda () (display-line-numbers-mode 0))))

(setq ring-bell-function 'ignore)

(setq helm-mini-default-sources '(helm-source-buffers-list
                                  helm-source-recentf
                                  helm-source-bookmarks
                                  helm-source-bookmark-set
                                  helm-source-buffer-not-found))

(setq helm-ff-ido-style-backspace 'always
      helm-ff-auto-update-initial-value t
      helm-ff--auto-update-state t)

(setq backup-directory-alist '(("." . "~/.config/emacs/backups")))
(setq delete-old-versions t)
(setq kept-old-versions 15)
(setq vc-make-backup-files t)
(setq version-control t)

(set-frame-font "Iosevka Nerd Font-11" nil t)

(define-key evil-normal-state-map (kbd "M-s") 'save-buffer)
(define-key evil-normal-state-map (kbd "M-q") 'delete-frame)
(define-key evil-normal-state-map (kbd "M-w") 'delete-window)
(define-key evil-normal-state-map (kbd "M-x") 'helm-M-x)
(define-key evil-normal-state-map (kbd "M-/") 'helm-find-files)
(define-key evil-normal-state-map (kbd "<C-tab>") 'helm-mini)
(define-key evil-normal-state-map (kbd "M-u") 'helm-show-kill-ring)
(define-key evil-normal-state-map (kbd "<C-return>") 'shell-pop)
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
(define-key evil-normal-state-map (kbd "M-j") 'evil-scroll-down)
(define-key evil-normal-state-map (kbd "M-k") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd "C-r") 'undo-tree-redo)
(define-key evil-normal-state-map (kbd "M-t") 'neotree-toggle)
(define-key evil-normal-state-map "u" 'undo-tree-undo)
(define-key key-translation-map (kbd "ESC") (kbd "C-g"))

(defhydra hydra-org (global-map "C-c o")
  "Org bindings"
  ("t" org-todo)
  ("<left>" org-shiftleft)
  ("<right>" org-shiftright)
  ("<up>" org-shiftup)
  ("<down>" org-shiftdown))

(visual-line-mode 1)

(setq require-final-newline t)

(set-default 'evil-normal-state-cursor 'hbar)
(set-default 'evil-insert-state-cursor 'bar)
(set-default 'evil-visual-state-cursor 'hbar)
(set-default 'evil-motion-state-cursor 'box)
(set-default 'evil-replace-state-cursor 'box)
(set-default 'evil-operator-state-cursor 'hbar)
(set-cursor-color "#80D1FF")

(setq evil-cross-lines t
      evil-move-beyond-eol t
      evil-want-fine-undo t
      evil-symbol-word-search t)

(setq evil-want-Y-yank-to-eol t)

(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

(set-frame-parameter nil 'internal-border-width 40)

(fset 'yes-or-no-p 'y-or-n-p)

(setq custom-file "~/.config/emacs/etc/custom.el")

(setq scroll-conservatively 10
      scroll-preserve-screen-position t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

(setq disabled-command-function nil)

(setq recentf-save-file "~/.config/emacs/etc/recentf"
      recentf-max-saved-items 50)

(setq savehist-file "~/.config/emacs/etc/savehist"
      history-length 150)

(setq save-place-file "~/.config/emacs/etc/saveplace")

(setq bookmark-default-file "~/.config/emacs/etc/bookmarks")

(setq sh-shell-file "/usr/bin/bash")

(add-to-list 'auto-mode-alist '("PKGBUILD\\'" . shell-script-mode))

(set-fontset-font t 'symbol (font-spec :family "Twemoji") nil 'prepend)

(delete-selection-mode t)

(setq org-directory "~/org/"
      org-default-notes-file "~/org/notes.org")

(setq org-export-backends '(latex md))

(use-package org-bullets
  :hook (org-mode . org-bullets-mode))

(setq org-hide-emphasis-markers t)

(setq org-todo-keywords
     '((sequence "📝 TODO" "⏱️ WAITING" "⏸️ PAUSED" "➡️ ALMOST" "✅ DONE" "↔️ OPTIONAL" "🔔 IMPORTANT")))

(setq org-todo-keyword-faces
'(
("📝 TODO"      . (:foreground "#FF8080" :weight bold))
("⏱️ WAITING"   . (:foreground "#FFFE80" :weight bold))
("⏸️ PAUSED"    . (:foreground "#D5D5D5" :weight bold))
("➡️ ALMOST"    . (:foreground "#80D1FF" :weight bold))
("✅ DONE"      . (:foreground "#97D59B" :weight bold))
("↔️ OPTIONAL"  . (:foreground "#C780FF" :weight bold))
("🔔 IMPORTANT" . (:foreground "#80FFE4" :weight bold))))

(use-package org-roam :hook
      (after-init . org-roam-mode)
      :custom
      (org-roam-directory "~/org/"))

(setq org-roam-graph-viewer "/usr/bin/eog")

(use-package org-roam-server
  :config
  (setq org-roam-server-host "127.0.0.1"
        org-roam-server-port 8080
        org-roam-server-authenticate nil
        org-roam-server-export-inline-images t
        org-roam-server-serve-files nil
        org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
        org-roam-server-network-poll t
        org-roam-server-network-arrows nil
        org-roam-server-network-label-truncate t
        org-roam-server-network-label-truncate-length 60
        org-roam-server-network-label-wrap-length 20))

(use-package writeroom-mode
:hook (org-mode . writeroom-mode))

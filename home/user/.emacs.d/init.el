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

(use-package auto-package-update
  :defer 10
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

(use-package which-key
  :defer 5
  :config (which-key-mode)
          (which-key-setup-side-window-bottom)
          (setq which-key-idle-delay 0.05))

(use-package magit
  :config (global-set-key (kbd "C-x g") 'magit-status))

(use-package evil
    :config (evil-mode))

(use-package org-bullets
  :hook (org-mode . org-bullets-mode)

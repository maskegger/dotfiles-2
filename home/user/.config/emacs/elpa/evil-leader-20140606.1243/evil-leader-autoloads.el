;;; evil-leader-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "evil-leader" "../../../../../../../.config/emacs/elpa/evil-leader-20140606.1243/evil-leader.el"
;;;;;;  "2c93f5f53b135bcef1a8ba74a0169038")
;;; Generated autoloads from ../../../../../../../.config/emacs/elpa/evil-leader-20140606.1243/evil-leader.el

(autoload 'global-evil-leader-mode "evil-leader" "\
Global minor mode for <leader> support.

If called interactively, enable Global Evil-Leader mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(autoload 'evil-leader-mode "evil-leader" "\
Minor mode to enable <leader> support.

If called interactively, enable Evil-Leader mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(autoload 'evil-leader/set-key "evil-leader" "\
Bind `key' to command `def' in `evil-leader/default-map'.

Key has to be readable by `read-kbd-macro' and `def' a command.
Accepts further `key' `def' pairs.

\(fn KEY DEF &rest BINDINGS)" t nil)

(autoload 'evil-leader/set-key-for-mode "evil-leader" "\
Create keybindings for major-mode `mode' with `key' bound to command `def'.

See `evil-leader/set-key'.

\(fn MODE KEY DEF &rest BINDINGS)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "evil-leader"
;;;;;;  "../../../../../../../.config/emacs/elpa/evil-leader-20140606.1243/evil-leader.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../../.config/emacs/elpa/evil-leader-20140606.1243/evil-leader.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-leader" '("evil-leader")))

;;;***

;;;***

;;;### (autoloads nil nil ("../../../../../../../.config/emacs/elpa/evil-leader-20140606.1243/evil-leader-autoloads.el"
;;;;;;  "../../../../../../../.config/emacs/elpa/evil-leader-20140606.1243/evil-leader.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; evil-leader-autoloads.el ends here

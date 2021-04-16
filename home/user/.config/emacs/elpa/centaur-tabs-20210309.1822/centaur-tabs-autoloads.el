;;; centaur-tabs-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "centaur-tabs" "../../../../../../../.config/emacs/elpa/centaur-tabs-20210309.1822/centaur-tabs.el"
;;;;;;  "b302cc941029d9043cd89368c9b0ac1b")
;;; Generated autoloads from ../../../../../../../.config/emacs/elpa/centaur-tabs-20210309.1822/centaur-tabs.el

(autoload 'centaur-tabs-local-mode "centaur-tabs" "\
Toggle local display of the tab bar.
With prefix argument ARG, turn on if positive, otherwise off.
Returns non-nil if the new state is enabled.
When turned on, if a local header line is shown, it is hidden to show
the tab bar.  The tab bar is locally hidden otherwise.  When turned
off, if a local header line is hidden or the tab bar is locally
hidden, it is shown again.  Signal an error if Centaur-Tabs mode is off.

\(fn &optional ARG)" t nil)

(defvar centaur-tabs-mode nil "\
Non-nil if Centaur-Tabs mode is enabled.
See the `centaur-tabs-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `centaur-tabs-mode'.")

(custom-autoload 'centaur-tabs-mode "centaur-tabs" nil)

(autoload 'centaur-tabs-mode "centaur-tabs" "\
Toggle display of a tab bar in the header line.
With prefix argument ARG, turn on if positive, otherwise off.
Returns non-nil if the new state is enabled.

\\{centaur-tabs-mode-map}

\(fn &optional ARG)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "centaur-tabs"
;;;;;;  "../../../../../../../.config/emacs/elpa/centaur-tabs-20210309.1822/centaur-tabs.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../../.config/emacs/elpa/centaur-tabs-20210309.1822/centaur-tabs.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "centaur-tabs" '("centaur-tabs-")))

;;;***

;;;***

;;;### (autoloads "actual autoloads are elsewhere" "centaur-tabs-elements"
;;;;;;  "../../../../../../../.config/emacs/elpa/centaur-tabs-20210309.1822/centaur-tabs-elements.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../../.config/emacs/elpa/centaur-tabs-20210309.1822/centaur-tabs-elements.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "centaur-tabs-elements" '("centaur-tabs-")))

;;;***

;;;### (autoloads nil "centaur-tabs-functions" "../../../../../../../.config/emacs/elpa/centaur-tabs-20210309.1822/centaur-tabs-functions.el"
;;;;;;  "6eba585a1b7d065cef0f3779777b061f")
;;; Generated autoloads from ../../../../../../../.config/emacs/elpa/centaur-tabs-20210309.1822/centaur-tabs-functions.el

(autoload 'centaur-tabs-backward "centaur-tabs-functions" "\
Select the previous available tab.
Depend on the setting of the option `centaur-tabs-cycle-scope'." t nil)

(autoload 'centaur-tabs-forward "centaur-tabs-functions" "\
Select the next available tab.
Depend on the setting of the option `centaur-tabs-cycle-scope'." t nil)

(autoload 'centaur-tabs-backward-group "centaur-tabs-functions" "\
Go to selected tab in the previous available group." t nil)

(autoload 'centaur-tabs-forward-group "centaur-tabs-functions" "\
Go to selected tab in the next available group." t nil)

(autoload 'centaur-tabs-backward-tab "centaur-tabs-functions" "\
Select the previous visible tab." t nil)

(autoload 'centaur-tabs-forward-tab "centaur-tabs-functions" "\
Select the next visible tab." t nil)

;;;### (autoloads "actual autoloads are elsewhere" "centaur-tabs-functions"
;;;;;;  "../../../../../../../.config/emacs/elpa/centaur-tabs-20210309.1822/centaur-tabs-functions.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../../.config/emacs/elpa/centaur-tabs-20210309.1822/centaur-tabs-functions.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "centaur-tabs-functions" '("centaur-tabs-")))

;;;***

;;;***

;;;### (autoloads nil "centaur-tabs-interactive" "../../../../../../../.config/emacs/elpa/centaur-tabs-20210309.1822/centaur-tabs-interactive.el"
;;;;;;  "0633e6668e6e8207466470ddf410f05c")
;;; Generated autoloads from ../../../../../../../.config/emacs/elpa/centaur-tabs-20210309.1822/centaur-tabs-interactive.el

(autoload 'centaur-tabs-counsel-switch-group "centaur-tabs-interactive" "\
Display a list of current buffer groups using Counsel." t nil)

;;;### (autoloads "actual autoloads are elsewhere" "centaur-tabs-interactive"
;;;;;;  "../../../../../../../.config/emacs/elpa/centaur-tabs-20210309.1822/centaur-tabs-interactive.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../../.config/emacs/elpa/centaur-tabs-20210309.1822/centaur-tabs-interactive.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "centaur-tabs-interactive" '("centaur-tabs-")))

;;;***

;;;***

;;;### (autoloads nil nil ("../../../../../../../.config/emacs/elpa/centaur-tabs-20210309.1822/centaur-tabs-autoloads.el"
;;;;;;  "../../../../../../../.config/emacs/elpa/centaur-tabs-20210309.1822/centaur-tabs-elements.el"
;;;;;;  "../../../../../../../.config/emacs/elpa/centaur-tabs-20210309.1822/centaur-tabs-functions.el"
;;;;;;  "../../../../../../../.config/emacs/elpa/centaur-tabs-20210309.1822/centaur-tabs-interactive.el"
;;;;;;  "../../../../../../../.config/emacs/elpa/centaur-tabs-20210309.1822/centaur-tabs-pkg.el"
;;;;;;  "../../../../../../../.config/emacs/elpa/centaur-tabs-20210309.1822/centaur-tabs.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; centaur-tabs-autoloads.el ends here

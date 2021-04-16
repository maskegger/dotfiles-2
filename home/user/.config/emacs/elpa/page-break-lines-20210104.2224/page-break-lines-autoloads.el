;;; page-break-lines-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "page-break-lines" "../../../../../../../.config/emacs/elpa/page-break-lines-20210104.2224/page-break-lines.el"
;;;;;;  "1d79ac10d25ab05daf664336b55d73cd")
;;; Generated autoloads from ../../../../../../../.config/emacs/elpa/page-break-lines-20210104.2224/page-break-lines.el

(autoload 'page-break-lines-mode "page-break-lines" "\
Toggle Page Break Lines mode.

If called interactively, enable Page-Break-Lines mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

In Page Break mode, page breaks (^L characters) are displayed as a
horizontal line of `page-break-lines-char' characters.

\(fn &optional ARG)" t nil)

(autoload 'page-break-lines-mode-maybe "page-break-lines" "\
Enable `page-break-lines-mode' in the current buffer if desired.
When `major-mode' is listed in `page-break-lines-modes', then
`page-break-lines-mode' will be enabled." nil nil)

(put 'global-page-break-lines-mode 'globalized-minor-mode t)

(defvar global-page-break-lines-mode nil "\
Non-nil if Global Page-Break-Lines mode is enabled.
See the `global-page-break-lines-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-page-break-lines-mode'.")

(custom-autoload 'global-page-break-lines-mode "page-break-lines" nil)

(autoload 'global-page-break-lines-mode "page-break-lines" "\
Toggle Page-Break-Lines mode in all buffers.
With prefix ARG, enable Global Page-Break-Lines mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Page-Break-Lines mode is enabled in all buffers where
`page-break-lines-mode-maybe' would do it.
See `page-break-lines-mode' for more information on Page-Break-Lines mode.

\(fn &optional ARG)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "page-break-lines"
;;;;;;  "../../../../../../../.config/emacs/elpa/page-break-lines-20210104.2224/page-break-lines.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../../../../.config/emacs/elpa/page-break-lines-20210104.2224/page-break-lines.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "page-break-lines" '("page-break-lines-")))

;;;***

;;;***

;;;### (autoloads nil nil ("../../../../../../../.config/emacs/elpa/page-break-lines-20210104.2224/page-break-lines-autoloads.el"
;;;;;;  "../../../../../../../.config/emacs/elpa/page-break-lines-20210104.2224/page-break-lines.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; page-break-lines-autoloads.el ends here

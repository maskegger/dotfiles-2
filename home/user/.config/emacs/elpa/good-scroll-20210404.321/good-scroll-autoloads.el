;;; good-scroll-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "good-scroll" "good-scroll.el" (0 0 0 0))
;;; Generated autoloads from good-scroll.el

(defvar good-scroll-mode nil "\
Non-nil if Good-Scroll mode is enabled.
See the `good-scroll-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `good-scroll-mode'.")

(custom-autoload 'good-scroll-mode "good-scroll" nil)

(autoload 'good-scroll-mode "good-scroll" "\
Good pixel line scrolling

If called interactively, toggle `Good-Scroll mode'.  If the
prefix argument is positive, enable the mode, and if it is zero
or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "good-scroll" '("good-scroll-"))

;;;***

;;;### (autoloads nil "good-scroll-bezier" "good-scroll-bezier.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from good-scroll-bezier.el

(register-definition-prefixes "good-scroll-bezier" '("good-scroll-bezier"))

;;;***

;;;### (autoloads nil "good-scroll-linear" "good-scroll-linear.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from good-scroll-linear.el

(register-definition-prefixes "good-scroll-linear" '("good-scroll-linear"))

;;;***

;;;### (autoloads nil nil ("good-scroll-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; good-scroll-autoloads.el ends here

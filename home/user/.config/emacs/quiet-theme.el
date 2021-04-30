;;; doom-quiet-theme.el --- inspired by doom-nord-theme.el -*- no-byte-compile: t; -*-
(require 'doom-themes)

;;
(defgroup doom-quiet-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-quiet-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-quiet-theme
  :type 'boolean)

(defcustom doom-quiet-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-quiet-theme
  :type 'boolean)

(defcustom doom-quiet-comment-bg doom-quiet-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-quiet-theme
  :type 'boolean)

(defcustom doom-quiet-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-quiet-theme
  :type '(choice integer boolean))

(eval-and-compile
  (defcustom doom-quiet-region-highlight t
    "Determines the selection highlight style. Can be 'frost, 'snowstorm or t
(default)."
    :group 'doom-quiet-theme
    :type 'symbol))

;;
(def-doom-theme quiet
  "Doom nord theme with a few tweaks"

  ;; name        default   256  16
  ((bg         '("#1f252a" nil nil ))
   (bg-alt     '("#1f252a" nil nil ))
   (base0      '("#1f252a" nil nil ))
   (base1      '("#1f252a" nil nil ))
   (base2      '("#384149" nil nil ))
   (base3      '("#384149" nil nil ))
   (base4      '("#384149" nil nil ))
   (base5      '("#384149" nil nil ))
   (base6      '("#384149" nil nil ))
   (base7      '("#d5d5d5" nil nil ))
   (base8      '("#d5d5d5" nil nil ))
   (fg         '("#d5d5d5" nil nil ))
   (fg-alt     '("#d5d5d5" nil nil ))

   (dark-grey  '("#384149" nil nil ))
   (grey       '("#758089" nil nil ))
   (red        '("#ff8080" nil nil ))
   (orange     '("#ffaeae" nil nil ))
   (green      '("#97d59b" nil nil ))
   (teal       '("#bef8c1" nil nil ))
   (yellow     '("#fffe80" nil nil ))
   (blue       '("#ace1ff" nil nil ))
   (dark-blue  '("#80d1ff" nil nil ))
   (magenta    '("#c780ff" nil nil ))
   (violet     '("#d8a8ff" nil nil ))
   (cyan       '("#acffeb" nil nil ))
   (dark-cyan  '("#80ffe4" nil nil ))

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   bg)
   (selection      dark-grey)
   (builtin        blue)
   (comments       grey)
   (doc-comments   grey)
   (constants      blue)
   (functions      teal)
   (keywords       blue)
   (methods        teal)
   (operators      blue)
   (type           teal)
   (strings        green)
   (variables      magenta)
   (numbers        magenta)
   (region         dark-blue)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden bg)
   (-modeline-bright dark-grey)
   (-modeline-pad 4)

   (region-fg bg)

   (modeline-fg nil)
   (modeline-fg-alt grey)

   (modeline-bg dark-grey)
   (modeline-bg-l dark-grey)
   (modeline-bg-inactive bg)
   (modeline-bg-inactive-l bg))

  ;; --- extra faces ------------------------
  (((region &override) :foreground region-fg)

   ((line-number &override) :foreground grey)
   ((line-number-current-line &override) grey)
   ((paren-face-match &override) :foreground red :background grey :weight 'ultra-bold)
   ((paren-face-mismatch &override) :foreground grey :background red :weight 'ultra-bold)
   ((vimish-fold-overlay &override) :inherit 'font-lock-comment-face :background grey :weight 'light)
   ((vimish-fold-fringe &override)  :foreground teal)

   (font-lock-comment-face
    :foreground comments
    :background bg)
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)

   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright fg highlight))

   (doom-modeline-project-root-dir :foreground grey)
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   ;; ediff
   (ediff-fine-diff-A    :background (doom-darken violet 0.4) :weight 'bold)
   (ediff-current-diff-A :background bg)

   ;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   ;; highlight-symbol
   (highlight-symbol-face :background grey :distant-foreground fg-alt)

   ;; highlight-thing
   (highlight-thing :background grey :distant-foreground fg-alt)

   ;; ivy
   ((ivy-current-match &override) :foreground region-fg :weight 'semi-bold)


   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; markdown-mode
   (markdown-markup-face :foreground grey)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background grey)

   ;; org-mode
   (org-hide :foreground hidden)
   (solaire-org-hide-face :foreground hidden))


  ;; --- extra variables ---------------------
  ()
  )

;;; doom-quiet-theme.el ends here

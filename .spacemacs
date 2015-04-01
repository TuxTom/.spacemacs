;; -*- mode: dotspacemacs -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers '(git
                                       windows-scripts
                                       markdown
                                       company-mode
                                       TuxTom)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Specify the startup banner. If the value is an integer then the
   ;; banner with the corresponding index is used, if the value is `random'
   ;; then the banner is chosen randomly among the available banners, if
   ;; the value is nil then no banner is displayed.
   dotspacemacs-startup-banner 1
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(solarized-light
                         solarized-dark)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Consolas"
                               :size 8.0
                               :weight normal
                               :width normal)
   ;; :powerline-scale 1.2)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`
   dotspacemacs-major-mode-leader-key ","
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.5
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to nil
   ;; to boost the loading time.
   dotspacemacs-loading-progress-bar nil
   ;; If non nil the frame is fullscreen when Emacs starts up (Emacs 24.4+ only).
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up (Emacs 24.4+ only).
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame when it's active or selected. Transparency can
   ;; be toggled through `toggle-transparency'.
   ;; dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame when it's inactive or deselected. Transparency
   ;; can be toggled through `toggle-transparency'.
   ;; dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line (e.g. for lighters)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth scrolling
   ;; overrides the default behavior of Emacs which recenters the point when
   ;; it reaches the top or bottom of the screen
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server t
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil)

  ;; User initialization goes here
  (setq-default git-enable-magit-svn-plugin t)
  (setq evil-ex-substitute-global t)
  (setq evil-move-cursor-back nil)

  (define-key button-buffer-map [tab] 'forward-button)
  (define-key button-buffer-map [S-tab] 'backward-button)

  (add-hook 'after-make-frame-functions
            (lambda (selected-frame) (set-frame-parameter selected-frame 'fullscreen 'maximized)))
  )

(defun dotspacemacs/config ()
  "This is were you can ultimately override default Spacemacs configuration.
This function is called at the very end of Spacemacs initialization."
  (global-visual-line-mode)
  (global-aggressive-indent-mode)

  (setq linum-format "%5d")
  (setq linum-relative-format "%5s")
  (linum-relative-toggle)

  (rainbow-delimiters-mode-enable)
  (setq jiralib-url "https://issue.ebgroup.elektrobit.com")

  (setq large-file-warning-threshold 100000000)

  (setq org-default-notes-file "~/org/notes.org")
  (evil-leader/set-key "oc" 'org-capture)
  (evil-leader/set-key "oo" 'org-cycle-agenda-files)

  ;; (global-set-key (kbd "M-h") 'evil-window-left)
  ;; (global-set-key (kbd "M-j") 'evil-window-down)
  ;; (global-set-key (kbd "M-k") 'evil-window-up)
  ;; (global-set-key (kbd "M-l") 'evil-window-right)

  ;; to make the respective mappings for company-mode work
  (define-key evil-insert-state-map (kbd "C-k") nil)
  (define-key evil-insert-state-map (kbd "C-d") nil)

  ;; Fix normal state 'Y'
  (define-key evil-normal-state-map "Y" (kbd "y$"))

  (setq ediff-window-setup-function 'ediff-setup-windows-plain)
  (setq ediff-split-window-function 'split-window-horizontally)
  (setq ediff-diff-options "-w")

  (set-language-environment 'utf-8)
  (setq locale-coding-system 'utf-8)
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (prefer-coding-system 'utf-8)

  (add-hook 'nxml-mode-hook 'hs-minor-mode)
  (hideshowvis-symbols)

  (setq smooth-scroll-margin 3)
  (setq scroll-margin 3)

  (add-to-list 'hs-special-modes-alist
               '(nxml-mode
                 "<!--\\|<[^/>]*[^/]>"
                 "-->\\|</[^/>]*[^/]>"
                 "<!--"
                 nxml-forward-element
                 nil))

  ;; for preventing the server frame to be closed:
  (defun make-frame-invisible--prevent-for-server-frame (&optional frame force)
    "Prevent that the initial (i.e. server) frame is made invisible"
    (let ((server-frame (car (last (frame-list))))
          (target-frame (if frame frame (selected-frame))))
      (if (eq server-frame target-frame)
          (progn (iconify-frame target-frame)
                 nil)
        t)
      )
    )
  (advice-add 'make-frame-invisible :before-while #'make-frame-invisible--prevent-for-server-frame)

  (defun move-windows-paths-to-end (paths)
    (if (consp paths)
        (let ((first-path (car paths))
              (other-paths (cdr paths)))
          (if (string-match "^c:/windows" first-path)
              (nconc (move-windows-paths-to-end other-paths) first-path)
            (cons first-path (move-windows-paths-to-end other-paths))
            )
          )
      paths
      )
    )
  (setq exec-path (move-windows-paths-to-end exec-path))

  ;; make helm mode for help etc. available if emacs is idle
  (run-with-idle-timer 30 nil 'helm-mode +1)

  (spacemacs/load-yasnippet)
  (yas-global-mode)
  )

;; Custom variables
;; ----------------

;; Do not write anything in this section. This is where Emacs will
;; auto-generate custom variable definitions.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-ispell-requires 4)
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(anzu-cons-mode-line-p nil)
 '(anzu-mode-line-update-function (quote spacemacs/anzu-update-mode-line))
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(evil-shift-width 2)
 '(evil-split-window-below t)
 '(evil-vsplit-window-right t)
 '(mediawiki-site-alist
   (quote
    (("Wikipedia" "http://en.wikipedia.org/w/" "username" "password" "Main Page")
     ("EB Wiki" "http://wiki.elektrobit.com/" "Thomas Kloeber" "" "Main Page"))))
 '(org-agenda-files (quote ("~/org/")))
 '(org-src-fontify-natively t)
 '(org-tags-column 0)
 '(paradox-github-token t)
 '(ring-bell-function (quote ignore) t)
 '(solarized-distinct-fringe-background t)
 '(solarized-high-contrast-mode-line t)
 '(solarized-use-more-italic t)
 '(yas-prompt-functions
   (quote
    (yas-dropdown-prompt yas-completing-prompt yas-ido-prompt yas-x-prompt yas-no-prompt))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(mode-line ((t (:background "#eee8d5" :foreground "#657b83" :box (:line-width 1 :color "#657b83")))))
 '(org-done ((t (:foreground "#859900" :box (:line-width 1 :color "grey85") :weight bold))))
 '(org-headline-done ((t (:foreground "#859900" :box (:line-width 1 :color "grey85")))))
 '(org-tag ((t (:slant italic :weight normal :height 0.9))))
 '(org-todo ((t (:foreground "#2aa198" :box (:line-width 1 :color "gray85") :weight bold)))))

;;; packages.el --- TuxTom Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar TuxTom-packages
  '(
    docbook-snippets
    edbi
    edbi-sqlite
    hideshowvis
    mediawiki
    org-jira
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar TuxTom-excluded-packages
  '(
    ac-ispell
    ag
    auto-complete-clang
    auto-dictionary
    base16-theme
    bookmark
    evil-escape
    evil-exchange
    evil-indent-textobject
    evil-numbers
    evil-terminal-cursor-changer
    exec-path-from-shell
    fancy-battery
    fish-mode
    flyspell
    google-translate
    helm-ag
    helm-flyspell
    helm-make
    helm-themes
    highlight
    leuven-theme
    monokai-theme
    move-text
    multi-term
    rcirc
    rcirc-color
    vi-tilde-fringe
    window-numbering
    zenburn-theme
    )
  "List of packages to exclude.")

;; For each package, define a function TuxTom/init-<package-TuxTom>
;;
;; (defun TuxTom/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

(defun TuxTom/init-docbook-snippets ()
  "Initialize docbook-snippets"
  (use-package docbook-snippets)
  )

(defun TuxTom/init-hideshowvis ()
  "Initialize hideshowvis"
  (use-package hideshowvis)
  )

(defun TuxTom/init-org-jira ()
  "Initialize org-jira"
  ;; (use-package org-jira)
  (use-package jiralib)

  (defun post-as-jira-comment (start end &optional id)
    (interactive
     (let ((ticket (if (buffer-file-name)
                       (upcase (file-name-base))
                     "")))
       (while (not (string-match-p "[A-Z]+-[0-9]+" ticket))
         (setq ticket (upcase (read-string "Ticket-ID: "))))
       (list (if (region-active-p) (region-beginning) (point-min))
             (if (region-active-p) (region-end) (point-max))
             ticket
             )
       ))
    (jiralib-add-comment id (buffer-substring-no-properties start end))
    )
  )

(defun TuxTom/init-mediawiki ()
  "Initialize mediawiki"
  (use-package mediawiki)
  )

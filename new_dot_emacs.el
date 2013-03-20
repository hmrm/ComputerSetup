;; Load packages
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-js starter-kit-ruby starter-kit-eshell starter-kit-perl starter-kit-bindings coffee-mode scala-mode2 haskell-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; personal customizations
(display-time)

;;adding load path
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/emacs-for-python/")
(add-to-list 'load-path "~/.emacs.d/ensime/elisp/")

;; load ensime
(require 'ensime)

;; This step causes the ensime-mode to be started whenever
;; scala-mode is started for a buffer. You may have to customize this step
;; if you're not using the standard scala mode.
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;;setting up python-for-emacs
(require 'epy-setup)      ;; It will setup other loads, it is required!
(require 'epy-python)     ;; If you want the python facilities [optional]
(require 'epy-completion) ;; If you want the autocompletion settings [optional]
(require 'epy-editing)    ;; For configurations related to editing [optional]
(require 'epy-bindings)   ;; For my suggested keybindings [optional]
(epy-setup-checker "pyflakes %f")

;;setting up markdown mode
(setq auto-mode-alist
        (cons '("\\.mkd" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist
        (cons '("\\.md" . markdown-mode) auto-mode-alist))

;;getting rid of c-z
(global-unset-key [(control z)])
(global-unset-key [(control x)(control z)])

;;setting up haskell mode
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; legend: S = syntax highting I = indentation, A = autocomplete with nice keybinding, a = autocomplete functionality, D = documentation, R = repl, C = compilation, E = error checking
;; above slash is implemented, below slash is potentially to be implented

;; Setup Repositories
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;;setup load function
(defun ensure-installed (my-package)
  (unless (package-installed-p my-package)
    (package-refresh-contents) (package-install my-package)))

;;graphviz setup SIaC/E
(ensure-installed 'graphviz-dot-mode)

;;haskell setup
(ensure-installed 'haskell-mode)
(ensure-installed 'ghc)
(ensure-installed 'ghc-completion)
(ensure-installed 'flymake)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(autoload 'ghc-init "ghc" nil t)
(add-hood 'haskell-mode-hook (lambda ()
			       (ghc-init)
			       (flymake-mode)))

(define-key haskell-mode-map (kbd "C-c h") 'hoogle)) ;there might be newline problems that need to be solved
(define-key haskell-mode-map (kbd "C-x C-s") 'haskell-mode-save-buffer)

(add-hook 'inferior-haskell-mode-hook 'turn-on-ghci-completion)			       


;;clojure setup ?SIR/?ADE
(ensure-installed 'clojure-mode)
(ensure-installed 'clojure-test-mode)
(ensure-installed 'nrepl)
(ensure-installed 'paredit)

(eval-after-load "paredit"
  '(diminish 'paredit-mode " π"))

(add-hook 'clojure-mode-hook (lambda () 
			       (turn-on-eldoc-mode)
			       (clojure-test-mode) 
			       (paredit-mode) 
			       (define-key read-expression-map (kbd "TAB") 'lisp-complete-symbol)))

(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
(add-hood 'nrepl-mode-hook (lambda ()
				(paredit-mode)))

;;scheme setup ?SIRA/?DE
(ensure-installed 'geiser-mode) ;should I be using scheme-complete instead?
(ensure-installed 'company-mode)
(add-hook 'scheme-mode-hook (lambda ()
			      (turn-on-eldoc-mode)
			      (paredit-mode)
			      (company-mode)))

;; common-lisp setup
; the lispdoc function from https://github.com/purcell/emacs.d/blob/master/init-common-lisp.el is interesting
(add-to-list 'auto-mode-alist '("\\.sbclrc$" . lisp-mode)) ;sbcl config file is in lisp
(setq inferior-lisp-program "sbcl") ;use sbcl for lisp
(load (expand-file-name "~/quicklisp/slime-helper.el")) ;load the quicklisp version of slime stuff
(add-hook 'lisp-mode-hook (lambda ()
			    (paredit-mode)
			    (turn-on-eldoc-mode)
			    (define-key read-expression-map (kbd "TAB") 'lisp-complete-symbol)))

;; Setup scala ?SICA/?DE
(ensure-installed 'scala-mode2)
(add-to-list 'load-path "~/.emacs.d/ensime/elisp/")
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; Setup javascript ?SIRE/?DA
(ensure-installed 'js2-mode)

(defvar preferred-javascript-indent-level 2)
(setq js2-basic-offset preferred-javascript-indent-level)
(setq js-indent-level preferred-javascript-indent-level)
(setq javascript-indent-level preferred-javascript-indent-level)

(setq auto-mode-alist
        (cons '("\\.js\\(\\.erb\\)?\\'" . js2-mode) auto-mode-alist))
(eval-after-load 'js2-mode '(js2-imenu-extras-setup))

; js-comint not enabled, skewer also looks sweet, if I am doing a lot of javascript, consider adding those

;;setup json
(ensure-installed 'flymake-json)
(add-auto-mode 'js-mode "\\.json\\'")
(add-hook 'js-mode-hook 'flymake-json-maybe-load)

;;setup coffee-script ?SIC/?ADE
(ensure-installed 'coffee-mode)
(add-hood 'coffee-mode-hook (lambda ()
			      (set (make-local-variable 'tab-width) 2)
			      (setq coffee-js-mode 'js2-mode)
			      (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)
			      (and (file-exists-p (buffer-file-name))
				   (file-exists-p (coffee-compiled-file-name))
				   (coffee-cos-mode t)))) ;;compile on close

;; Add in your own as you wish:
(defvar my-packages '(cl-lib starter-kit starter-kit-lisp starter-kit-js starter-kit-ruby starter-kit-eshell starter-kit-perl starter-kit-bindings coffee-mode haskell-mode flycheck ghci-completion ido-ubiquitous smex flymake-hlint erlang auto-complete crontab-mode mmm-mode sass-mode scss-mode less-css-mode rainbow-mode csv-mode csv-nav dired+ mic-paren json rainbow-delimiters)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; personal customizations
(display-time)
(show-trailing-whitespace)
(dolist (hook '(term-mode-hook comint-mode-hook compilation-mode-hook))
  (add-hook hook
   (lambda () (setq show-trailing-whitespace nil))))
(paren-activate)
(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(which-function-mode)
(rainbow-delimiters)
(global-set-key (kbd "RET") 'reindent-then-newline-and-indent)

;;adding load path
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/emacs-for-python/")


;; crontab setup
(add-auto-mode 'crontab-mode "\\.?cron\\(tab\\)?\\'")

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

;;enable flycheck
(add-hook 'prog-mode-hook 'flycheck-mode)
(add-hook 'text-mode-hook 'flycheck-mode)

;;ido mode setup
(ido-mode t)  ; use 'buffer rather than t to use only buffer switching
(ido-everywhere t)
(ido-ubiquitous-mode t)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point nil)
(setq ido-auto-merge-work-directories-length 0)
(setq ido-use-virtual-buffers t)

;;erlang setup
(require 'erlang-start)

;;clojure setup (from github/purcell)


;;setup auto-complete (from github/purcell)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq ac-expand-on-auto-complete nil)
(setq ac-auto-start nil)
(setq ac-dwim nil) ; To get pop-ups with docs even if a word is uniquely completed
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)

(setq tab-always-indent 'complete)  ;; use 't when auto-complete is disabled
(add-to-list 'completion-styles 'initials t)

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)


(set-default 'ac-sources
             '(ac-source-imenu
               ac-source-dictionary
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-words-in-all-buffer))

(dolist (mode '(magit-log-edit-mode log-edit-mode org-mode text-mode haml-mode
                sass-mode yaml-mode csv-mode espresso-mode haskell-mode
                html-mode nxml-mode sh-mode smarty-mode clojure-mode
                lisp-mode textile-mode markdown-mode tuareg-mode
                js3-mode css-mode less-css-mode sql-mode))
  (add-to-list 'ac-modes mode))


(defun sanityinc/dabbrev-friend-buffer (other-buffer)
  (< (buffer-size other-buffer) (* 1 1024 1024)))

(setq dabbrev-friend-buffer-function 'sanityinc/dabbrev-friend-buffer)

;;common-lisp startup (purcell) lispdoc from From http://bc.tech.coop/blog/070515.html
(add-auto-mode 'lisp-mode "\\.cl\\'")
(add-hook 'lisp-mode-hook (lambda ()
                            (cond ((not (featurep 'slime))
                                   (require 'slime)
                                   (normal-mode)))))

(eval-after-load 'slime
  '(progn
     (add-to-list 'slime-lisp-implementations
		    '(sbcl ("sbcl") :coding-system utf-8-unix))
     (add-to-list 'slime-lisp-implementations
		    '(cmucl ("lisp") :coding-system iso-latin-1-unix))))

(defun lispdoc ()
  "Searches lispdoc.com for SYMBOL, which is by default the symbol currently under the curser"
  (interactive)
  (let* ((word-at-point (word-at-point))
         (symbol-at-point (symbol-at-point))
         (default (symbol-name symbol-at-point))
         (inp (read-from-minibuffer
               (if (or word-at-point symbol-at-point)
                   (concat "Symbol (default " default "): ")
                 "Symbol (no default): "))))
    (if (and (string= inp "") (not word-at-point) (not
                                                   symbol-at-point))
        (message "you didn't enter a symbol!")
      (let ((search-type (read-from-minibuffer
                          "full-text (f) or basic (b) search (default b)? ")))
        (browse-url (concat "http://lispdoc.com?q="
                            (if (string= inp "")
                                default
                              inp)
                            "&search="
                            (if (string-equal search-type "f")
                                "full+text+search"
                              "basic+search")))))))

(define-key lisp-mode-map (kbd "C-c l") 'lispdoc)

;; css setup
(eval-after-load 'mmm-vars
  '(progn
     (mmm-add-group
      'html-css
      '((css-cdata
         :submode css-mode
         :face mmm-code-submode-face
         :front "<style[^>]*>[ \t\n]*\\(//\\)?<!\\[CDATA\\[[ \t]*\n?"
         :back "[ \t]*\\(//\\)?]]>[ \t\n]*</style>"
         :insert ((?j js-tag nil @ "<style type=\"text/css\">"
                      @ "\n" _ "\n" @ "</script>" @)))
        (css
         :submode css-mode
         :face mmm-code-submode-face
         :front "<style[^>]*>[ \t]*\n?"
         :back "[ \t]*</style>"
         :insert ((?j js-tag nil @ "<style type=\"text/css\">"
                      @ "\n" _ "\n" @ "</style>" @)))
        (css-inline
         :submode css-mode
         :face mmm-code-submode-face
         :front "style=\""
         :back "\"")))
     (dolist (mode (list 'html-mode 'nxml-mode))
       (mmm-add-mode-ext-class mode "\\.r?html\\(\\.erb\\)?\\'" 'html-css))))

(eval-after-load 'rainbow-mode
  '(dolist (hook '(css-mode-hook html-mode-hook sass-mode-hook))
     (add-hook hook 'rainbow-mode)))

(eval-after-load 'auto-complete
  '(progn
     (dolist (hook '(css-mode-hook sass-mode-hook scss-mode-hook))
       (add-hook hook 'ac-css-mode-setup))))

;; csv mode setup
(add-auto-mode 'csv-mode "\\.[Cc][Ss][Vv]\\'")
(autoload 'csv-nav-mode "csv-nav" "Major mode for navigating comma-separated value files." t)

(setq csv-separators '("," ";" "|" " "))

;; dired setup
(eval-after-load 'dired
  '(progn
     (require 'dired+)
     (setq dired-recursive-deletes 'top)
     (define-key dired-mode-map [mouse-2] 'dired-find-file)))

;; hippie expand setup
(global-set-key (kbd "M-/") 'hippie-expand)

(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially
        try-complete-file-name
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill))

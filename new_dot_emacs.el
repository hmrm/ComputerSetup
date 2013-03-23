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

;;sql setup
(ensure-installed 'sql-indent)

;;golang setup
(ensure-installed 'go-mode)
(add-to-list 'ac-modes 'go-mode)

;;go setup
(ensure-installed 'gnugo)

;;D setup
(ensure-installed 'd-mode)

;;xml/html setup
(add-auto-mode
 'nxml-mode
 (concat "\\."
         (regexp-opt
          '("xml" "xsd" "sch" "rng" "xslt" "svg" "rss"
            "gpx" "tcx"))
         "\\'"))
(setq magic-mode-alist (cons '("<\\?xml " . nxml-mode) magic-mode-alist))
(fset 'xml-mode 'nxml-mode)
(setq nxml-child-indent 4)
(setq nxml-attribute-indent 4)
(setq nxml-auto-insert-xml-declaration-flag nil)
(setq nxml-bind-meta-tab-to-complete-flag t)
(setq nxml-slash-auto-complete-flag t)

;;css setup
(ensure-installed 'flycheck)
(ensure-installed 'rainbow-mode)
(ensure-installed 'scss-mode)
(ensure-installed 'less-css-mode)
(ensure-installed 'sass-mode)
(add-hook 'css-mode-hook (lambda ()
			   (rainbow-mode)
			   (flycheck-mode)))


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

;;setting up python-for-emacs
(add-to-list 'load-path "~/.emacs.d/emacs-for-python/")
(require 'epy-setup)      ;; It will setup other loads, it is required!
(require 'epy-python)     ;; If you want the python facilities [optional]
(require 'epy-completion) ;; If you want the autocompletion settings [optional]
(require 'epy-editing)    ;; For configurations related to editing [optional]
(require 'epy-bindings)   ;; For my suggested keybindings [optional]
(epy-setup-checker "pyflakes %f")

;;scheme setup ?SIRA/?DE
(ensure-installed 'paredit)
(ensure-installed 'geiser-mode) ;should I be using scheme-complete instead?
(ensure-installed 'company-mode)
(add-hook 'scheme-mode-hook (lambda ()
			      (turn-on-eldoc-mode)
			      (paredit-mode)
			      (company-mode)))

;; common-lisp setup
; the lispdoc function from https://github.com/purcell/emacs.d/blob/master/init-common-lisp.el is interesting
(ensure-installed 'paredit)
(add-to-list 'auto-mode-alist '("\\.sbclrc$" . lisp-mode)) ;sbcl config file is in lisp
(setq inferior-lisp-program "sbcl") ;use sbcl for lisp
(load (expand-file-name "~/quicklisp/slime-helper.el")) ;load the quicklisp version of slime stuff
(add-hook 'lisp-mode-hook (lambda ()
			    (paredit-mode)
			    (turn-on-eldoc-mode)
			    (define-key read-expression-map (kbd "TAB") 'lisp-complete-symbol)))

;;perl setup
(ensure-installed 'cperl-mode)
(defalias 'perl-mode 'cperl-mode)

;; crontab setup
(ensure-installed 'crontab-mode)
(add-auto-mode 'crontab-mode "\\.?cron\\(tab\\)?\\'")

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
(add-hook 'coffee-mode-hook (lambda ()
			      (set (make-local-variable 'tab-width) 2)
			      (setq coffee-js-mode 'js2-mode)
			      (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)
			      (and (file-exists-p (buffer-file-name))
				   (file-exists-p (coffee-compiled-file-name))
				   (coffee-cos-mode t)))) ;;compile on close

;; csv mode setup
(ensure-installed 'csv-mode)
(ensure-installed 'csv-nav)
(add-auto-mode 'csv-mode "\\.[Cc][Ss][Vv]\\'")
(autoload 'csv-nav-mode "csv-nav" "Major mode for navigating comma-separated value files." t)
(setq csv-separators '("," ";" "|" " "))

;;setting markdown
(setq auto-mode-alist
        (cons '("\\.mkd" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist
        (cons '("\\.md" . markdown-mode) auto-mode-alist))

;;setting up ruby
; TODO: There is significant rails support that could be added
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.thor\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Thorfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.jbuilder\\'" . ruby-mode))
(ensure-installed 'yari)
(ensure-installed 'ruby-inf)
(ensure-installed 'ruby-end)
(ensure-installed 'robe)
(ensure-installed 'auto-complete)
(add-to-list 'ac-modes 'ruby-mode)
(add-hook 'ruby-mode-hook (lambda ()
			    (inf-ruby-setup-keybindings)
			    (ruby-end-mode)
			    (robe-mode)
			    (push 'ac-source-robe ac-sources)))

;; Add in your own as you wish:
(defvar my-packages '(cl-lib ido-ubiquitous smex erlang mic-paren)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; personal customizations
(ensure-installed 'dired+)
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
(global-unset-key [(control z)])
(global-unset-key [(control x)(control z)])

;;adding load path
(add-to-list 'load-path "~/.emacs.d/lisp/")

;;ido mode setup
(ido-mode t)  ; use 'buffer rather than t to use only buffer switching
(ido-everywhere t)
(ido-ubiquitous-mode t)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point nil)
(setq ido-auto-merge-work-directories-length 0)
(setq ido-use-virtual-buffers t)

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

;; hippie expand setup
(global-set-key (kbd "M-/") 'hippie-expand)

(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially
        try-complete-file-name
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill))

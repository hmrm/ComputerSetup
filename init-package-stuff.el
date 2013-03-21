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

;;setup load function
(defun ensure-installed (my-package)
  (unless (package-installed-p my-package)
    (package-refresh-contents) (package-install my-package)))
  

(add-to-list 'load-path "~/.emacs.d/")
(autoload 'dirtree "dirtree" "Add directory to tree view")
(require 'dirtree)
(require 'minimap)
(require 'semantic/ia)

(setq semanticdb-minor-mode t)
(defun my-semantic-hook ()
  (imenu-add-to-menubar "TAGS"))
(add-hook 'semantic-init-hooks 'my-semantic-hook)

(set-default-font "Consolas")
;(load "d:\\emacs\\haskell-mode-2.8.0\\haskell-site-file.el")
;(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(set-default 'truncate-lines t)
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)
(set-frame-width (selected-frame) 120)
(setq-default tab-width 4)
(setq c-basic-offset 4)

; set auto-complete
(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

;(setenv "PID" nil)
;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

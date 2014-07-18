;------------------------------------------------------------------------------
; This file contains basic settings that I need in every scenario

;------------------------------------------------------------------------------
; Dirtree shows directory tree on left
;------------------------------------------------------------------------------
(require 'dirtree)
(autoload 'dirtree "dirtree" "Add directory to tree view")
;------------------------------------------------------------------------------
; Minimap is sublime-like thing
;------------------------------------------------------------------------------
(require 'minimap)
;; minimap.el
(when (display-graphic-p)
  ;; enable minimap
  (global-set-key (kbd "C-c m") 'minimap-toggle))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minimap-dedicated-window t)
 '(minimap-hide-scroll-bar t)
 '(minimap-window-location (quote right)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;------------------------------------------------------------------------------
; Tabs for documents - extremely handy
;------------------------------------------------------------------------------
(require 'tabbar)
(tabbar-mode t)
;------------------------------------------------------------------------------
; Source code pro is adobe fonts
;------------------------------------------------------------------------------
(set-default-font "Source Code Pro Medium")
(set-face-attribute 'default nil :height 100)
;------------------------------------------------------------------------------
; Wrap lines
;------------------------------------------------------------------------------
(set-default 'truncate-lines nil)
;------------------------------------------------------------------------------
; CUA mode sets ctrl-c/v and that kind of stuff
;------------------------------------------------------------------------------
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)
(set-frame-width (selected-frame) 120)
;------------------------------------------------------------------------------
; TAB
;------------------------------------------------------------------------------
(tool-bar-mode -1)
(setq indent-tabs-mode t)
(setq-default indent-tabs-mode t)
(global-set-key (kbd "TAB") 'self-insert-command)
(setq c-basic-offset 4)
(setq default-tab-width 4)
(setq tab-width 4)
(setq c-basic-indent 4)
;------------------------------------------------------------------------------
; mouse scroll
;------------------------------------------------------------------------------
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
;------------------------------------------------------------------------------
; setting solarized
;------------------------------------------------------------------------------
(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized/")
(setq solarized-distinct-fringe-background t)
(setq solarized-high-contrast-mode-line t)
(setq solarized-contrast 'high)
(setq solarized-visibility 'normal)
(load-theme 'solarized-dark t)
;------------------------------------------------------------------------------
; setting toolbar
;------------------------------------------------------------------------------
(tool-bar-mode -1)
(show-paren-mode 1)
(setq show-paren-delay 0)
;------------------------------------------------------------------------------
; Emacs droppings will be copied to special folder
;------------------------------------------------------------------------------
(setq backup-directory-alist
`((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
`((".*" ,temporary-file-directory t)))
;------------------------------------------------------------------------------
; IDO mode - fuzzy search for files
;------------------------------------------------------------------------------
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ; fuzzy matching is a must have
(define-key minibuffer-local-map [tab] 'minibuffer-complete)
;; This tab override shouldn't be necessary given ido's default 
;; configuration, but minibuffer-complete otherwise dominates the 
;; tab binding because of my custom tab-completion-everywhere 
;; configuration.
(add-hook 'ido-setup-hook (lambda () (define-key ido-completion-map [tab] 'ido-complete)))
;------------------------------------------------------------------------------
; Dedicated windows
;------------------------------------------------------------------------------
(defun toggle-window-dedicated ()
"Toggle whether the current active window is dedicated or not"
(interactive)
(message 
 (if (let (window (get-buffer-window (current-buffer)))
       (set-window-dedicated-p window 
        (not (window-dedicated-p window))))
    "Window '%s' is dedicated"
    "Window '%s' is normal")
 (current-buffer)))
(global-set-key [pause] 'toggle-window-dedicated)
;------------------------------------------------------------------------------
; Set highlight
;------------------------------------------------------------------------------
(require 'highlight-symbol)
(global-set-key [(f4)] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)

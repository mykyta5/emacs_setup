(require 'semantic)
(require 'semantic/db-file)
(require 'semantic/idle)
(require 'semantic/ia)

; turn on semantic and ede
(semantic-mode 1)
(setq semanticdb-minor-mode t)
(global-ede-mode t)
(global-semantic-highlight-func-mode 1)

(require 'semantic/decorate/mode)

;;; tags
(dolist (mode '(c-mode c++-mode))
  (semanticdb-enable-gnu-global-databases mode))

; set auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/ac-dict")
(ac-config-default)

(setq auto-mode-alist (cons '("\.h" . c++-mode) auto-mode-alist))
(global-set-key (kbd "M-o") 'ff-find-other-file)

(setq grep-command "grep -r -n --include=\"*.cpp\" --include=\"*.h\" \"")

;;(load-theme 'cyberpunk t)
;(global-auto-revert-mode t)

(eval-after-load "compile"
  '(progn
	 (setq compilation-scroll-output "first-error")
	 (setq-default compile-command "jom nonoptrelease")))
(global-set-key [f7] 'compile)

;(mapcar
; (lambda (x)
;   (add-to-list 'compilation-error-regexp-alist-alist x))

; (list
  ;; Microsoft C/C++:
  ;;  keyboard.c(537) : warning C4005: 'min' : macro redefinition
  ;;  d:\tmp\test.c(23) : error C2143: syntax error : missing ';' before 'if'
  ;;  .\cppcli1.cpp(36): error C2059: syntax error : 'public'
  ;;  e:\projects\myce40\tok.h(85) : error C2236: unexpected 'class' '$S1'
  ;;  myc.cpp(14) : error C3149: 'class System::String' : illegal use of managed type 'String'; did you forget a '*'?
  ;;   ("\\(\\([a-zA-Z]:\\)?[^:(\t\n]+\\)(\\([0-9]+\\)) ?\: \\(error\\|warning\\) C[0-9]+:" 1 3)
;  '(msvc "^[ \t]*\\([A-Za-z0-9\\.][^(]*\\.\\(cpp\\|c\\|h\\)\\)(\\([0-9]+\\)) *: +\\(error\\|fatal error\\|warning\\) C[0-9]+:" 1 3)

;  ))

;(setq compilation-error-regexp-alist
;      (mapcar 'car compilation-error-regexp-alist-alist))

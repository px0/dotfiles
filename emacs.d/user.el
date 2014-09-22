;; This is where your customizations should live

;; env PATH
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

;; Uncomment the lines below by removing semicolons and play with the
;; values in order to set the width (in characters wide) and height
;; (in lines high) Emacs will have whenever you start it

(setq initial-frame-alist '((top . 0) (left . 0) (width . 150) (height . 80)))
(setq default-frame-alist '((top . 0) (left . 0) (width . 150) (height . 80)))


;; Place downloaded elisp files in this directory. You'll then be able
;; to load them.
;;
;; For example, if you download yaml-mode.el to ~/.emacs.d/vendor,
;; then you can add the following code to this file:
;;
;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;; 
;; Adding this code will make Emacs enter yaml mode whenever you open
;; a .yml file
(add-to-list 'load-path "~/.emacs.d/vendor")

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)


;; my packages!
(defvar max-packages '(auto-complete better-defaults clojure-test-mode cider clojure-mode evil-nerd-commenter evil-paredit evil-visualstar evil goto-last-change highlight-indentation key-chord pkg-info epl cl-lib popup projectile dash rainbow-delimiters s starter-kit-bindings starter-kit-lisp elisp-slime-nav starter-kit magit ido-ubiquitous smex find-file-in-project idle-highlight-mode paredit starter-kit-ruby undo-tree))

(dolist (p max-packages)
  (unless (package-installed-p p)
    (package-install p)))


;; Themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")
;; Uncomment this to increase font size
;; (set-face-attribute 'default nil :height 140)
(load-theme 'tomorrow-night-bright t)

;; Flyspell often slows down editing so it's turned off
(remove-hook 'text-mode-hook 'turn-on-flyspell)

(set-default-font "Source_Code_Pro-13")

(load "~/.emacs.d/vendor/clojure")

;; hippie expand - don't try to complete with file names
(setq hippie-expand-try-functions-list (delete 'try-complete-file-name hippie-expand-try-functions-list))
(setq hippie-expand-try-functions-list (delete 'try-complete-file-name-partially hippie-expand-try-functions-list))

(setq ido-use-filename-at-point nil)

;; Save here instead of littering current directory with emacs backup files
(setq backup-directory-alist `(("." . "~/.saves")))

;; undo!
(define-key global-map (kbd "C-x C-/") 'redo)


;; enable evil mode
(require 'evil)
(evil-mode 1)

;; jk to get out of insert mode
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

(define-key evil-normal-state-map (kbd "q") nil)
(define-key evil-normal-state-map (kbd "RET") (lambda () (interactive) (end-of-line) (newline-and-indent)))
(define-key evil-insert-state-map (kbd "C-e") nil)
(define-key evil-insert-state-map (kbd "C-d") nil)
(define-key evil-insert-state-map (kbd "C-k") nil)
(define-key evil-motion-state-map (kbd "C-e") nil)

(defun smart-open-line-above ()
  "Insert an empty line above the current line.
Position the cursor at it's beginning, according to the current mode."
  (interactive)
  (move-beginning-of-line nil)
  (newline-and-indent)
  (indent-according-to-mode))


(define-key evil-normal-state-map [S-return] 'smart-open-line-above)


;; turn off visual bell
(setq ring-bell-function 'ignore)

;; Statusbar colour depending on mode (evil/emacs/buffer modified)
 (lexical-let ((default-color (cons (face-background 'mode-line)
                                      (face-foreground 'mode-line))))
     (add-hook 'post-command-hook
       (lambda ()
         (let ((color (cond ((minibufferp) default-color)
                            ((evil-insert-state-p) '("#d35400" . "#ffffff"))
                            ((evil-emacs-state-p)  '("#444488" . "#ffffff"))
                            ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
                            (t default-color))))
           (set-face-background 'mode-line (car color))
           (set-face-foreground 'mode-line (cdr color))))))


;; CSS color values colored by themselves
;; http://news.ycombinator.com/item?id=873541

 (defvar hexcolor-keywords
        '(("#[abcdef[:digit:]]\\{3,6\\}"
           (0 (let ((colour (match-string-no-properties 0)))
                (if (or (= (length colour) 4)
                        (= (length colour) 7))
                    (put-text-property 
                     (match-beginning 0)
                     (match-end 0)
                     'face (list :background (match-string-no-properties 0)
                                 :foreground (if (>= (apply '+ (x-color-values 
                                                                (match-string-no-properties 0)))
                                                     (* (apply '+ (x-color-values "white")) .6))
                                                 "black" ;; light bg, dark text
                                               "white" ;; dark bg, light text
                                              )))))
              append))))

(defun hexcolor-add-to-font-lock ()
  (font-lock-add-keywords nil hexcolor-keywords))

(add-hook 'css-mode-hook 'hexcolor-add-to-font-lock)
(add-hook 'emacs-lisp-mode-hook 'hexcolor-add-to-font-lock)


;; always show line numbers
(global-linum-mode t)


(require 'server)
(unless (server-running-p)
  (server-start))


;; Clojure config!
(setq cider-auto-select-error-buffer nil)

;; Autocomplete
(require 'auto-complete-config)
(ac-config-default)
(setq ac-use-fuzzy 1)
(setq ac-auto-start 1)
(setq ac-quick-help-delay 0.5)


(frame-restore-mode)


(defun save-all ()
  (interactive)
  (save-some-buffers t))

;;emacs 24.4 only :-/
(add-hook 'focus-out-hook 'save-all)


;; scrolling
 
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time


;; rainbow parens!
(global-rainbow-delimiters-mode)

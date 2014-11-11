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



;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)


;; Themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")
;; Uncomment this to increase font size
;; (set-face-attribute 'default nil :height 150)
;;(load-theme 'tomorrow-night-bright t)
(load-theme 'obsidian t)





;; nicer show-paren colour
(set-face-foreground 'show-paren-match-face "#3498db")
(set-face-background 'show-paren-match-face nil)
(set-face-attribute 'show-paren-match-face nil
                    :weight 'bold :underline nil :overline nil :slant 'normal) 
(show-paren-mode 1)


;; rainbow parens!
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
;; stronger colors
(require 'cl-lib)
(require 'color)
(require 'paren)
(require 'rainbow-delimiters)
(cl-loop
 for index from 1 to rainbow-delimiters-max-face-count
 do
 (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
   (cl-callf color-saturate-name (face-foreground face) 30)))


;; Flyspell often slows down editing so it's turned off
(remove-hook 'text-mode-hook 'turn-on-flyspell)

;;(set-frame-font "Source Code Pro")


(load "~/.emacs.d/vendor/clojure")

;; hippie expand - don't try to complete with file names
(setq hippie-expand-try-functions-list (delete 'try-complete-file-name hippie-expand-try-functions-list))
(setq hippie-expand-try-functions-list (delete 'try-complete-file-name-partially hippie-expand-try-functions-list))

(setq ido-use-filename-at-point nil)

;; undo!
(define-key global-map (kbd "C-x C-/") 'redo)


;; enable evil mode
;; (add-to-list 'load-path "~/.emacs.d/evil")
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

(undo-tree-mode 1)
(define-key evil-normal-state-map "\C-r" 'undo-tree-redo) ;that got overwritten and i need it!

;; evil surround
(load "~/.emacs.d/vendor/evil-surround")
(require 'evil-surround)
(global-evil-surround-mode 1)

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


;;(frame-restore-mode)
(desktop-save-mode)


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
;; (global-rainbow-delimiters-mode)

;;rainbow blocks!
(load "~/.emacs.d/vendor/rainbow-blocks")
(require 'rainbow-blocks)
(add-hook 'clojure-mode-hook 'rainbow-blocks-mode)



;; split window direction!
(defun window-toggle-split-direction ()
  "Switch window split from horizontally to vertically, or vice versa. i.e. change right window to bottom, or change bottom window to right."
  (interactive)
  (require 'windmove)
  (let ((done))
    (dolist (dirs '((right . down) (down . right)))
      (unless done
        (let* ((win (selected-window))
               (nextdir (car dirs))
               (neighbour-dir (cdr dirs))
               (next-win (windmove-find-other-window nextdir win))
               (neighbour1 (windmove-find-other-window neighbour-dir win))
               (neighbour2 (if next-win (with-selected-window next-win
                                          (windmove-find-other-window neighbour-dir next-win)))))
          ;;(message "win: %s\nnext-win: %s\nneighbour1: %s\nneighbour2:%s" win next-win neighbour1 neighbour2)
          (setq done (and (eq neighbour1 neighbour2)
                          (not (eq (minibuffer-window) next-win))))
          (if done
              (let* ((other-buf (window-buffer next-win)))
                (delete-window next-win)
                (if (eq nextdir 'right)
                    (split-window-vertically)
                  (split-window-horizontally))
                (set-window-buffer (windmove-find-other-window neighbour-dir) other-buf))))))))

(global-set-key (kbd "C-x \\") 'window-toggle-split-direction)

(windmove-default-keybindings) ;Then you can use SHIFT+arrow to move to the next adjacent window in the specified direction.

(global-aggressive-indent-mode)

(delete-selection-mode t) ;;overwrite selection by default. Thank God!





;; disable Emacs Evil selection auto-copies to clipboard
;; Thanks to https://stackoverflow.com/questions/17127009/how-to-disable-emacs-evil-selection-auto-copies-to-clipboard/23254728#23254728

                                        ; Override the default x-select-text function because it doesn't
                                        ; respect x-select-enable-clipboard on OS X.
(defun x-select-text (text))
(setq x-select-enable-clipboard nil)
(setq x-select-enable-primary nil)
(setq mouse-drag-copy-region nil)

(setq interprogram-cut-function 'ns-set-pasteboard)
(setq interprogram-paste-function 'ns-get-pasteboard)





;; Windows

(defun isolate-kill-ring()
  "Isolate Emacs kill ring from OS X system pasteboard.
This function is only necessary in window system."
  (interactive)
  (setq interprogram-cut-function nil)
  (setq interprogram-paste-function nil))

(defun pasteboard-copy()
  "Copy region to OS X system pasteboard."
  (interactive)
  (shell-command-on-region
   (region-beginning) (region-end) "pbcopy"))

(defun pasteboard-paste()
  "Paste from OS X system pasteboard via `pbpaste' to point."
  (interactive)
  (shell-command-on-region
   (point) (if mark-active (mark) (point)) "pbpaste" nil t))

(defun pasteboard-cut()
  "Cut region and put on OS X system pasteboard."
  (interactive)
  (pasteboard-copy)
  (delete-region (region-beginning) (region-end)))

(if window-system
    (progn
      (isolate-kill-ring)
      ;; bind CMD+C to pasteboard-copy
      (global-set-key (kbd "s-c") 'pasteboard-copy)
      ;; bind CMD+V to pasteboard-paste
      (global-set-key (kbd "s-v") 'pasteboard-paste)
      ;; bind CMD+X to pasteboard-cut
      (global-set-key (kbd "s-x") 'pasteboard-cut))

  ;; you might also want to assign some keybindings for non-window
  ;; system usage (i.e., in your text terminal, where the
  ;; command->super does not work)
  )


;; Auto revert buffer if file changed on disk
(global-auto-revert-mode t)

;; ruby/pry
;;(add-to-list 'load-path "~/.emacs.d/vendor/emacs-pry")
;;(require 'pry)

;; save all backups in one directory
(setq backup-directory-alist '(("" . "~/.emacs.d/emacs-backup")))


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


;; better fill column
(setq-default fill-column 160)

(global-company-mode)

;; scrolling
;; (require 'smooth-scrolling)
;;
;; (require 'smooth-scroll)
;; (smooth-scroll-mode t)

(setq mouse-wheel-scroll-amount '(5 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
;; (set-variable ‘scroll-conservatively 5)



;; ;; ;; hopefully make scrolling faster
;;  (setq jit-lock-defer-time 0.10)
;;  (setq redisplay-dont-pause t
;;   scroll-margin 1
;;   scroll-step 1
;;   scroll-conservatively 10000
;;   scroll-preserve-screen-position 1)


;; SQL
(add-hook 'sql-mode-hook 'sqlup-mode)
(add-hook 'sql-interactive-mode-hook 'sqlup-mode)

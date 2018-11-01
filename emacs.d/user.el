;; This is where your customizations should live

;; env PATH
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(add-to-list 'exec-path "/usr/local/bin" "/Applications/Racket\ v6.2/bin")

;; Uncomment the lines below by removing semicolons and play with the
;; values in order to set the width (in characters wide) and height
;; (in lines high) Emacs will have whenever you start it

(setq initial-frame-alist '((top . 1) (left . 1) (width . 156) (height . 81)))
(setq default-frame-alist (copy-alist initial-frame-alist))

;; font 
;;(setq default-frame-alist '((font . "Inconsolata-dz-15")))
;;(set-frame-font "Source Code Pro")
;;(set-face-attribute 'default nil :height 130 :font "Source Code Pro")
;; (set-face-attribute 'default nil :height 140 :font "Source Code Pro Regular")
;;(set-face-attribute 'default nil :font "Anonymous")
;;(set-face-attribute 'default nil :height 140 :font "Envy Code R")
;;(set-face-attribute 'mode-line nil :height 140)

;; Themes
;; UTF-8 ALL THE THINGS!
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setenv "LANG" "en_CA.UTF-8")
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))


;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)


(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")
;; Uncomment this to increase font size
;; (set-face-attribute 'default nil :height 150)
;; (load-theme 'tomorrow-night-bright t)
;; (load-theme 'obsidian t)
(load-theme 'maxi-spacegray t)
;; (load-theme 'maxi-obsidian t)

;; show the menu bar
(menu-bar-mode t)
;; hide scrollbars
(toggle-scroll-bar -1) 
(scroll-bar-mode -1)

;; Just follow git-controlled links without asking
(setq vc-follow-symlinks t)


(setq-default indent-tabs-mode t) ; use tabs



;; nicer show-paren colour
;; (set-face-foreground 'show-paren-match-face "#3498db")
;; (set-face-background 'show-paren-match-face nil)
;; (set-face-attribute 'show-paren-match-face nil
;; 		    :weight 'bold :underline nil :overline nil :slant 'normal) 
(show-paren-mode 1)


;; stronger colors
(require 'cl-lib)
(require 'color)
(require 'paren)
(require 'rainbow-delimiters)
;; (cl-loop
;;  for index from 1 to rainbow-delimiters-max-face-count
;;  do
;;  (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
;;    (cl-callf color-saturate-name (face-foreground face) 30)))

(cl-loop
 for index from 1 to rainbow-delimiters-max-face-count
 do
 (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
   (cl-callf color-saturate-name (face-foreground face) 30)))


 ;; This code will make unmatched parens display in bold red and with a strike through. 
(set-face-attribute 'rainbow-delimiters-unmatched-face nil
                    :foreground 'unspecified
                    :inherit 'error
                    :strike-through t)

(set-face-attribute 'rainbow-delimiters-depth-1-face nil
                    :weight 'bold
		    :foreground "grey50")


;; rainbow parens!
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)


;; Flyspell often slows down editing so it's turned off
;;(remove-hook 'text-mode-hook 'turn-on-flyspell)


;; don't ask about running processes when quitting emacs
(defun set-no-process-query-on-exit ()
  (let ((proc (get-buffer-process (current-buffer))))
    (when (processp proc)
      (set-process-query-on-exit-flag proc nil))))
(add-hook 'term-exec-hook 'set-no-process-query-on-exit)

;; add iedit
;; C-; Edit all occurences of word
;; C-0 C-; Edit occurences of word in function
;; M-; unselect this occurence
;; Tab cycle through occurences
;; M-' show all lines with occurence
(require 'iedit)
(define-key iedit-mode-keymap (kbd "RET") 'iedit-mode) ;leave iedit on return


;; hippie expand - don't try to complete with file names
;; (setq hippie-expand-try-functions-list (delete 'try-complete-file-name hippie-expand-try-functions-list))
;; (setq hippie-expand-try-functions-list (delete 'try-complete-file-name-partially hippie-expand-try-functions-list))

;; (setq ido-use-filename-at-point nil)

;; undo!
(define-key global-map (kbd "C-x C-/") 'redo)

(define-key global-map (kbd "<backtab>") 'ido-switch-buffer)
(define-key global-map (kbd "C-'") 'other-window)
(define-key global-map (kbd "S-'") 'other-frame)

(define-key global-map (kbd "M-<left>") 'previous-buffer)
(define-key global-map (kbd "M-<right>") 'next-buffer)

;; enable evil mode
;; (add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
;; (evil-mode 1)

;; What a shitshow!
(eval-after-load "evil"
  '(define-key evil-insert-state-map (kbd "C-a") nil))


(global-set-key (kbd "M-f") 'evil-forward-word-begin)
(global-set-key (kbd "M-b") 'evil-backward-word-begin)


(setq evil-symbol-word-search t) ;; evil search for symbols (include underscores) instead of word

;; jk to get out of insert mode
(require 'key-chord)
(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.15) ;; increase key-chord delay
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-define-global "jx" 'smex)


;; (key-chord-define evil-normal-state-map "wh" 'evil-window-left)
;; (key-chord-define evil-normal-state-map "wj" 'evil-window-down)
;; (key-chord-define evil-normal-state-map "wk" 'evil-window-up)
;; (key-chord-define evil-normal-state-map "wl" 'evil-window-right)

;; (key-chord-define-global  ",." 'ido-switch-buffer)

;; (define-key evil-normal-state-map (kbd "q") nil)
(define-key evil-normal-state-map (kbd "M-.") nil)
(define-key evil-insert-state-map (kbd "M-.") nil)
(define-key evil-normal-state-map (kbd "RET") (lambda () (interactive) (end-of-line) (newline-and-indent)))
(define-key evil-insert-state-map (kbd "C-e") nil)
(define-key evil-insert-state-map (kbd "C-d") nil)
(define-key evil-insert-state-map (kbd "C-k") nil)
(define-key evil-motion-state-map (kbd "C-e") nil)

(define-key evil-normal-state-map "\C-y" 'yank)
(define-key evil-insert-state-map "\C-y" 'yank)
(define-key evil-visual-state-map "\C-y" 'yank)
(define-key evil-normal-state-map "Q" 'call-last-kbd-macro)
(define-key evil-visual-state-map "Q" 'call-last-kbd-macro)


(require 'avy)
(global-set-key (kbd "s-.") 'avy-goto-word-or-subword-1)
(global-set-key (kbd "C-c j") 'avy-goto-char-2)
(global-set-key (kbd "s-j") 'avy-goto-char-2)
(global-set-key (kbd "s-w") 'ace-window)
(global-set-key (kbd "s-q") 'save-buffers-kill-terminal)


(defun smart-open-line-above ()
  "Insert an empty line above the current line.
Position the cursor at it's beginning, according to the current mode."
  (interactive)
  (move-beginning-of-line nil)
  (newline-and-indent)
  (indent-according-to-mode))


(define-key evil-normal-state-map [S-return] 'smart-open-line-above)
(define-key evil-insert-state-map [S-return] (lambda () (interactive) (end-of-line) (line-and-indent)))

(global-set-key [C-S-return] 'smart-open-line-above)
(global-set-key [S-return] (lambda () (interactive) (end-of-line) (newline-and-indent)))


(global-undo-tree-mode 1)
(define-key evil-normal-state-map "\C-r" 'undo-tree-redo) ;that got overwritten and i need it!
(setq undo-tree-auto-save-history t
      undo-tree-history-directory-alist `(("." . ,(concat user-emacs-directory "undo"))))

;; true -> false. C-/
(load "~/.emacs.d/vendor/rotate-text.el")
(global-set-key (kbd "C-c r")'rotate-word-at-point) ;overwrites 'revert-buffer', which no one wants!
(global-set-key (kbd "C-c t")'rotate-word-at-point) ;overwrites 'revert-buffer', which no one wants!


;; evil surround
;(load "~/.emacs.d/vendor/evil-surround")
(require 'evil-surround)
(global-evil-surround-mode 1)


(require 'evil-leader)
(setq evil-leader/in-all-states 1)
(global-evil-leader-mode)
(evil-leader/set-leader ",")

;; REQUIRES textmate-mode.el
(textmate-mode)
(evil-leader/set-key
  "e" 'ido-find-file
  "b" 'switch-to-buffer
  "t" 'textmate-goto-file
  "T" 'textmate-goto-symbol
  "l" 'goto-line
  "C-T" 'textmate-clear-cache
  "u" 'undo-tree-visualize
  "." 'evil-search-highlight-persist-remove-all
  "x" 'smex
  "h" 'dired-jump
  "v" (lambda () (interactive)(split-window-vertically) (other-window 1))
  "k" 'ido-kill-buffer
  "," 'other-window
  "s" 'pp-eval-last-sexp
  "w" 'save-buffer
  "q" 'kill-buffer-and-window
  "c" 'comment-or-uncomment-region-or-line
  )

;; keep searches until new search
(require 'evil-search-highlight-persist)
;; (global-evil-search-highlight-persist t)

(load "~/.emacs.d/vendor/clojure")

;; expand region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(eval-after-load "evil" '(setq expand-region-contract-fast-key "x"))
(evil-leader/set-key "zz" 'er/expand-region)


;; turn off visual bell
(setq ring-bell-function 'ignore)


;; Change cursor in different modes.
(setq evil-default-cursor 'bar)
(setq evil-normal-state-cursor 'box)
(setq evil-visual-state-cursor 'hollow)
(setq evil-replace-state-cursor 'box)

;; Make movement keys work like they should
(define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
; Make horizontal movement cross lines					  
(setq-default evil-cross-lines t)

;; Keep selection on indent
(defun djoyner/evil-shift-left-visual ()
  (interactive)
  (evil-shift-left (region-beginning) (region-end))
  (evil-normal-state)
  (evil-visual-restore))

(defun djoyner/evil-shift-right-visual ()
  (interactive)
  (evil-shift-right (region-beginning) (region-end))
  (evil-normal-state)
  (evil-visual-restore))

(define-key evil-visual-state-map (kbd ">") 'djoyner/evil-shift-right-visual)
(define-key evil-visual-state-map (kbd "<") 'djoyner/evil-shift-left-visual)
(define-key evil-visual-state-map [tab] 'djoyner/evil-shift-right-visual)
(define-key evil-visual-state-map [S-tab] 'djoyner/evil-shift-left-visual)

(global-set-key (kbd "C-M-c") (lambda () (interactive) (mark-sexp) (pasteboard-copy) (push-mark-command nil)))

; using the meta key to jump between windows
(global-set-key (kbd "M-0") 'delete-window)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-2") (lambda () (interactive)(split-window-vertically) (other-window 1)))
(global-set-key (kbd "M-3") (lambda () (interactive)(split-window-horizontally) (other-window 1)))
;; (global-set-key (kbd "M-o") 'other-window)

; using the C-b to jump between windows
;; (global-set-key (kbd "C-b") 'switch-to-buffer)

					; usable esc
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))(abort-recursive-edit)))

(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(define-key isearch-mode-map [escape] 'isearch-cancel)
(global-set-key [escape] 'keyboard-escape-quit)

;;;; clojure
;; (evil-define-key 'normal cider-mode-map
;;   "q" 'cider-popup-buffer-quit-function)

(evil-define-key 'normal cider-doc-mode-map
  "q" 'cider-popup-buffer-quit-function)

(evil-define-key 'normal cider-stacktrace-mode-map
  "q" 'cider-popup-buffer-quit-function)

(evil-define-key 'normal cider-popup-buffer-mode-map
  "q" 'cider-popup-buffer-quit-function)



;; ;; Statusbar colour depending on mode (evil/emacs/buffer modified)
;; (lexical-let ((default-color (cons (face-background 'mode-line)
;; 				   (face-foreground 'mode-line))))
;;   (add-hook 'post-command-hook
;; 	    (lambda ()
;; 	      (let ((color (cond ((minibufferp) default-color)
;; 				 ((evil-insert-state-p) '("#d35400" . "#ffffff"))
;; 				 ((evil-emacs-state-p)	'("#444488" . "#ffffff"))
;; 				 ((buffer-modified-p)	'("#006fa0" . "#ffffff"))
;; 				 (t default-color))))
;; 		(set-face-background 'mode-line (car color))
;; 		(SET-face-foreground 'mode-line (cdr color))))))


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
;(global-linum-mode t)

(defadvice linum-update-window (around linum-dynamic activate)
  (let* ((w (length (number-to-string
		     (count-lines (point-min) (point-max)))))
	 (linum-format (concat " %" (number-to-string w) "d ")))
    ad-do-it))
(require 'hlinum)
(hlinum-activate)
(require 'linum-off)


;; Make font-locking faster
(setq font-lock-support-mode 'jit-lock-mode)
(setq jit-lock-stealth-time 2
      jit-lock-defer-contextually t
      jit-lock-stealth-nice 0.5)
(setq-default font-lock-multiline t)



(require 'server)
(unless (server-running-p)
  (server-start))

;; Clojure config!
(setq cider-auto-select-error-buffer nil)
(setq cider-show-error-buffer 'except-in-repl)
(setq cider-prompt-for-project-on-connect nil)
(setq cider-known-endpoints '(("localhost" "7002")))
(setq cider-repl-use-pretty-printing t)

;; something else overrode it :(
(eval-after-load 'clojure-mode
  '(progn
     ;; don't override clojure-mode mappings (mostly M-.)
     (evil-make-overriding-map clojure-mode-map nil t)))


;; Append result of evaluating previous expression (Clojure):
(defun cider-eval-last-sexp-and-append ()
  "Evaluate the expression preceding point and append result."
  (interactive)
  (let ((last-sexp (cider-last-sexp)))
    ;; we have to be sure the evaluation won't result in an error
    (cider-eval-and-get-value last-sexp)
    (with-current-buffer (current-buffer)
      (insert ";;=>"))
    (cider-interactive-eval-print last-sexp)))

(eval-after-load 'cider-mode
  '(progn
     ;; (define-key cider-mode-map (kbd "s-i") 'cider-jump-to-var)
     (define-key cider-mode-map (kbd "s-e") 'cider-eval-last-sexp-and-append)
     (define-key cider-mode-map [s-return] 'cider-eval-defun-at-point)
     (define-key cider-mode-map (kbd "s-r") 'cider-switch-to-repl-buffer)
     ))

;; (evil-define-key 'normal cider-mode (kbd "s-i") 'cider-doc)
;; (evil-define-key 'insert cider-mode (kbd "s-i") 'cider-doc)
(add-hook 'cider-repl-mode-hook 
	  (lambda ()
	     (define-key cider-repl-mode-map (kbd "s-r") 'cider-switch-to-last-clojure-buffer)))



;; (eval-after-load 'flycheck '(flycheck-clojure-setup))
;; (add-hook 'after-init-hook #'global-flycheck-mode)
;; (eval-after-load 'flycheck
  ;; '(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages))

;; jack into fighweel once you have an nrepl going
(defun cider-figwheel-repl ()
  (interactive)
  (save-some-buffers)
  (with-current-buffer (cider-current-repl-buffer)
    (goto-char (point-max))
    (insert "(require 'figwheel-sidecar.repl-api)
             (figwheel-sidecar.repl-api/cljs-repl)")
    (cider-repl-return))
  (run-at-time "1 sec" nil #'cider-repl-set-ns (cider-current-ns)) ; takes a moment for the connection to establish
  )

(global-set-key (kbd "C-c C-f") 'cider-figwheel-repl)

(global-set-key (kbd "C-c C-f") 'cider-figwheel-repl)



;; Clojure-Refactor
(require 'clj-refactor)
;; Add custom magic requires.
(dolist (mapping '(("s" . "schema.core")
		   ("schema" . "schema.core")
                   ("log" . "taoensso.timbre")
                   ("match" . "clojure.core.match")))
  
  (add-to-list 'cljr-magic-require-namespaces mapping t))

(add-hook 'clojure-mode-hook (lambda ()
			       (clj-refactor-mode 1)
			       ;; insert keybinding setup here
			       (cljr-add-keybindings-with-prefix "C-c C-m")
			       (cljr-add-keybindings-with-prefix "C-c C-v")))




(global-company-mode)
(add-hook 'after-init-hook 'global-company-mode)
;(global-set-key "\t" 'company-complete-common) ;force auto-complete instead of waiting for the timer
(setq company-dabbrev-downcase nil ;don't dowcase. Stupid idea.
      company-show-numbers t
      company-transformers '(company-sort-by-occurrence)
      company-idle-delay 0.3) 

(push 'company-capf company-backends)
(global-set-key [remap dabbrev-expand] 'hippie-expand)


;;(frame-restore-mode)
;;(desktop-save-mode)

(require 'misc)
;; (global-set-key (kbd "M-f") 'forward-to-word) ;Word forward goes to beginning of a word not to end of one



;;doesn't show the annoying (No files need saving) message in the echo area
;; http://emacs.stackexchange.com/a/7462/2263
(eval-when-compile (require 'cl-lib))
(add-hook 'focus-out-hook
	  (lambda ()
	    (cl-letf (((symbol-function 'message) #'format))
	      (save-some-buffers t))))

;; scrolling

(setq mouse-wheel-scroll-amount '(2 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time



;; rainbow parens!
;; (global-rainbow-delimiters-mode)

;;rainbow blocks!
(load "~/.emacs.d/vendor/rainbow-blocks")
(require 'rainbow-blocks)
(add-hook 'clojure-mode-hook 'rainbow-blocks-mode)



;; winn winn
(winner-mode 1)

;; split window direction!
;; http://whattheemacsd.com/buffer-defuns.el-03.html
(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))

(global-set-key (kbd "M-4") 'toggle-window-split)


(defun rotate-windows (arg)
  "Rotate your windows; use the prefix argument to rotate the other direction"
  (interactive "P")
  (if (not (> (count-windows) 1))
      (message "You can't rotate a single window!")
    (let* ((rotate-times (if (and (numberp arg) (not (= arg 0))) arg 1))
           (direction (if (or (< rotate-times 0) (equal arg '(4)))
                          'reverse
                        (lambda (x) x)))
           (i 0))
      (while (not (= rotate-times 0))
        (while  (< i (- (count-windows) 1))
          (let* ((w1 (elt (funcall direction (window-list)) i))
                 (w2 (elt (funcall direction (window-list)) (+ i 1)))
                 (b1 (window-buffer w1))
                 (b2 (window-buffer w2))
                 (s1 (window-start w1))
                 (s2 (window-start w2))
                 (p1 (window-point w1))
                 (p2 (window-point w2)))
            (set-window-buffer-start-and-point w1 b2 s2 p2)
            (set-window-buffer-start-and-point w2 b1 s1 p1)
            (setq i (1+ i))))

        (setq i 0
              rotate-times
              (if (< rotate-times 0) (1+ rotate-times) (1- rotate-times)))))))

 (defun swap-buffers-in-windows ()
   "Swap buffers between two windows"
   (interactive)
   (if (and swapping-window
            swapping-buffer)
       (let ((this-buffer (current-buffer))
             (this-window (selected-window)))
         (if (and (window-live-p swapping-window)
                  (buffer-live-p swapping-buffer))
             (progn (switch-to-buffer swapping-buffer)
                    (select-window swapping-window)
                    (switch-to-buffer this-buffer)
                    (select-window this-window)
                    (message "Swapped buffers."))
           (message "Old buffer/window killed.  Aborting."))
         (setq swapping-buffer nil)
         (setq swapping-window nil))
     (progn
       (setq swapping-buffer (current-buffer))
       (setq swapping-window (selected-window))
       (message "Buffer and window marked for swapping."))))


;;move focus to newly split frame after creation
(global-set-key "\C-x2" (lambda () (interactive)(split-window-vertically) (other-window 1)))
(global-set-key "\C-x3" (lambda () (interactive)(split-window-horizontally) (other-window 1)))

(windmove-default-keybindings) ;Then you can use SHIFT+arrow to move to the next adjacent window in the specified direction.

;;move border!
(load "~/.emacs.d/vendor/move-border" )
(require 'move-border)
(global-set-key (kbd "s-<up>") 'move-border-up)
(global-set-key (kbd "s-<down>") 'move-border-down)
(global-set-key (kbd "s-<left>") 'move-border-left)
(global-set-key (kbd "s-<right>") 'move-border-right)



;;move text
(require 'move-line)
;;C-S-up/own

(require 'wrap-region)
(wrap-region-mode t)

(electric-indent-mode)
;; (global-aggressive-indent-mode)


(delete-selection-mode t) ;;overwrite selection by default. Thank God!

;; http://whattheemacsd.com/setup-paredit.el-03.html
;; making paredit work with delete-selection-mode
;; (put 'paredit-forward-delete 'delete-selection 'supersede)
;; (put 'paredit-backward-delete 'delete-selection 'supersede)
;; (put 'paredit-open-round 'delete-selection t)
;; (put 'paredit-open-square 'delete-selection t)
;; (put 'paredit-doublequote 'delete-selection t)
;; (put 'paredit-newline 'delete-selection t)


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
(defvar --backup-directory "~/.emacs-backups")
(if (not (file-exists-p --backup-directory))
    (make-directory --backup-directory t))
(setq backup-directory-alist `(("." . ,--backup-directory)))
(setq auto-save-file-name-transforms `((".*" ,--backup-directory t))) ;;autosave to backup dir too!
(setq make-backup-files t		; backup of a file the first time it is saved.
      backup-by-copying t		; don't clobber symlinks
      version-control t			; version numbers for backup files
      delete-old-versions t		; delete excess backup files silently
      delete-by-moving-to-trash t
      kept-old-versions 6		; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 9		; newest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t		; auto-save every buffer that visits a file
      auto-save-timeout 20		; number of seconds idle time before auto-save (default: 30)
      auto-save-interval 200		; number of keystrokes between auto-saves (default: 300)
      )
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

(defun download-to-local (target-path)
  "Download the specified file and change the current file to the local version"
  (interactive (list (let ((insert-default-directory nil))
		       (read-file-name "Save the file to:"))))
  (setq current-line (buffer-substring (point-at-bol) (point-at-eol)))
  (string-match "\\(href\\|src\\)=\"\\(http.+?\\)\"" current-line)
  (setq url (match-string-no-properties 2 current-line))
  (message "url: %s" url)
  (when url  
    (url-copy-file url target-path t)
    (goto-char (string-match "\\(href\\|src\\)=\"\\(http.+?\\)\"" current-line))
    (search-forward url)
    (replace-match target-path nil t)
    (message "%s -> %s" url target-path)))

;; SQL
(add-hook 'sql-mode-hook 'sqlup-mode)
(add-hook 'sql-interactive-mode-hook 'sqlup-mode)



;; jabber
;; http://emacs-jabber.sourceforge.net/manual-0.8.0/
;;================================================================================ 

(defun get-string-from-file (filePath)
  "Return filePath's file content."
  (if (file-exists-p filePath)
      (with-temp-buffer
	(insert-file-contents filePath)
	(buffer-string))
    nil))


(defun chomp (str)
  "Chomp leading and tailing whitespace from STR."
  (if str
      (replace-regexp-in-string (rx (or (: bos (* (any " \t\n")))
					(: (* (any " \t\n")) eos)))
				""
				str)
    nil))



(setq jabber-account-list 
      `(("mgerlach@klick.com"
	 (:password . ,(chomp (get-string-from-file "~/.jabberpasswd")))
	 (:network-server . "talk.google.com")
	 (:connection-type . ssl)
	 (:port . 443))))

;; use history
(setq jabber-history-enabled t
      jabber-use-global-history nil ;per contact history
      jabber-backlog-number 10 ;show 10 last messages 
      jabber-backlog-days 14 ; show messages from last 14 days
      )

(setq jabber-avatar-cache-directory "~/.jabber/jabber-avatar-cache"
      jabber-history-dir "~/.jabber/jabber-history")

;; don't show the avatar
(setq jabber-chat-buffer-show-avatar nil)

;; auto-reconnect if I'm on my work computer
(when (string= system-name "Maximilians-MacBook-Pro-4.local")
  (setq jabber-auto-reconnect 't))

;; don't notify on status
(setq jabber-alert-presence-message-function (lambda (who oldstatus newstatus statustext) nil))

;; i don't care about presence and offline
(setq jabber-alert-presence-hooks nil
      jabber-show-offline-contacts nil)

;;Automatically highlight URLs
;;Here’s a hook which will highlight URLs, and bind C-c RET to open the URL using browse-url
(add-hook 'jabber-chat-mode-hook 'goto-address)


;;================================================================================
;; indentation

(require 'indent-guide)
;; (indent-guide-global-mode)
(setq indent-guide-recursive t)
(set-face-foreground 'indent-guide-face "#2b547e")
(set-face-background 'indent-guide-face nil)
(setq indent-guide-delay 0.2)
(setq indent-guide-char "\u2502")


(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(spaces tabs newline space-mark tab-mark newline-mark face lines-tail))
(setq whitespace-display-mappings
      ;; all numbers are Unicode codepoint in decimal. e.g. (insert-char 182 1)
      '(
		(space-mark nil) ; 32 SPACE, 183 MIDDLE DOT
	(newline-mark 10 [172 10]) ; 10 LINE FEED
	(tab-mark 9 [183 9] [92 9])	; 9 TAB, MIDDLE DOT
	))
(setq whitespace-global-modes '(not org-mode web-mode "Web" emacs-lisp-mode))
;;(global-whitespace-mode)





;; scroll-offset
(setq scroll-margin 2)

;; ================================================================================

;;web mode file association
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.htm?\\'" . web-mode))

(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js?\\'" . js2-mode))


;;js2 mode stuff
(setq js2-strict-missing-semi-warning nil) ;;don't complain about semicolons because i don't want to have to fix all of those
(js2r-add-keybindings-with-prefix "C-c C-m") ;;https://github.com/magnars/js2-refactor.el

(define-key js2-mode-map (kbd "C-k") 'js2r-kill) ; always use semantic kill in js2-mode

;; (setq-default js2-auto-indent-p nil)
(setq-default js2-cleanup-whitespace t)
;; (setq-default js2-enter-indents-newline t)
(setq-default js2-global-externs "jQuery $ _ m")
;; (setq-default js2-indent-on-enter-key t)
;; (setq-default js2-mode-indent-ignore-first-tab t)

(setq-default js2-global-externs '("module" "require" "buster" "sinon" "assert" "refute" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON" "m" "_", "jQuery", "$"))


(require 'flycheck)

(add-hook 'jsx-mode-hook (lambda () (tern-mode t)))

(require 'flycheck)
(flycheck-define-checker jsxhint-checker
  "A JSX syntax and style checker based on JSXHint."
  ;; from https://truongtx.me/2014/03/10/emacs-setup-jsx-mode-and-jsx-syntax-checking/
  :command ("jsxhint" source)
  :error-patterns
  ((error line-start (1+ nonl) ": line " line ", col " column ", " (message) line-end))
  :modes (web-mode js2-mode jsx-mode))

(add-hook 'web-mode-hook
          (lambda ()
            (when (equal web-mode-content-type "jsx")
              ;; enable flycheck
              (flycheck-select-checker 'jsxhint-checker)
              (flycheck-mode))))

;;https://truongtx.me/2014/04/20/emacs-javascript-completion-and-refactoring/
;; npm install -g tern
    ;; M-. Jump to the definition of the thing under the cursor.
    ;; M-, Brings you back to last place you were when you pressed M-..
    ;; C-c C-r Rename the variable under the cursor.
    ;; C-c C-c Find the type of the thing under the cursor.
    ;; C-c C-d Find docs of the thing under the cursor. Press again to open the associated URL (if any).

(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)
      (define-key tern-mode-keymap (kbd "C-c t") 'tern-get-type) 
      (define-key tern-mode-keymap (kbd "C-c C-c") 'skewer-eval-defun)))


;; Add company-tern to allowed company-mode backends list
(add-to-list 'company-backends 'company-tern)
;; If you don't like circles after object's own properties consider less annoying marker for that purpose.
(setq company-tern-property-marker "")



;; paredit for non-lisp langs: https://truongtx.me/2014/02/22/emacs-using-paredit-with-non-lisp-mode/
;; (defun my-paredit-nonlisp ()
;;   "Turn on paredit mode for non-lisps."
;;   (interactive)
;;   (set (make-local-variable 'paredit-space-for-delimiter-predicates)
;;        '((lambda (endp delimiter) nil)))
;;   (paredit-mode 1))

;; (add-hook 'js-mode-hook 'my-paredit-nonlisp) ;use with the above function
;; (add-hook 'js2-mode-hook 'my-paredit-nonlisp) ;use with the above function

;; skewer-mode!!!
;;-------------------------
;; C-x C-e: Evaluate the form before the point and display the result in the minibuffer. If given a prefix argument, insert the result into the current buffer.
;; C-M-x: Evaluate the top-level form around the point.
;; C-c C-k: Load the current buffer.
;; C-c C-z: Select the REPL buffer.

(eval-after-load 'skewer
  '(progn
     (require 'skewer)
     (define-key skewer-mode-keymap (kbd "C-c C-c") 'skewer-eval-defun)))

(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)


;; html-encode
;; http://emacs.stackexchange.com/questions/8166/encode-non-html-characters-to-html-equivalent

(setq web-mode-html-entities
      '(("quot" . 34)
	("amp" . 38)
	("apos" . 39)
	("lt" . 60)
	("gt" . 62)
	("nbsp" . 160)
	("iexcl" . 161)
	("cent" . 162)
	("pound" . 163)
	("curren" . 164)
	("yen" . 165)
	("brvbar" . 166)
	("sect" . 167)
	("uml" . 168)
	("copy" . 169)
	("ordf" . 170)
	("laquo" . 171)
	("not" . 172)
	("shy" . 173)
	("reg" . 174)
	("macr" . 175)
	("deg" . 176)
	("plusmn" . 177)
	("sup2" . 178)
	("sup3" . 179)
	("acute" . 180)
	("micro" . 181)
	("para" . 182)
	("middot" . 183)
	("cedil" . 184)
	("sup1" . 185)
	("ordm" . 186)
	("raquo" . 187)
	("frac14" . 188)
	("frac12" . 189)
	("frac34" . 190)
	("iquest" . 191)
	("Agrave" . 192)
	("Aacute" . 193)
	("Acirc" . 194)
	("Atilde" . 195)
	("Auml" . 196)
	("Aring" . 197)
	("AElig" . 198)
	("Ccedil" . 199)
	("Egrave" . 200)
	("Eacute" . 201)
	("Ecirc" . 202)
	("Euml" . 203)
	("Igrave" . 204)
	("Iacute" . 205)
	("Icirc" . 206)
	("Iuml" . 207)
	("ETH" . 208)
	("Ntilde" . 209)
	("Ograve" . 210)
	("Oacute" . 211)
	("Ocirc" . 212)
	("Otilde" . 213)
	("Ouml" . 214)
	("times" . 215)
	("Oslash" . 216)
	("Ugrave" . 217)
	("Uacute" . 218)
	("Ucirc" . 219)
	("Uuml" . 220)
	("Yacute" . 221)
	("THORN" . 222)
	("szlig" . 223)
	("agrave" . 224)
	("aacute" . 225)
	("acirc" . 226)
	("atilde" . 227)
	("auml" . 228)
	("aring" . 229)
	("aelig" . 230)
	("ccedil" . 231)
	("egrave" . 232)
	("eacute" . 233)
	("ecirc" . 234)
	("euml" . 235)
	("igrave" . 236)
	("iacute" . 237)
	("icirc" . 238)
	("iuml" . 239)
	("eth" . 240)
	("ntilde" . 241)
	("ograve" . 242)
	("oacute" . 243)
	("ocirc" . 244)
	("otilde" . 245)
	("ouml" . 246)
	("divide" . 247)
	("oslash" . 248)
	("Ugrave" . 249)
	("Uacute" . 250)
	("Ucirc" . 251)
	("Uuml" . 252)
	("yacute" . 253)
	("thorn" . 254)
	("yuml" . 255)
	("OElig" . 338)
	("oelig" . 339)
	("Scaron" . 352)
	("scaron" . 353)
	("Yuml" . 376)
	("fnof" . 402)
	("circ" . 710)
	("tilde" . 732)
	("Alpha" . 913)
	("Beta" . 914)
	("Gamma" . 915)
	("Delta" . 916)
	("Epsilon" . 917)
	("Zeta" . 918)
	("Eta" . 919)
	("Theta" . 920)
	("Iota" . 921)
	("Kappa" . 922)
	("Lambda" . 923)
	("Mu" . 924)
	("Nu" . 925)
	("Xi" . 926)
	("Omicron" . 927)
	("Pi" . 928)
	("Rho" . 929)
	("Sigma" . 931)
	("Tau" . 932)
	("Upsilon" . 933)
	("Phi" . 934)
	("Chi" . 935)
	("Psi" . 936)
	("Omega" . 937)
	("alpha" . 945)
	("beta" . 946)
	("gamma" . 947)
	("delta" . 948)
	("epsilon" . 949)
	("zeta" . 950)
	("eta" . 951)
	("theta" . 952)
	("iota" . 953)
	("kappa" . 954)
	("lambda" . 955)
	("mu" . 956)
	("nu" . 957)
	("xi" . 958)
	("omicron" . 959)
	("pi" . 960)
	("rho" . 961)
	("sigmaf" . 962)
	("sigma" . 963)
	("tau" . 964)
	("upsilon" . 965)
	("phi" . 966)
	("chi" . 967)
	("psi" . 968)
	("omega" . 969)
	("thetasym" . 977)
	("Upsih" . 978)
	("piv" . 982)
	("ensp" . 8194)
	("emsp" . 8195)
	("thinsp" . 8201)
	("zwnj" . 8204)
	("zwj" . 8205)
	("lrm" . 8206)
	("rlm" . 8207)
	("ndash" . 8211)
	("mdash" . 8212)
	("lsquo" . 8216)
	("rsquo" . 8217)
	("sbquo" . 8218)
	("ldquo" . 8220)
	("rdquo" . 8221)
	("bdquo" . 8222)
	("dagger" . 8224)
	("Dagger" . 8225)
	("bull" . 8226)
	("hellip" . 8230)
	("permil" . 8240)
	("prime" . 8242)
	("Prime" . 8243)
	("lsaquo" . 8249)
	("rsaquo" . 8250)
	("oline" . 8254)
	("frasl" . 8260)
	("euro" . 8364)
	("image" . 8465)
	("weierp" . 8472)
	("real" . 8476)
	("trade" . 8482)
	("alefsym" . 8501)
	("larr" . 8592)
	("uarr" . 8593)
	("rarr" . 8594)
	("darr" . 8595)
	("harr" . 8596)
	("crarr" . 8629)
	("lArr" . 8656)
	("UArr" . 8657)
	("rArr" . 8658)
	("dArr" . 8659)
	("hArr" . 8660)
	("forall" . 8704)
	("part" . 8706)
	("exist" . 8707)
	("empty" . 8709)
	("nabla" . 8711)
	("isin" . 8712)
	("notin" . 8713)
	("ni" . 8715)
	("prod" . 8719)
	("sum" . 8721)
	("minus" . 8722)
	("lowast" . 8727)
	("radic" . 8730)
	("prop" . 8733)
	("infin" . 8734)
	("ang" . 8736)
	("and" . 8743)
	("or" . 8744)
	("cap" . 8745)
	("cup" . 8746)
	("int" . 8747)
	("there4" . 8756)
	("sim" . 8764)
	("cong" . 8773)
	("asymp" . 8776)
	("ne" . 8800)
	("equiv" . 8801)
	("le" . 8804)
	("ge" . 8805)
	("sub" . 8834)
	("sup" . 8835)
	("nsub" . 8836)
	("sube" . 8838)
	("supe" . 8839)
	("oplus" . 8853)
	("otimes" . 8855)
	("perp" . 8869)
	("sdot" . 8901)
	("lceil" . 8968)
	("rceil" . 8969)
	("lfloor" . 8970)
	("rfloor" . 8971)
	("lang" . 9001)
	("rang" . 9002)
	("loz" . 9674)
	("spades" . 9824)
	("clubs" . 9827)
	("hearts" . 9829)
	("diams" . 9830)))

(defun html-encode-region (start end)
  (interactive "r")
  (let ((count (count-matches "&")))
    (replace-string "&" "&amp;" nil start end)
    (setq end (+ end (* count 4))))
  (dolist (pair web-mode-html-entities)
    (unless (= (cdr pair) 38)
      (let* ((str (char-to-string (cdr pair)))
	     (count (count-matches str start end)))
	(setq end (+ end (* count (1+ (length (car pair))))))
	(replace-string str
			(concat "&" (car pair) ";")
			nil start end)))))



; Upon drag-and-drop: Find the file, w/shift insert filename; w/meta insert file contents
; note that the emacs window must be selected (CMD-TAB) for the modifiers to register
(define-key global-map [M-ns-drag-file] 'ns-insert-file)
(define-key global-map [S-ns-drag-file] 'ns-insert-filename)
(define-key global-map [ns-drag-file] 'ns-find-file-in-frame)

(defun ns-insert-filename ()
  "Insert contents of first element of `ns-input-file' at point."
  (interactive)
  (let ((f (pop ns-input-file)))
    (insert f))
  (if ns-input-file			; any more? Separate by " "
      (insert " ")))

(defun ns-find-file-in-frame ()
  "Do a `find-file' with the `ns-input-file' as argument; staying in frame."
  (interactive)
  (let ((ns-pop-up-frames nil))
    (ns-find-)))


;;-------------------- tagedit

(defun activate-tagedit ()
  (require 'tagedit)
  (tagedit-add-paredit-like-keybindings)
  (tagedit-mode 1))

(add-hook 'html-mode-hook #'activate-tagedit)
(add-hook 'web-mode-hook #'activate-tagedit)


;;-------------------- Comint

					; scroll when running code
(setq comint-prompt-read-only nil)
(setq comint-scroll-to-bottom-on-input t)
(setq comint-scroll-to-bottom-on-output t)
(setq comint-move-point-for-output t)



;;---------------- Prettify symbols

(global-prettify-symbols-mode 1)

(defun javascript-visual-sugar ()
  (push '("return" . ?↩) prettify-symbols-alist)
  (push '("function" . ?λ) prettify-symbols-alist))

(add-hook 'js2-mode-hook 'javascript-visual-sugar)
(add-hook 'javascript-mode-hook 'javascript-visual-sugar)
(add-hook 'web-mode-hook 'javascript-visual-sugar)



;;------------------------------ Snippets

(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"		      ;; personal snippets
	))

(yas-global-mode 1)


;;--------------------------- vimrc
;; Vimrc generic mode
;; http://stackoverflow.com/questions/4236808/syntax-highlight-a-vimrc-file-in-emacs
(define-generic-mode 'vimrc-generic-mode
  '()
  '()
  '(("^[\t ]*:?\\(!\\|ab\\|map\\|unmap\\)[^\r\n\"]*\"[^\r\n\"]*\\(\"[^\r\n\"]*\"[^\r\n\"]*\\)*$"
     (0 font-lock-warning-face))
    ("\\(^\\|[\t ]\\)\\(\".*\\)$"
     (2 font-lock-comment-face))
    ("\"\\([^\n\r\"\\]\\|\\.\\)*\""
     (0 font-lock-string-face)))
  '("/vimrc\\'" "\\.vim\\(rc\\)?\\'")
  '((lambda ()
      (modify-syntax-entry ?\" ".")))
  "Generic mode for Vim configuration files.")


;;------------------ quote/unquote strings
(defun escape-quotes (φbegin φend)
  "Replace 「\"」 by 「\\\"」 in current line or text selection.
See also: `xah-unescape-quotes'
URL `http://ergoemacs.org/emacs/elisp_escape_quotes.html'
Version 2015-05-04"
  (interactive
   (if (use-region-p)
       (list (region-beginning) (region-end))
     (list (line-beginning-position) (line-end-position))))
  (save-excursion
      (save-restriction
        (narrow-to-region φbegin φend)
        (goto-char (point-min))
        (while (search-forward "\"" nil t)
          (replace-match "\\\"" 'FIXEDCASE 'LITERAL)))))

(defun unescape-quotes (φbegin φend)
  "Replace  「\\\"」 by 「\"」 in current line or text selection.
See also: `xah-escape-quotes'
URL `http://ergoemacs.org/emacs/elisp_escape_quotes.html'
Version 2015-05-04"
  (interactive
   (if (use-region-p)
       (list (region-beginning) (region-end))
     (list (line-beginning-position) (line-end-position))))
  (save-excursion
    (save-restriction
      (narrow-to-region φbegin φend)
      (goto-char (point-min))
      (while (search-forward "\\\"" nil t)
        (replace-match "\"" 'FIXEDCASE 'LITERAL)))))

;;------ Load org-mode markdown module
(require 'org)
(require 'ob-tangle) 
(require 'ox-ascii)
(require 'ob)

(setq org-startup-folded 'showall)

(eval-after-load "org"
  '(require 'ox-md nil t))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((sh . t)
   (ditaa . t)
   (plantuml . t)
   (emacs-lisp . t)
   (dot . t)
   (ruby . t)
   ;; (python . t)
   (clojure . t)
   (js . t)
   (dot . t)))

(add-to-list 'org-src-lang-modes (quote ("dot". graphviz-dot)))
(add-to-list 'org-src-lang-modes (quote ("plantuml" . fundamental)))
(add-to-list 'org-babel-tangle-lang-exts '("clojure" . "clj"))

(defvar org-babel-default-header-args:clojure
  '((:results . "silent") (:tangle . "yes")))

(defun org-babel-execute:clojure (body params)
  (lisp-eval-string body)
  "Done!")

(provide 'ob-clojure)

(setq org-src-fontify-natively t
      org-confirm-babel-evaluate nil)

;; reload inline images
(defun shk-fix-inline-images ()
  (when org-inline-image-overlays
    (org-redisplay-inline-images)))

(eval-after-load 'org
  (add-hook 'org-babel-after-execute-hook 'shk-fix-inline-images))

(setq org-startup-with-inline-images t) ;always show inline images

;; Highlight matching paren when it is visible, otherwise highlight the whole expression
(setq show-paren-style 'parentheses)
(setq show-paren-priority -50) ; without this matching parens aren't highlighted in region
(setq show-paren-delay 0)



(require 'ob-plantuml) ;plantuml support
(setq org-plantuml-jar-path (substitute-in-file-name "~/plantuml.jar"))

;; Show unfinished keystrokes early.
(setq echo-keystrokes 0.1)

(global-set-key (kbd "s-b") 'ido-switch-buffer)
(global-set-key (kbd "s-o") 'other-window)


(global-set-key (kbd "M-i") 'imenu)

(setq set-mark-command-repeat-pop t) ;jump back through the mark ring with C-SPC after the initial C-u C-SPC

(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; vertical ido
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)


;; line management
(global-set-key (kbd "s-k") 'kill-whole-line)

(global-set-key "\C-c\C-k" 'copy-line)

(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))

(global-set-key (kbd "C-c D") 'duplicate-line)
(global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "s-f") 'find-file)

(global-set-key (kbd "s-i") 'imenu)


(require 'whole-line-or-region)
(whole-line-or-region-mode)

(global-set-key [S-tab] 'indent-region)
(global-set-key (kbd "M-j") (lambda ()
			      (interactive)
			      (join-line -1)))

;;; vi ci command
(require 'change-inner)
(global-set-key (kbd "M-i") 'change-inner)
(global-set-key (kbd "M-o") 'change-outer)


;; http://endlessparentheses.com/quickly-search-for-occurrences-of-the-symbol-at-point.html?source=rss
(defun endless/isearch-symbol-with-prefix (p)
  "Like isearch, unless prefix argument is provided.
With a prefix argument P, isearch for the symbol at point."
  (interactive "P")
  (let ((current-prefix-arg nil))
    (call-interactively
     (if p #'isearch-forward-symbol-at-point
       #'isearch-forward))))

(global-set-key [remap isearch-forward-regexp] #'endless/isearch-symbol-with-prefix)
(global-set-key (kbd "C-*") #'isearch-forward-symbol-at-point)

;; I may regret this, but set - and _ as being part of a word
(modify-syntax-entry ?_ "w")
(modify-syntax-entry ?- "w")

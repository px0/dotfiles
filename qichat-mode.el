;; -*- lexical-binding: t -*-


;;; major mode for the qichat dialog format

(defvar qichat-mode-hook nil)

(defvar qichat-mode-map
  (let ((map (make-keymap)))
    (define-key map "\C-j" 'newline-and-indent)
    (define-key map "\M-." 'qichat-find-tag)
    map)
  "Keymap for qichat major mode")

(defconst qichat-font-lock-keywords
  (list
   '("#.*$" . font-lock-comment-face) ;comment
   '("todo\\|fixme\\|TODO\\|Todo\\|FIXME" 0 font-lock-builtin-face t)
   '("u[0-9]*:" 0 font-lock-keyword-face t) ;utterances
   '("\\$[0-9A-Za-z_\\-\\./]+" 0 font-lock-constant-face t) ;capture vars
   '("proposal:\\|dynamic:\\|pronunciation:" . font-lock-keyword-face) ;proposal
   '("topic:" . font-lock-keyword-face) ;proposal
   '("language:" . font-lock-keyword-face) ;proposal
   '("include:" . font-lock-keyword-face) ;proposal
   '("concept:" . font-lock-keyword-face) ;concept def
   '("concept:(\\([A-Za-z0-9\\-_]*\\))" 1 font-lock-constant-face) ;concept def name
   '("\\([%\\^][A-Za-z0-9\\-_]*\\)" 1 font-lock-type-face t) ;tags and jumps
   '("~[A-Za-z0-9\\-_]*" 0 font-lock-constant-face t) ; concepts
   '("\\^[A-Za-z0-9\\-_]*(\\([A-Za-z0-9\\-_/]*\\))" 1 font-lock-builtin-face t) ; command args
   '("\\(_\\)\\[.+?]" 1 font-lock-builtin-face t) ; highlight capture
   '("[ \t(\\[]\\([_!]\\)" 1 font-lock-builtin-face t) ; highlight capture for concepts
   '("\\*" 0 font-lock-constant-face t) ; highlight capture for concepts
   '("![A-Za-z0-9\\-_]+" . font-lock-builtin-face) ; negations
   ;; '("\\('[A-Za-z0-9-_]*'\\)" . font-lock-variable-name-face)
   ;; '("\".+?\"". font-lock-string-face)
   )
  "Minimal highlighting expressions for qichat mode")

(defun qichat-indent-line ()
  (interactive)
  (save-excursion
    (beginning-of-line)
    (if (looking-at "^[\t ]*u\\([[:digit:]]+\\):.+")
        (indent-line-to (* default-tab-width
                           (string-to-number (match-string 1))))
      (indent-line-to 0))))

(defvar qichat-mode-syntax-table
  (let ((table (make-syntax-table)))
    ;; TODO somehow add characters that AREN'T part of the symbol such as =
    (modify-syntax-entry ?# "<" table)
    (modify-syntax-entry ?\n ">" table)
    (modify-syntax-entry ?~ "_" table)
    (modify-syntax-entry ?$ "_" table)
    (modify-syntax-entry ?% "_" table)
    (modify-syntax-entry ?_ "_" table)
    (modify-syntax-entry ?^ "_" table)
    table
    ))

(defun qichat-mode ()
  "Major mode for editing Workflow Process Description Language files"
  (interactive)
  (kill-all-local-variables)
  ;; (set-syntax-table qichat-mode-syntax-table)
  (use-local-map qichat-mode-map)

  (set (make-local-variable 'font-lock-defaults) '(qichat-font-lock-keywords ))
  (set (make-local-variable 'indent-line-function) 'qichat-indent-line)

  (set-syntax-table qichat-mode-syntax-table)
  (setq major-mode 'qichat-mode)
  (setq mode-name "QiChat")
  (rainbow-delimiters-mode-enable)
  (highlight-parentheses-mode 1)
  (run-hooks 'qichat-mode-hook))

(provide 'qichat-mode)

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.top\\'" . qichat-mode))



;;; QICHAT COMPANY
(require 'company)

;; concept:(foobar) [myfoo mybar]
;; concept:(test) [test test1]

(defconst qichat-instructions '(
                                "^activate"
                                "^addword"
                                "^clear"
                                "^deactivate"
                                "^exist"
                                "^fallback"
                                "^first"
                                "^goto"
                                "^gotoRandom"
                                "^gotoReactivate"
                                "^mode"
                                "^noPick"
                                "^noStay"
                                "^notExist"
                                "^notInEmbeddedASR"
                                "^previousProposal"
                                "^rand"
                                "^reactivate"
                                "^repeat"
                                "^replace"
                                "^resetOnFocus"
                                "^run"
                                "^runSound"
                                "^runTag"
                                "^runTag"
                                "^sameProposal"
                                "^start"
                                "^startSound"
                                "^startTag"
                                "^stayInScope"
                                "^stop"
                                "^stopSound"
                                "^stopTag"
                                "^switchFocus"
                                "^topicag"
                                "^topicTag"
                                "^wait"
                                "^waitSound"
                                "^waitTag"
                                "^nextProposal"
                         ))

(defun find-concepts ()
  (interactive)
  (let (concepts (list))
    (save-excursion
     (message concepts)
     (while (re-search-backward "concept: *(\\(.+?\\)) *\\(\\[.+\\]\\)" nil t)
       (push `(,(match-string-no-properties 1) . ,(match-string-no-properties 2)) concepts)))
    concepts))

(defun get-completion-strings-for-concepts (arg)
  (let* ((strings-with-information
         (mapcar #'(lambda (c)
                     (let ((concept (car c)))
                       (set-text-properties 0 (length concept) `(:meta ,(cdr c)) concept)
                       concept))
                 (find-concepts)))
         (filtered-strings
          (remove-if-not #'(lambda (c)
                             (let ((arg (substring arg 1)))
                               (if arg
                                 (string-prefix-p arg c)
                                 t)))
                         strings-with-information))
         (filtered-strings-with-tilde
          (mapcar #'(lambda (s)
                      (concat "~" s)) filtered-strings)))
    filtered-strings-with-tilde))

(defun get-completion-strings-for-instructions (arg)
  (remove-if-not #'(lambda (c)
                     (string-prefix-p arg c))
                 qichat-instructions))

(defun get-completion-strings (arg)
  (cond ((string-prefix-p "~" arg) (get-completion-strings-for-concepts arg))
        ((string-prefix-p "^" arg) (get-completion-strings-for-instructions arg))
        (t nil)))


(defun concept-meta (s)
  (get-text-property 1 :meta s))

(defun company-qichat-backend (command &optional arg &rest ignored)
  (interactive (list 'interactive))
  (cl-case command
    (interactive (company-begin-backend 'company-qichat-backend))
    (prefix (when (and (or
                        (string-prefix-p "~" (company-grab-symbol))
                        (string-prefix-p "^" (company-grab-symbol)))
                       (or
                        (eq major-mode 'qichat-mode)
                        (eq major-mode 'emacs-lisp-mode)))
             (company-grab-symbol)))
    (candidates (get-completion-strings arg))
    (meta (concept-meta arg))
    ))

(add-to-list 'company-backends 'company-qichat-backend)


(defun goto-concept (tag)
  (interactive)
  (xref-push-marker-stack)
  (re-search-backward (concat "concept:[[:space:]]*(" tag)))


(defun goto-goto (tag)
  (interactive)
  (message "goto-goto")
  (string-match "\\^go.+?(\\(.+?\\))" tag)
  (let ((jump-target (match-string 0)))
    (xref-push-marker-stack)
    (re-search-backward (concat ?% jump-target))))


(defun qichat-find-tag ()
  (interactive)
  (let* ((tag (symbol-at-point))
        (full-tagstr (match-string-no-properties 0))
        (tagstr (substring full-tagstr 1)))
    (message full-tagstr)

    (cond ((string-prefix-p "~" full-tagstr) (goto-concept tagstr))
          ((string-prefix-p "^" full-tagstr) (goto-goto tagstr))
          (t (message (format "Doesn't work. Tag: %s" tagstr))))
    ))

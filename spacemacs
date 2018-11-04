;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy install
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; go
     ;; nginx
     yaml
     sql
     lua
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     emacs-lisp
     ;; common-lisp
     (git :variables
          git-magit-status-fullscreen t
          git-enable-github-support t
          git-gutter-use-fringe t)
     markdown
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     (clojure :variables
              clojure-enable-fancify-symbols nil
              cider-show-eval-spinner nil
              cider-show-error-buffer 'except-in-repl
              cider-repl-display-in-current-window nil
              nrepl-hide-special-buffers t
              cider-repl-use-pretty-printing t
              cider-repl-wrap-history t
              cider-repl-history-size 3000
              cider-pprint-fn 'fipp
              cider-repl-history-file "~/.cider-history"
              cider-ns-refresh-before-fn "user/stop"
              cider-ns-refresh-after-fn "user/start"
              )

     ;; themes-megapack
     better-defaults
     ruby
     (auto-completion :variables
                      auto-completion-tab-key-behavior nil
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip nil)
     osx
     html
     javascript
     python
     version-control
     ;; plantuml
     ;; graphviz
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      ;; mouse-copy
                                      ;; minimap
                                      smart-tab
                                      js2-refactor
                                      easy-kill
                                      multiple-cursors
                                      smart-forward
                                      ;; hy-mode
                                      ;; align-cljlet
                                      indium
                                      doom-modeline
                                      doom-themes
                                      all-the-icons
                                      )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(skewer-mode
                                    ;; exec-path-from-shell
                                    firebelly-theme
                                    niflheim-theme
                                    pastels-on-dark-theme
                                    tronesque-theme
                                    zonokai-theme
                                    spaceline
                                    )
   ;;
   evil-escape-key-sequence "fd"
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."

  ;; https://github.com/syl20bnr/spacemacs/issues/205
  ;; rm -rf ~/.emacs.d/elpa/{cider,clj-refactor,clojure-mode}* then restart
  ;; actually had to add this to custom-set-variables manually!
  ;; (add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
  ;; (add-to-list 'package-pinned-packages '(clojure-mode . "melpa-stable") t)
  ;; (add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
  ;; (add-to-list 'package-pinned-packages '(clj-refactor . "melpa-stable") t)
  ;; (add-to-list 'package-pinned-packages '(helm-cider . "melpa-stable") t)
  ;; (add-to-list 'package-pinned-packages '(ac-cider . "melpa-stable") t)
  ;; (add-to-list 'package-pinned-packages '(cljr-helm . "melpa-stable") t)

  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading t
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'random
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 15
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         doom-one
                         spacegray
                         monokai
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-SPC"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state 't
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.3
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress  is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar nil
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 100
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 100
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols nil
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling nil
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer
configuration executes. This function is mostly useful for
variables that need to be set before packages are loaded. If you
are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  (setq initial-frame-alist
        '((width . 140) ; character
          (height . 65) ; lines
          ))
  (setq default-frame-alist
        '((width . 140) ; character
          (height . 65) ; lines
          ))

  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs
initialization after layers configuration. This is the place
where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a
package is loaded, you should place you code here."


  (add-to-list 'load-path "~/Dropbox/dotfiles/custom/")

  ;; expand yasnippet using tab  https://github.com/syl20bnr/spacemacs/issues/4245
  (require 'yasnippet)
  (yas-global-mode 1)

  (use-package smart-tab
    :defer nil
    :config
    (setq smart-tab-using-hippie-expand t)
    (global-smart-tab-mode 1))

  (use-package string-edit
    :defer nil
    :bind (("s-m" . string-edit-at-point))
   )

  (use-package doom-modeline
    :defer nil
    :ensure t
    ;; :hook (after-init . doom-modeline-init)
    :config (doom-modeline-init)
    :init (setq doom-modeline-height 20))

  (global-hl-todo-mode nil) ;; don't highlight TODOs because that may lead to performance shit https://github.com/haskell/haskell-mode/issues/1360

  (pixel-scroll-mode 0)
  (scroll-bar-mode -1)

  (setq debug-on-error nil) ; don't always pop up debugger for everything

  ;; (set-face-attribute 'lazy-highlight nil :foreground "black")


  ;; (setq powerline-default-separator nil)
  ;; (require 'spaceline-config)
  ;; (spaceline-emacs-theme)
  ;; (spaceline-spacemacs-theme)

  ;; (setq-default cursor-type 'bar)

  (setq create-lockfiles nil)
  (sp-use-paredit-bindings)
  (delete-selection-mode 1) ; replace highlighted text
  ;; Auto revert buffer if file changed on disk
  (global-auto-revert-mode t)

  (setq set-mark-command-repeat-pop t) ;keep popping mark with C-SPC after initial C-u C-SPC

  ;; helm-for-files configuration
  ;; (setq helm-locate-command "mdfind -name %s %s") ; replace locate with spotlight on Mac

  (use-package helm
    :defer 1
    :bind (:map helm-map
                ([M-delete] . sp-backward-kill-word)
                ([M-backspace] . sp-backward-kill-word)
                ("ESC" . helm-keyboard-quit)
                :map helm-buffer-map
                ("ESC" . helm-keyboard-quit))
    :config
    (setq helm-ff-skip-boring-files t))

  (use-package helm-command
    :defer 2
    :bind (:map helm-M-x-map
                ([M-delete] . sp-backward-kill-word)
                ("ESC" . helm-keyboard-quit)))

  ;; (helm-mode 1)
  ;; (helm-M-x nil) ;load up helm so it works right away

  (setq spacemacs-default-jump-handlers
        (remove 'evil-goto-definition spacemacs-default-jump-handlers))

  (defun umlauts-on()
    "Enable umlauts with opt keys"
    (interactive)
    (setq mac-option-modifier nil)
    )


  (defun umlauts-off()
    "Disable umlauts with opt keys"
    (interactive)
    (setq mac-option-modifier 'meta)
    )



  ;; Save buffers on focus out!
  (defun save-all ()
    (interactive)
    (save-some-buffers t))
  (add-hook 'focus-out-hook 'save-all)

  (defun duplicate-line()
    (interactive)
    (move-beginning-of-line 1)
    (kill-line)
    (yank)
    (open-line 1)
    (next-line 1)
    (yank))

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


  (defun kill-whole-damn-line (&optional arg)
    "Work like dd and if you're at the end of the buffer delete the line before point"
    (interactive "p")
    (let ((endofbufferp (and (eobp) (save-excursion (forward-visible-line 0) (eobp)))))
      (when endofbufferp
        (previous-line)))
    (kill-whole-line))

  (defun eval-and-replace ()
    "Replace the preceding sexp with its value."
    (interactive)
    (backward-kill-sexp)
    (condition-case nil
        (prin1 (eval (read (current-kill 0)))
               (current-buffer))
      (error (message "Invalid expression")
             (insert (current-kill 0)))))

  (global-set-key (kbd "C-c e") 'eval-and-replace)

  ;;   (defun switch-to-previous-buffer
  ;;       "Switch to previously open buffer.
  ;; Repeated invocations toggle between the two most recently open buffers."
  ;;     (interactive)
  ;;     (switch-to-buffer (other-buffer (current-buffer) 1)))

  ;;   (global-set-key (kbd "C-c b") 'switch-to-previous-buffer)
  ;;   (global-set-key (kbd "C-s-b") 'switch-to-previous-buffer)

  (defun align-repeat (start end regexp)
    "Repeat alignment with respect to
     the given regular expression."
    (interactive "r\nsAlign regexp: ")
    (align-regexp start end
                  (concat "\\(\\s-*\\)" regexp) 1 1 t))

  (defun delete-window-or-frame (&optional window frame force)
    (interactive)
    (if (= 1 (length (window-list frame)))
        (spacemacs/frame-killer)
      (delete-window window)))


  (defun kill-buffer-and-window-or-frame (&optional window frame force)
    (interactive)
    (if (= 1 (length (window-list frame)))
        (progn
          (kill-buffer-if-not-modified (current-buffer))
          (spacemacs/frame-killer))
      (kill-buffer-and-window)))


  ;; using the super key to manipulate windows
  (global-set-key (kbd "s-0") 'delete-window)
  (global-set-key (kbd "s-1") 'delete-other-windows)
  (global-set-key (kbd "s-2") (lambda () (interactive)(split-window-vertically) (other-window 1)))
  (global-set-key (kbd "s-3") (lambda () (interactive)(split-window-horizontally) (other-window 1)))

  (global-set-key (kbd "s-<escape>") 'spacemacs/frame-killer)
  (global-set-key (kbd "s-w") 'kill-buffer-and-window-or-frame)

  (global-set-key (kbd "C-x g") 'eww-search-words)
  (global-set-key (kbd "s-/") 'spacemacs/comment-or-uncomment-lines)
  (global-set-key (kbd "s-b") 'helm-for-files)
  (global-set-key (kbd "s-B") 'helm-buffers-list)
  (global-set-key (kbd "s-o") 'other-window)
  (global-set-key (kbd "s-f") 'helm-find-files)
  (global-set-key (kbd "s-F") 'helm-for-files)
  (global-set-key (kbd "s-k") 'kill-whole-damn-line)
  (global-set-key (kbd "s-d") 'duplicate-line)
  (global-set-key (kbd "s-g") 'magit-status)
  (global-set-key (kbd "s-i") 'imenu)
  (global-set-key (kbd "s-\\") 'er/expand-region)
  (global-set-key (kbd "s-'") 'other-frame)
  (global-set-key (kbd "s-p") 'helm-projectile)
  (global-set-key (kbd "s-t") 'helm-browse-project)

  (global-set-key (kbd "M-j") (lambda ()
                                (interactive)
                                (join-line -1)))

  (global-unset-key [S-return]) ;used to be newline-and-indent - now eval function in clojure


  (use-package smart-forward
    :defer 5
    :config
    (global-set-key (kbd "s-<up>") 'smart-up)
    (global-set-key (kbd "s-<down>") 'smart-down)
    (global-set-key (kbd "s-<left>") 'smart-backward)
    (global-set-key (kbd "s-<right>") 'smart-forward))

  ;; don't overwrite clipboard on delete
  ;; https://stackoverflow.com/questions/24196020/how-to-stop-emacs-from-contaminating-the-clipboard
  ;; (setq x-select-enable-clipboard nil)

  (fset 'evil-visual-update-x-selection 'ignore)

  (when (eq system-type 'darwin)
    (setq mac-right-option-modifier 'none))


  ;; Indium / javascript
  ;; http://indium.readthedocs.io/en/latest/code-evaluation.html
  ;; C-x C-e: Evaluate the JavaScript expression preceding the point.
  ;; C-M-x: Evaluate the innermost function enclosing the point.
  ;; C-c M-i: Inspect the result of the evaluation of an expression (see The inspector).
  ;; M-x indium-eval-buffer: Evaluate the entire buffer.

  (use-package indium
    :defer t
    :hook (((js-mode-hook js2-mode-hook) . indium-interaction-mode)
           (js-mode-hook . js2-minor-mode))
    :bind (
           :map indium-interaction-mode-map
           ("C-x C-e" . indium-eval-last-node)
           ("C-x C-e" . indium-eval-last-node)
           ("s-e" . indium-eval--node)
           ("C-c C-z" . indium-switch-to-repl-b)
           ("s-r" . indium-eval-region)
           ("<s-return>" . indium-eval-defun)

           :map indium-repl-mode-map
           ("s-r" . indium-repl-pop-buffer)
           )
    :config
    (spacemacs/declare-prefix-for-mode 'js2-mode "mi" "Indium" "Indium")
    (spacemacs/declare-prefix-for-mode 'js2-mode "ms" "REPL" "REPL")
    (spacemacs/declare-prefix-for-mode 'js2-mode "me" "eval" "eval")
    (spacemacs/set-leader-keys-for-major-mode 'js2-mode
      "sn" 'indium-run-node
      "ss" 'indium-switch-to-repl-buffer
      "ee" 'indium-eval-last-node
      "er" 'indium-eval-region
      "ef" 'indium-eval-defun
      "eb" 'indium-eval-buffer
      )

    (spacemacs/declare-prefix-for-mode 'indium-repl-mode "ms" "repl" "REPL")
    (spacemacs/set-leader-keys-for-major-mode 'indium-repl-mode
      "ss" 'indium-repl-pop-buffer)
    (require 'company-tern)

    (add-to-list 'company-backends 'company-tern)
    (add-hook 'js2-mode-hook (lambda ()
                               (tern-mode)
                               (company-mode)))
    )


  (when (require 'so-long nil :noerror)
    (so-long-enable))

  ;; (require 'indium)

  ;; (add-hook 'js-mode-hook 'indium-interaction-mode)
  ;; (add-hook 'js-mode-hook 'js2-minor-mode)
  ;; (add-hook 'js2-mode-hook 'indium-interaction-mode)

  ;; (add-hook 'indium-interaction-mode-hook
  ;;   (lambda ()
  ;;     (message "loading indium interaction mode")
  ;;     (define-key indium-interaction-mode-map (kbd "C-x C-e") 'indium-eval-last-node)
  ;;     (define-key indium-interaction-mode-map (kbd "C-x C-e") 'indium-eval-last-node)
  ;;     (define-key indium-interaction-mode-map (kbd "s-e") 'indium-eval--node)
  ;;     (define-key indium-interaction-mode-map (kbd "C-c C-z") 'indium-switch-to-repl-buffer)
  ;;     (define-key indium-interaction-mode-map (kbd "s-r") 'indium-eval-region)
  ;;     (define-key indium-interaction-mode-map (kbd "<s-return>") 'indium-eval-defun)))

  ;; (add-hook 'indium-repl-mode
  ;;           (lambda ()
  ;;             (define-key indium-repl-mode-map (kbd "s-r") 'indium-repl-pop-buffer)))


  ;; (spacemacs/declare-prefix-for-mode 'js2-mode "mi" "Indium" "Indium")
  ;; (spacemacs/declare-prefix-for-mode 'js2-mode "ms" "REPL" "REPL")
  ;; (spacemacs/declare-prefix-for-mode 'js2-mode "me" "eval" "eval")
  ;; (spacemacs/set-leader-keys-for-major-mode 'js2-mode
  ;;   "sn" 'indium-run-node
  ;;   "ss" 'indium-switch-to-repl-buffer
  ;;   "ee" 'indium-eval-last-node
  ;;   "er" 'indium-eval-region
  ;;   "ef" 'indium-eval-defun
  ;;   "eb" 'indium-eval-buffer
  ;;   )

  ;; (spacemacs/declare-prefix-for-mode 'indium-repl-mode "ms" "repl" "REPL")
  ;; (spacemacs/set-leader-keys-for-major-mode 'indium-repl-mode
  ;;   "ss" 'indium-repl-pop-buffer
  ;;   )


  ;; (require 'company-tern)

  ;; (add-to-list 'company-backends 'company-tern)
  ;; (add-hook 'js2-mode-hook (lambda ()
  ;;                            (tern-mode)
  ;;                            (company-mode)))


  ;; Keyboard smooth scrolling: Prevent the awkward "snap to re-center" when
  ;; the text cursor moves off-screen. Instead, only scroll the minimum amount
  ;; necessary to show the new line. (A number of 101+ disables re-centering.)
  (setq scroll-conservatively 101)

  ;; Optimize mouse wheel scrolling for smooth-scrolling trackpad use.
  ;; Trackpads send a lot more scroll events than regular mouse wheels,
  ;; so the scroll amount and acceleration must be tuned to smooth it out.
  (setq
   ;; If the frame contains multiple windows, scroll the one under the cursor
   ;; instead of the one that currently has keyboard focus.
   mouse-wheel-follow-mouse 't
   ;; Completely disable mouse wheel acceleration to avoid speeding away.
   mouse-wheel-progressive-speed nil
   ;; The most important setting of all! Make each scroll-event move 2 lines at
   ;; a time (instead of 5 at default). Simply hold down shift to move twice as
   ;; fast, or hold down control to move 3x as fast. Perfect for trackpads.
   ;; mouse-wheel-scroll-amount '(5 ((shift) . 4) ((control) . 6))
   )

  (use-package python-mode
    :defer t
    :init
    (defun python-shell-send-current-line-or-region ()
      (interactive)
      (if (use-region-p)
          (python-shell-send-region (region-beginning) (region-end))
        (python-shell-send-region (line-beginning-position) (line-end-position))))
    :bind ((:map python-mode-map
                 ("s-e" . python-shell-send-current-line-or-region)
                 ("s-r" . python-shell-switch-to-shell)
                 ("s-<return>" . python-shell-send-defun))
           (:map inferior-python-mode-map
                 ("s-r" . other-window ))))


  (use-package rotate-text
    :defer t
    :bind ("S-<tab>" . rotate-text)
    :config (setq rotate-text-words '(("width" "height")
                                      ("left" "right" "top" "bottom")
                                      ("true" "false")
                                      ("error" "warning" "info")
                                      ("nil" "t")
                                      ("yes" "no")
                                      ("on" "off")
                                      ("and" "or")
                                      (">" "<" "<=" ">=" "=" "==")
                                      ("+" "-")
                                      ("first" "last")
                                      ("add" "remove")
                                      ("active" "inactive")
                                      ("&&" "||")
                                      ("x" "y")
                                      )))

  ;; copy SEXP with mouse
  (use-package mouse-copy
    :defer 2
    :bind (:map mouse-mode-map
                ([C-M-mouse-1] . mouse-copy-sexp-under-mouse)
                ([C-M-drag-mouse-1] . mouse-yank-sexp-to-point)
                ([C-M-down-mouse-1] . ignore))
    :config (defun mouse-copy-sexp-under-mouse (start-event)
              "Copy the sexp under mouse"
              (interactive "*e")
              (mouse-copy-sexp-at-mouse start-event
                                        (lambda (sexp)
                                          (clipboard-kill-ring-save (beginning-of-thing 'sexp) (end-of-thing 'sexp))
                                          (message (concat "copied: " sexp))))))



;;; Auto complete
  ;; I got so annoyed by accidental auto completion on space and C-f that I'm remapping it
  (use-package company
    :defer t
    :config
    (define-key company-active-map (kbd "C-f") nil)
    (define-key company-active-map (kbd "SPC") nil)
    (define-key company-active-map (kbd "<space>") nil))

  (use-package web-mode
    :defer t
    :config
    ;;(echo "overwriting idiotic fucking default")
    (set (make-local-variable 'company-minimum-prefix-length) 3)

    ;;(echo "overwriting idiotic fucking default")
    (defun spacemacs//company-web-minimum-prefix-length ()
      "Set company minimum prefix length to 0 for the current buffer only."
      (set (make-local-variable 'company-minimum-prefix-length) 2)))



 ;;; easy-kill / easy-mark
  ;;; https://github.com/leoliu/easy-kill
  (global-set-key [remap kill-ring-save] 'easy-kill)
  (global-set-key [remap mark-sexp] 'easy-mark)

  ;;; CIDER
  (use-package cider
    :defer t
    :config
    ;; (define-key cider-mode-map (kbd "s-i") 'cider-jump-to-var)
    (define-key cider-mode-map (kbd "s-E") 'cider-eval-last-sexp-to-repl)
    (define-key cider-mode-map (kbd "s-e") 'cider-insert-last-sexp-in-repl)
    (define-key cider-mode-map (kbd "s-I") 'cider-inspect-last-result)

    (define-key cider-mode-map [s-return] 'cider-eval-defun-at-point)
    (define-key cider-mode-map (kbd "s-r") 'cider-switch-to-repl-buffer)

    (setq cljr-warn-on-eval nil)

    (add-hook 'cider-repl-mode-hook
              (lambda ()
                (define-key cider-repl-mode-map (kbd "s-r") 'cider-switch-to-last-clojure-buffer)
                )))




  ;; Do not write anything past this comment. This is where Emacs will
  ;; auto-generate custom variable definitions.
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(cider-cljs-lein-repl
     "(do (use 'figwheel-sidecar.repl-api) (start-figwheel!) (cljs-repl))")
   '(clojure-align-forms-automatically t)
   '(command-log-mode-auto-show t)
   '(custom-safe-themes
     (quote
      ("6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "b54826e5d9978d59f9e0a169bbd4739dd927eead3ef65f56786621b53c031a7c" "6b289bab28a7e511f9c54496be647dc60f5bd8f9917c9495978762b99d8c96a0" "4697a2d4afca3f5ed4fdf5f715e36a6cac5c6154e105f3596b44a4874ae52c45" "151bde695af0b0e69c3846500f58d9a0ca8cb2d447da68d7fbf4154dcf818ebc" "b24ee45778296405489a56484d90901150b32e99c6dc48394184a745491d92f9" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "b35a14c7d94c1f411890d45edfb9dc1bd61c5becd5c326790b51df6ebf60f402" "2c88b703cbe7ce802bf6f0bffe3edbb8d9ec68fc7557089d4eaa1e29f7529fe1" "1c082c9b84449e54af757bcae23617d11f563fc9f33a832a8a2813c4d7dfb652" "876fe28b6263ef36feeff1fa10db90a08ed899d1c6505b1d040d556db8ed0d2d" "aae95fc700f9f7ff70efbc294fc7367376aa9456356ae36ec234751040ed9168" "a566448baba25f48e1833d86807b77876a899fc0c3d33394094cf267c970749f" "cc60d17db31a53adf93ec6fad5a9cfff6e177664994a52346f81f62840fe8e23" "9fe1540491fcf692b8c639a3abacd32b29233bc4cb834a12a0fd1e01cbd0a128" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "9d9fda57c476672acd8c6efeb9dc801abea906634575ad2c7688d055878e69d6" "5c72f78946231d45962c8cc2d054b0a437a9385982576d669c07c8e92afeff64" "8891c81848a6cf203c7ac816436ea1a859c34038c39e3cf9f48292d8b1c86528" "bc40f613df8e0d8f31c5eb3380b61f587e1b5bc439212e03d4ea44b26b4f408a" "b825687675ea2644d1c017f246077cdd725d4326a1c11d84871308573d019f67" "a4d03266add9a1c8f12b5309612cbbf96e1291773c7bc4fb685bfdaf83b721c6" "5f4e4c9f5de8156f964fdf8a1b8f8f659efbfeff88b38f49ce13953a84272b77" "28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53" "3a3de615f80a0e8706208f0a71bbcc7cc3816988f971b6d237223b6731f91605" "93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "4f2ede02b3324c2f788f4e0bad77f7ebc1874eff7971d2a2c9b9724a50fb3f65" "51e228ffd6c4fff9b5168b31d5927c27734e82ec61f414970fc6bcce23bc140d" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "086970da368bb95e42fd4ddac3149e84ce5f165e90dfc6ce6baceae30cf581ef" "d61fc0e6409f0c2a22e97162d7d151dee9e192a90fa623f8d6a071dbf49229c6" "9deeab438d1d798c26d41c759d74a2406802427ff6acb7dec8cec961bcb4e7d5" "6a23db7bccf6288fd7c80475dc35804c73f9c9769ad527306d2e0eada1f8b466" "47744f6c8133824bdd104acc4280dbed4b34b85faa05ac2600f716b0226fb3f6" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "e9460a84d876da407d9e6accf9ceba453e2f86f8b86076f37c08ad155de8223c" "8ed752276957903a270c797c4ab52931199806ccd9f0c3bb77f6f4b9e71b9272" "93424058c115aa8d100667cbd8f324ac5cb239c007cfb5b5614bfc7d231e5776" "5c6d40ef6e7bbe9e83dc0e32db794c7e9a6a0d9eb7d6a874aaf9744c053842b4" "b34636117b62837b3c0c149260dfebe12c5dad3d1177a758bb41c4b15259ed7e" "cfe1bf82795545c5a7b76cde32663035c27e436db8bd8866b4501bad1eee271c" "c806912d706db590cde0483f0ec90db69bc5ce5da1d8846462d7c20aecb3dcda" "959a77d21e6f15c5c63d360da73281fdc40db3e9f94e310fc1e8213f665d0278" "4f5bb895d88b6fe6a983e63429f154b8d939b4a8c581956493783b2515e22d6d" "cedd3b4295ac0a41ef48376e16b4745c25fa8e7b4f706173083f16d5792bb379" "71ecffba18621354a1be303687f33b84788e13f40141580fa81e7840752d31bf" "b571f92c9bfaf4a28cb64ae4b4cdbda95241cd62cf07d942be44dc8f46c491f4" "a2e7b508533d46b701ad3b055e7c708323fb110b6676a8be458a758dd8f24e27" "2d16f85f22f1841390dfc1234bd5acfcce202d9bb1512aa8eabd0068051ac8c3" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "d8f76414f8f2dcb045a37eb155bfaa2e1d17b6573ed43fb1d18b936febc7bbc2" "38ba6a938d67a452aeb1dada9d7cdeca4d9f18114e9fc8ed2b972573138d4664" "7f5837a7dbf54c2b7c41d94f5eb1373cf63274847d1971037faa24d7f2231eea" default)))
   '(evil-want-Y-yank-to-eol t)
   '(inf-clojure-generic-cmd "/usr/local/bin/lumo -d")
   '(inf-clojure-lein-cmd "/usr/local/bin/lumo -d")
   '(inf-clojure-source-modes (quote (clojure-mode clojurescript-mode)))
   '(js2-strict-missing-semi-warning nil)
   '(js2-strict-trailing-comma-warning nil)
   '(magit-diff-section-arguments (quote ("--ignore-space-change" "--no-ext-diff")))
   '(package-archives
     (quote
      (("melpa-stable" . "http://stable.melpa.org/packages/")
       ("melpa" . "https://melpa.org/packages/")
       ("org" . "http://orgmode.org/elpa/")
       ("gnu" . "https://elpa.gnu.org/packages/"))))
   '(package-selected-packages
     (quote
      (smart-tab esup eldoc-eval shrink-path doom-modeline treepy graphql sesman nimbus-theme distinguished-theme doom-themes atom-one-dark-theme atom-dark-theme highlight-refontification white-sand-theme rebecca-theme org-mime exotica-theme nginx-mode let-alist ghub yaml-mode gntp json-snatcher json-reformat parent-mode gitignore-mode fringe-helper git-gutter+ pos-tip flx goto-chg web-completion-data edn peg eval-sexp-fu pkg-info epl pythonic arduino-mode org-category-capture queue tide typescript-mode persp-mode sourcemap memoize undo-tree align-cljlet indium perspective format-sql sql-indent winum unfill solarized-theme log4e madhat2r-theme fuzzy diminish haml-mode go-guru go-eldoc company-go go-mode forth-mode autothemer bind-key fireplace seq websocket sequences minimap inflections csv-mode org pcache spinner pcre2el vimrc-mode dactyl-mode slime-company slime common-lisp-snippets lua-mode graphviz-dot-mode pug-mode plantuml-mode minitest hide-comnt js-comint nodejs-repl yapfify uuidgen rake py-isort osx-dictionary org-projectile org-download mwim livid-mode skewer-mode simple-httpd live-py-mode link-hint git-link eyebrowse evil-visual-mark-mode evil-unimpaired evil-ediff eshell-z dumb-jump darkokai-theme column-enforce-mode clojure-snippets jade xref-js2 eimp epresent command-log-mode showkey request powerline alert markdown-mode js2-mode projectile git-gutter magit magit-popup iedit dash-functional tern inf-ruby packed anaconda-mode auto-complete avy hydra cider multiple-cursors paredit yasnippet company anzu smartparens highlight flycheck git-commit with-editor helm popup helm-core async clojure-mode f s dash expand-region package-build bind-map evil beacon zonokai-theme zenburn-theme zen-and-art-theme xterm-color ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stekene-theme spacemacs-theme spaceline spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smooth-scrolling smeargle smart-forward slim-mode shell-pop seti-theme scss-mode sass-mode rvm ruby-tools rubocop rspec-mode robe reverse-theme reveal-in-osx-finder restart-emacs rbenv rainbow-delimiters railscasts-theme pyvenv pytest pyenv-mode py-yapf purple-haze-theme professional-theme popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme pbcopy pastels-on-dark-theme paradox page-break-lines osx-trash orgit organic-green-theme org-repo-todo org-present org-pomodoro org-plus-contrib org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow macrostep lush-theme lorem-ipsum linum-relative light-soap-theme leuven-theme less-css-mode launchctl json-mode js2-refactor js-doc jbeans-theme jazz-theme jade-mode ir-black-theme inkpot-theme info+ inf-clojure indent-guide ido-vertical-mode hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-gutter-fringe git-gutter-fringe+ gh-md gandalf-theme flycheck-pos-tip flx-ido flatui-theme flatland-theme firebelly-theme fill-column-indicator farmhouse-theme fancy-battery exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu espresso-theme eshell-prompt-extras esh-help emmet-mode elisp-slime-nav easy-kill dracula-theme django-theme diff-hl define-word darktooth-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme company-web company-tern company-statistics company-quickhelp company-anaconda colorsarenice-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode clues-theme clj-refactor clean-aindent-mode cider-eval-sexp-fu chruby cherry-blossom-theme busybee-theme bundler buffer-move bubbleberry-theme bracketed-paste birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
   '(paradox-github-token t)
   '(split-height-threshold nil)
   '(vc-follow-symlinks t))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   ))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-cljs-lein-repl
   "(do (use 'figwheel-sidecar.repl-api) (start-figwheel!) (cljs-repl))")
 '(clojure-align-forms-automatically t)
 '(command-log-mode-auto-show t)
 '(custom-safe-themes
   (quote
    ("6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "b54826e5d9978d59f9e0a169bbd4739dd927eead3ef65f56786621b53c031a7c" "6b289bab28a7e511f9c54496be647dc60f5bd8f9917c9495978762b99d8c96a0" "4697a2d4afca3f5ed4fdf5f715e36a6cac5c6154e105f3596b44a4874ae52c45" "151bde695af0b0e69c3846500f58d9a0ca8cb2d447da68d7fbf4154dcf818ebc" "b24ee45778296405489a56484d90901150b32e99c6dc48394184a745491d92f9" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "b35a14c7d94c1f411890d45edfb9dc1bd61c5becd5c326790b51df6ebf60f402" "2c88b703cbe7ce802bf6f0bffe3edbb8d9ec68fc7557089d4eaa1e29f7529fe1" "1c082c9b84449e54af757bcae23617d11f563fc9f33a832a8a2813c4d7dfb652" "876fe28b6263ef36feeff1fa10db90a08ed899d1c6505b1d040d556db8ed0d2d" "aae95fc700f9f7ff70efbc294fc7367376aa9456356ae36ec234751040ed9168" "a566448baba25f48e1833d86807b77876a899fc0c3d33394094cf267c970749f" "cc60d17db31a53adf93ec6fad5a9cfff6e177664994a52346f81f62840fe8e23" "9fe1540491fcf692b8c639a3abacd32b29233bc4cb834a12a0fd1e01cbd0a128" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "9d9fda57c476672acd8c6efeb9dc801abea906634575ad2c7688d055878e69d6" "5c72f78946231d45962c8cc2d054b0a437a9385982576d669c07c8e92afeff64" "8891c81848a6cf203c7ac816436ea1a859c34038c39e3cf9f48292d8b1c86528" "bc40f613df8e0d8f31c5eb3380b61f587e1b5bc439212e03d4ea44b26b4f408a" "b825687675ea2644d1c017f246077cdd725d4326a1c11d84871308573d019f67" "a4d03266add9a1c8f12b5309612cbbf96e1291773c7bc4fb685bfdaf83b721c6" "5f4e4c9f5de8156f964fdf8a1b8f8f659efbfeff88b38f49ce13953a84272b77" "28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53" "3a3de615f80a0e8706208f0a71bbcc7cc3816988f971b6d237223b6731f91605" "93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "4f2ede02b3324c2f788f4e0bad77f7ebc1874eff7971d2a2c9b9724a50fb3f65" "51e228ffd6c4fff9b5168b31d5927c27734e82ec61f414970fc6bcce23bc140d" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "086970da368bb95e42fd4ddac3149e84ce5f165e90dfc6ce6baceae30cf581ef" "d61fc0e6409f0c2a22e97162d7d151dee9e192a90fa623f8d6a071dbf49229c6" "9deeab438d1d798c26d41c759d74a2406802427ff6acb7dec8cec961bcb4e7d5" "6a23db7bccf6288fd7c80475dc35804c73f9c9769ad527306d2e0eada1f8b466" "47744f6c8133824bdd104acc4280dbed4b34b85faa05ac2600f716b0226fb3f6" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "e9460a84d876da407d9e6accf9ceba453e2f86f8b86076f37c08ad155de8223c" "8ed752276957903a270c797c4ab52931199806ccd9f0c3bb77f6f4b9e71b9272" "93424058c115aa8d100667cbd8f324ac5cb239c007cfb5b5614bfc7d231e5776" "5c6d40ef6e7bbe9e83dc0e32db794c7e9a6a0d9eb7d6a874aaf9744c053842b4" "b34636117b62837b3c0c149260dfebe12c5dad3d1177a758bb41c4b15259ed7e" "cfe1bf82795545c5a7b76cde32663035c27e436db8bd8866b4501bad1eee271c" "c806912d706db590cde0483f0ec90db69bc5ce5da1d8846462d7c20aecb3dcda" "959a77d21e6f15c5c63d360da73281fdc40db3e9f94e310fc1e8213f665d0278" "4f5bb895d88b6fe6a983e63429f154b8d939b4a8c581956493783b2515e22d6d" "cedd3b4295ac0a41ef48376e16b4745c25fa8e7b4f706173083f16d5792bb379" "71ecffba18621354a1be303687f33b84788e13f40141580fa81e7840752d31bf" "b571f92c9bfaf4a28cb64ae4b4cdbda95241cd62cf07d942be44dc8f46c491f4" "a2e7b508533d46b701ad3b055e7c708323fb110b6676a8be458a758dd8f24e27" "2d16f85f22f1841390dfc1234bd5acfcce202d9bb1512aa8eabd0068051ac8c3" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "d8f76414f8f2dcb045a37eb155bfaa2e1d17b6573ed43fb1d18b936febc7bbc2" "38ba6a938d67a452aeb1dada9d7cdeca4d9f18114e9fc8ed2b972573138d4664" "7f5837a7dbf54c2b7c41d94f5eb1373cf63274847d1971037faa24d7f2231eea" default)))
 '(evil-want-Y-yank-to-eol t)
 '(inf-clojure-generic-cmd "/usr/local/bin/lumo -d")
 '(inf-clojure-lein-cmd "/usr/local/bin/lumo -d")
 '(inf-clojure-source-modes (quote (clojure-mode clojurescript-mode)))
 '(js2-strict-missing-semi-warning nil)
 '(js2-strict-trailing-comma-warning nil)
 '(magit-diff-section-arguments (quote ("--ignore-space-change" "--no-ext-diff")))
 '(package-archives
   (quote
    (("melpa-stable" . "http://stable.melpa.org/packages/")
     ("melpa" . "https://melpa.org/packages/")
     ("org" . "http://orgmode.org/elpa/")
     ("gnu" . "https://elpa.gnu.org/packages/"))))
 '(package-selected-packages
   (quote
    (markdown-mode solaire-mode smart-tab esup eldoc-eval shrink-path doom-modeline treepy graphql sesman nimbus-theme distinguished-theme doom-themes atom-one-dark-theme atom-dark-theme highlight-refontification white-sand-theme rebecca-theme org-mime exotica-theme nginx-mode let-alist ghub yaml-mode gntp json-snatcher json-reformat parent-mode gitignore-mode fringe-helper git-gutter+ pos-tip flx goto-chg web-completion-data edn peg eval-sexp-fu pkg-info epl pythonic arduino-mode org-category-capture queue tide typescript-mode persp-mode sourcemap memoize undo-tree align-cljlet indium perspective format-sql sql-indent winum unfill solarized-theme log4e madhat2r-theme fuzzy diminish haml-mode go-guru go-eldoc company-go go-mode forth-mode autothemer bind-key fireplace seq websocket sequences minimap inflections csv-mode org pcache spinner pcre2el vimrc-mode dactyl-mode slime-company slime common-lisp-snippets lua-mode graphviz-dot-mode pug-mode plantuml-mode minitest hide-comnt js-comint nodejs-repl yapfify uuidgen rake py-isort osx-dictionary org-projectile org-download mwim livid-mode skewer-mode simple-httpd live-py-mode link-hint git-link eyebrowse evil-visual-mark-mode evil-unimpaired evil-ediff eshell-z dumb-jump darkokai-theme column-enforce-mode clojure-snippets jade xref-js2 eimp epresent command-log-mode showkey request powerline alert js2-mode projectile git-gutter magit magit-popup iedit dash-functional tern inf-ruby packed anaconda-mode auto-complete avy hydra cider multiple-cursors paredit yasnippet company anzu smartparens highlight flycheck git-commit with-editor helm popup helm-core async clojure-mode f s dash expand-region package-build bind-map evil beacon zonokai-theme zenburn-theme zen-and-art-theme xterm-color ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stekene-theme spacemacs-theme spaceline spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smooth-scrolling smeargle smart-forward slim-mode shell-pop seti-theme scss-mode sass-mode rvm ruby-tools rubocop rspec-mode robe reverse-theme reveal-in-osx-finder restart-emacs rbenv rainbow-delimiters railscasts-theme pyvenv pytest pyenv-mode py-yapf purple-haze-theme professional-theme popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme pbcopy pastels-on-dark-theme paradox page-break-lines osx-trash orgit organic-green-theme org-repo-todo org-present org-pomodoro org-plus-contrib org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme majapahit-theme magit-gitflow macrostep lush-theme lorem-ipsum linum-relative light-soap-theme leuven-theme less-css-mode launchctl json-mode js2-refactor js-doc jbeans-theme jazz-theme jade-mode ir-black-theme inkpot-theme info+ inf-clojure indent-guide ido-vertical-mode hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-gutter-fringe git-gutter-fringe+ gh-md gandalf-theme flycheck-pos-tip flx-ido flatui-theme flatland-theme firebelly-theme fill-column-indicator farmhouse-theme fancy-battery exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu espresso-theme eshell-prompt-extras esh-help emmet-mode elisp-slime-nav easy-kill dracula-theme django-theme diff-hl define-word darktooth-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme company-web company-tern company-statistics company-quickhelp company-anaconda colorsarenice-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode clues-theme clj-refactor clean-aindent-mode cider-eval-sexp-fu chruby cherry-blossom-theme busybee-theme bundler buffer-move bubbleberry-theme bracketed-paste birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(paradox-github-token t)
 '(split-height-threshold nil)
 '(vc-follow-symlinks t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

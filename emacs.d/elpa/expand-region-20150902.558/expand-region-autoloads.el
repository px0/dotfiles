;;; expand-region-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "../../../Dropbox/dotfiles/emacs.d/elpa/expand-region-20150902.558/expand-region"
;;;;;;  "expand-region.el" "8ab9f19242b201916e5e818d59b32661")
;;; Generated autoloads from expand-region.el

(autoload 'er/expand-region "../../../Dropbox/dotfiles/emacs.d/elpa/expand-region-20150902.558/expand-region" "\
Increase selected region by semantic units.

With prefix argument expands the region that many times.
If prefix argument is negative calls `er/contract-region'.
If prefix argument is 0 it resets point and mark to their state
before calling `er/expand-region' for the first time.

\(fn ARG)" t nil)

;;;***

;;;### (autoloads nil "../../../Dropbox/dotfiles/emacs.d/elpa/expand-region-20150902.558/expand-region-custom"
;;;;;;  "expand-region-custom.el" "961542bd7ad7d0594e2042ce8420f634")
;;; Generated autoloads from expand-region-custom.el

(let ((loads (get 'expand-region 'custom-loads))) (if (member '"../../../Dropbox/dotfiles/emacs.d/elpa/expand-region-20150902.558/expand-region-custom" loads) nil (put 'expand-region 'custom-loads (cons '"../../../Dropbox/dotfiles/emacs.d/elpa/expand-region-20150902.558/expand-region-custom" loads))))

(defvar expand-region-preferred-python-mode 'python "\
The name of your preferred python mode")

(custom-autoload 'expand-region-preferred-python-mode "../../../Dropbox/dotfiles/emacs.d/elpa/expand-region-20150902.558/expand-region-custom" t)

(defvar expand-region-guess-python-mode t "\
If expand-region should attempt to guess your preferred python mode")

(custom-autoload 'expand-region-guess-python-mode "../../../Dropbox/dotfiles/emacs.d/elpa/expand-region-20150902.558/expand-region-custom" t)

(defvar expand-region-autocopy-register "" "\
If set to a string of a single character (try \"e\"), then the
contents of the most recent expand or contract command will
always be copied to the register named after that character.")

(custom-autoload 'expand-region-autocopy-register "../../../Dropbox/dotfiles/emacs.d/elpa/expand-region-20150902.558/expand-region-custom" t)

(defvar expand-region-skip-whitespace t "\
If expand-region should skip past whitespace on initial expansion")

(custom-autoload 'expand-region-skip-whitespace "../../../Dropbox/dotfiles/emacs.d/elpa/expand-region-20150902.558/expand-region-custom" t)

(defvar expand-region-fast-keys-enabled t "\
If expand-region should bind fast keys after initial expand/contract")

(custom-autoload 'expand-region-fast-keys-enabled "../../../Dropbox/dotfiles/emacs.d/elpa/expand-region-20150902.558/expand-region-custom" t)

(defvar expand-region-contract-fast-key "-" "\
Key to use after an initial expand/contract to contract once more.")

(custom-autoload 'expand-region-contract-fast-key "../../../Dropbox/dotfiles/emacs.d/elpa/expand-region-20150902.558/expand-region-custom" t)

(defvar expand-region-reset-fast-key "0" "\
Key to use after an initial expand/contract to undo.")

(custom-autoload 'expand-region-reset-fast-key "../../../Dropbox/dotfiles/emacs.d/elpa/expand-region-20150902.558/expand-region-custom" t)

(defvar expand-region-exclude-text-mode-expansions '(html-mode nxml-mode) "\
List of modes which derive from `text-mode' for which text mode expansions are not appropriate.")

(custom-autoload 'expand-region-exclude-text-mode-expansions "../../../Dropbox/dotfiles/emacs.d/elpa/expand-region-20150902.558/expand-region-custom" t)

;;;***

;;;### (autoloads nil "expand-region" "../../../../../.emacs.d/elpa/expand-region-20150902.558/expand-region.el"
;;;;;;  "8ab9f19242b201916e5e818d59b32661")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/expand-region-20150902.558/expand-region.el

(autoload 'er/expand-region "expand-region" "\
Increase selected region by semantic units.

With prefix argument expands the region that many times.
If prefix argument is negative calls `er/contract-region'.
If prefix argument is 0 it resets point and mark to their state
before calling `er/expand-region' for the first time.

\(fn ARG)" t nil)

;;;***

;;;### (autoloads nil "expand-region-custom" "../../../../../.emacs.d/elpa/expand-region-20150902.558/expand-region-custom.el"
;;;;;;  "961542bd7ad7d0594e2042ce8420f634")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/expand-region-20150902.558/expand-region-custom.el

(let ((loads (get 'expand-region 'custom-loads))) (if (member '"expand-region-custom" loads) nil (put 'expand-region 'custom-loads (cons '"expand-region-custom" loads))))

(defvar expand-region-preferred-python-mode 'python "\
The name of your preferred python mode")

(custom-autoload 'expand-region-preferred-python-mode "expand-region-custom" t)

(defvar expand-region-guess-python-mode t "\
If expand-region should attempt to guess your preferred python mode")

(custom-autoload 'expand-region-guess-python-mode "expand-region-custom" t)

(defvar expand-region-autocopy-register "" "\
If set to a string of a single character (try \"e\"), then the
contents of the most recent expand or contract command will
always be copied to the register named after that character.")

(custom-autoload 'expand-region-autocopy-register "expand-region-custom" t)

(defvar expand-region-skip-whitespace t "\
If expand-region should skip past whitespace on initial expansion")

(custom-autoload 'expand-region-skip-whitespace "expand-region-custom" t)

(defvar expand-region-fast-keys-enabled t "\
If expand-region should bind fast keys after initial expand/contract")

(custom-autoload 'expand-region-fast-keys-enabled "expand-region-custom" t)

(defvar expand-region-contract-fast-key "-" "\
Key to use after an initial expand/contract to contract once more.")

(custom-autoload 'expand-region-contract-fast-key "expand-region-custom" t)

(defvar expand-region-reset-fast-key "0" "\
Key to use after an initial expand/contract to undo.")

(custom-autoload 'expand-region-reset-fast-key "expand-region-custom" t)

(defvar expand-region-exclude-text-mode-expansions '(html-mode nxml-mode) "\
List of modes which derive from `text-mode' for which text mode expansions are not appropriate.")

(custom-autoload 'expand-region-exclude-text-mode-expansions "expand-region-custom" t)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/expand-region-20150902.558/cc-mode-expansions.el"
;;;;;;  "../../../../../.emacs.d/elpa/expand-region-20150902.558/clojure-mode-expansions.el"
;;;;;;  "../../../../../.emacs.d/elpa/expand-region-20150902.558/cperl-mode-expansions.el"
;;;;;;  "../../../../../.emacs.d/elpa/expand-region-20150902.558/css-mode-expansions.el"
;;;;;;  "../../../../../.emacs.d/elpa/expand-region-20150902.558/enh-ruby-mode-expansions.el"
;;;;;;  "../../../../../.emacs.d/elpa/expand-region-20150902.558/er-basic-expansions.el"
;;;;;;  "../../../../../.emacs.d/elpa/expand-region-20150902.558/erlang-mode-expansions.el"
;;;;;;  "../../../../../.emacs.d/elpa/expand-region-20150902.558/expand-region-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/expand-region-20150902.558/expand-region-core.el"
;;;;;;  "../../../../../.emacs.d/elpa/expand-region-20150902.558/expand-region-custom.el"
;;;;;;  "../../../../../.emacs.d/elpa/expand-region-20150902.558/expand-region-pkg.el"
;;;;;;  "../../../../../.emacs.d/elpa/expand-region-20150902.558/expand-region.el"
;;;;;;  "../../../../../.emacs.d/elpa/expand-region-20150902.558/feature-mode-expansions.el"
;;;;;;  "../../../../../.emacs.d/elpa/expand-region-20150902.558/html-mode-expansions.el"
;;;;;;  "../../../../../.emacs.d/elpa/expand-region-20150902.558/js-mode-expansions.el"
;;;;;;  "../../../../../.emacs.d/elpa/expand-region-20150902.558/js2-mode-expansions.el"
;;;;;;  "../../../../../.emacs.d/elpa/expand-region-20150902.558/jsp-expansions.el"
;;;;;;  "../../../../../.emacs.d/elpa/expand-region-20150902.558/latex-mode-expansions.el"
;;;;;;  "../../../../../.emacs.d/elpa/expand-region-20150902.558/nxml-mode-expansions.el"
;;;;;;  "../../../../../.emacs.d/elpa/expand-region-20150902.558/octave-expansions.el"
;;;;;;  "../../../../../.emacs.d/elpa/expand-region-20150902.558/python-el-expansions.el"
;;;;;;  "../../../../../.emacs.d/elpa/expand-region-20150902.558/python-el-fgallina-expansions.el"
;;;;;;  "../../../../../.emacs.d/elpa/expand-region-20150902.558/python-mode-expansions.el"
;;;;;;  "../../../../../.emacs.d/elpa/expand-region-20150902.558/ruby-mode-expansions.el"
;;;;;;  "../../../../../.emacs.d/elpa/expand-region-20150902.558/sml-mode-expansions.el"
;;;;;;  "../../../../../.emacs.d/elpa/expand-region-20150902.558/subword-mode-expansions.el"
;;;;;;  "../../../../../.emacs.d/elpa/expand-region-20150902.558/text-mode-expansions.el"
;;;;;;  "../../../../../.emacs.d/elpa/expand-region-20150902.558/the-org-mode-expansions.el"
;;;;;;  "../../../../../.emacs.d/elpa/expand-region-20150902.558/web-mode-expansions.el"
;;;;;;  "expand-region-custom.el" "expand-region.el") (22061 13079
;;;;;;  529597 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; expand-region-autoloads.el ends here

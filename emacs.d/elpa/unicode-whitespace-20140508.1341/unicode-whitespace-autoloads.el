;;; unicode-whitespace-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "unicode-whitespace" "unicode-whitespace.el"
;;;;;;  (21580 20287 0 0))
;;; Generated autoloads from unicode-whitespace.el

(let ((loads (get 'unicode-whitespace 'custom-loads))) (if (member '"unicode-whitespace" loads) nil (put 'unicode-whitespace 'custom-loads (cons '"unicode-whitespace" loads))))

(let ((loads (get 'unicode-whitespace-definitions 'custom-loads))) (if (member '"unicode-whitespace" loads) nil (put 'unicode-whitespace-definitions 'custom-loads (cons '"unicode-whitespace" loads))))

(let ((loads (get 'unicode-whitespace-mappings 'custom-loads))) (if (member '"unicode-whitespace" loads) nil (put 'unicode-whitespace-mappings 'custom-loads (cons '"unicode-whitespace" loads))))

(let ((loads (get 'unicode-whitespace-faces 'custom-loads))) (if (member '"unicode-whitespace" loads) nil (put 'unicode-whitespace-faces 'custom-loads (cons '"unicode-whitespace" loads))))

(autoload 'unicode-whitespace-subdued-faces "unicode-whitespace" "\
Change the faces used by `whitespace-mode' to subdued coloring.

With negative prefix ARG, sets faces back to default values.

\(fn &optional ARG)" t nil)

(autoload 'unicode-whitespace-setup "unicode-whitespace" "\
Configure `whitespace-mode' to be aware of extended characters.

This only needs to be run once per session.

When optional SUBDUED-FACES is non-nil, change whitespace faces
to subdued coloring, on the theory that the new display glyphs
are sufficient to distinguish whitespace.

\(fn &optional SUBDUED-FACES)" t nil)

(autoload 'unicode-whitespace-toggle-echo "unicode-whitespace" "\
Toggle `whitespace-mode' echo-area feedback on/off.

\(fn)" t nil)

(autoload 'unicode-whitespace-toggle-newlines "unicode-whitespace" "\
Toggle `whitespace-mode' newline visibility on/off.

\(fn)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; unicode-whitespace-autoloads.el ends here

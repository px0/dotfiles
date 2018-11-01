;;; Compiled snippets and support files for `jsx-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'jsx-mode
		     '(("then" "then(function($1){\n	$2\n})$0" "then" nil nil nil "/Users/phyrex/.emacs.d/snippets/jsx-mode/then.yasnippet" nil nil)
		       ("promise" "return new Promise((resolve, reject) => {\n    $1\n})\n" "promise" nil nil nil "/Users/phyrex/.emacs.d/snippets/jsx-mode/promise.yasnippet" nil nil)
		       ("ll" "console.log(\"${1:var}: \" + $1);" "log " nil nil nil "/Users/phyrex/.emacs.d/snippets/jsx-mode/ll.yasnippet" nil nil)
		       ("l" "console.log(\"$1\");" "log-simple" nil nil nil "/Users/phyrex/.emacs.d/snippets/jsx-mode/l.yasnippet" nil nil)
		       ("json" "JSON.stringify($1, null, ' ')$0" "json" nil nil nil "/Users/phyrex/.emacs.d/snippets/jsx-mode/json.yasnippet" nil nil)
		       ("if" "if( ${1} ){\n$0\n}\n" "if" nil nil nil "/Users/phyrex/.emacs.d/snippets/jsx-mode/if.yasnippet" nil nil)
		       ("fn" "function $1($2){$0}" "fn" nil nil nil "/Users/phyrex/.emacs.d/snippets/jsx-mode/fn.yasnippet" nil nil)
		       ("//" "////////////////////////////////////////////////////////////////////////////////\n" "comment-line" nil nil nil "/Users/phyrex/.emacs.d/snippets/jsx-mode/comment.yasnippet" "direct-keybinding" nil)
		       ("catch" "catch(function($1){\n	$2\n})$0" "catch" nil nil nil "/Users/phyrex/.emacs.d/snippets/jsx-mode/catch.yasnippet" nil nil)))


;;; Do not edit! File generated at Sun Jan  3 15:31:48 2016

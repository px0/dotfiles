This program emulates nerd-commenter.vim by Marty Grenfell.

It help you comment/uncomment multiple lines without selecting them.

`M-x evilnc-default-hotkeys` assigns hotkey `M-;` to `evilnc-comment-or-uncomment-lines`

`M-x evilnc-comment-or-uncomment-lines` comment or uncomment lines.

`M-x evilnc-quick-comment-or-uncomment-to-the-line` will comment/uncomment from current line to
the specified line number. The last digit(s) of line number is parameter of the command.

For example, `C-u 9 evilnc-quick-comment-or-uncomment-to-the-line` will comment code from
current line to line 99 if you current line is 91.

Though this program could be used *independently*, I highly recommend you use it with
evil (http://gitorious.org/evil)

Evil makes you take advantage of power of Vi to comment lines in shocking speed.
For example, you can press key `99,ci` to comment out 99 lines.

Setup:

Check https://github.com/redguardtoo/evil-nerd-commenter for more use cases.

Use case 1, If you use comma as leader key, as most Vim users do, setup is just one liner,
(evilnc-default-hotkeys)

Use case 2, If you are using evil-leader and didn't change the whose default leader key,
insert below setup into your ~/.emacs instead,

(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
(global-set-key (kbd "C-c l") 'evilnc-quick-comment-or-uncomment-to-the-line)
(global-set-key (kbd "C-c c") 'evilnc-copy-and-comment-lines)
(global-set-key (kbd "C-c p") 'evilnc-comment-or-uncomment-paragraphs)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-key
  "ci" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  "cv" 'evilnc-toggle-invert-comment-line-by-line
  "\\" 'evilnc-comment-operator
  )

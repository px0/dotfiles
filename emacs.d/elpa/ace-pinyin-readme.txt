Demos: See https://github.com/cute-jumper/ace-pinyin

                             _____________

                               ACE-PINYIN

                              Junpeng Qiu
                             _____________


Table of Contents
_________________

1 Setup
2 Usage
3 Other available command
.. 3.1 `ace-pinyin-dwim'
.. 3.2 `ace-pinyin-jump-word'
4 Acknowledgment


Jump to Chinese characters using `ace-jump-char-mode' or `avy-goto-char'
: input the first letter of the pinyin of the Chinese character, then
use `ace-jump-char-mode' or `avy-goto-char' to jump to it.

*UPDATE*: Now `avy-goto-char-2' is also support if you set
`ace-pinyin-use-avy' to be `t'.


1 Setup
=======

  ,----
  | (add-to-list 'load-path "/path/to/ace-pinyin.el")
  | (require 'ace-pinyin)
  `----

  Or install via [melpa].


  [melpa] http://melpa.org/#/ace-pinyin


2 Usage
=======

  *UPDATE*: The up-to-date version now supports [avy], which I
  personally think is better than [ace-jump-mode]. However, by default
  this package is still using `ace-jump-mode'.

  You can make the `ace-pinyin' use `avy' by:
  ,----
  | (setq ace-pinyin-use-avy t)
  `----

  Note `ace-pinyin-use-avy' variable should be set *BEFORE* you call
  `ace-pinyin-globa-mode' or `turn-on-ace-pinyin-mode'.

  Example config to use `ace-pinyin' globally:
  ,----
  | ;; (setq ace-pinyin-use-avy t) ;; uncomment if you want to use `avy'
  | (ace-pinyin-global-mode +1)
  `----

  If you want to turn on/off `ace-pinyin-mode' locally, don't directly
  call `ace-pinyin-mode'. Use `turn-on-ace-pinyin-mode' or
  `turn-off-ace-pinyin-mode' instead.

  When the minor mode is enabled, then `ace-jump-char-mode' (or
  `avy-goto-char', depends on your config) will be able to jump to both
  Chinese and English characters. That is, you don't need remember an
  extra command or create extra key bindings in order to jump to Chinese
  character. Just enable the minor mode and use `ace-jump-char-mode' (or
  `avy-goto-char') to jump to Chinese characters.

  Besides, all other packages using `ace-jump-char-mode' (or
  `avy-goto-char') will also be able to jump to Chinese characters. For
  example, if you've installed [ace-jump-zap](which is implemented using
  `ace-jump-mode', so you can't use `avy' in this case), it will also be
  able to zap to a Chinese character by the first letter of pinyin.


  [avy] https://github.com/abo-abo/avy

  [ace-jump-mode] https://github.com/winterTTr/ace-jump-mode

  [ace-jump-zap] https://github.com/waymondo/ace-jump-zap


3 Other available command
=========================

3.1 `ace-pinyin-dwim'
~~~~~~~~~~~~~~~~~~~~~

  If called with no prefix, it can jump to both Chinese characters and
  English letters. If called with prefix, it can only jump to Chinese
  characters.


3.2 `ace-pinyin-jump-word'
~~~~~~~~~~~~~~~~~~~~~~~~~~

  Using this command, you can jump to the start of a sequence of Chinese
  characters(/i.e./ Chinese word) by typing the sequence of the first
  letters of these character's pinyins. If called without prefix, this
  command will read user's input with a default timeout 1 second(You can
  customize the timeout value). If called with prefix, then it will read
  input from the minibuffer and starts search after you press "enter".


4 Acknowledgment
================

  The letter to Chinese character table(`ace-pinyin--char-table' in
  code) is from [https://github.com/redguardtoo/find-by-pinyin-dired].

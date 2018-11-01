; Increase the gc so startup is faster, then decrease it after 5 idle secs again to prevent pauses when the gc runs
(setq gc-cons-threshold 500000000)
(run-with-idle-timer
 5 nil
 (lambda ()
   (setq gc-cons-threshold 1000000)
   (message "gc-cons-threshold restored to %S"
            gc-cons-threshold)))

(require 'package)
(package-initialize)

; (add-to-list 'load-path "~/.emacs.d/evil")
; (require 'evil)
; (evil-mode 1)


(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
;;(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)



;; copy all path things. Useful!
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(when (not package-archive-contents)
  (package-refresh-contents))

;; prefer melpa-stable for cider
(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)

(defvar my-packages '(better-defaults
                      projectile
                      clojure-mode
                      cider))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))


(load "~/.emacs.d/user.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#ffffff" "#ff9da4" "#d1f1a9" "#ffeead" "#bbdaff" "#ebbbff" "#99ffff" "#002451"))
 '(background-color "#202020")
 '(background-mode dark)
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(cursor-color "#cccccc")
 '(custom-safe-themes
   (quote
    ("733b88772c8dc996bceed8ad63f0d151d5f4eeb59899e209b5e1acc2b578eff8" "196cc00960232cfc7e74f4e95a94a5977cb16fd28ba7282195338f68c84058ec" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "9a8e28312bd0885741d56628e45f5eea9ffdbd8d5a5c92f15baffd0cadac3e64" "ae338ea57d08fccc78d471661b926ca323c80672bf2b912016ef2f69d9c8bfd8" "1e31457860d5179e9dd817360383930b1641e4440bc11b7c14845c147ad0bce7" "86627716459b7b4ea127046a5645ab98843f633c051aa4c1186ee88052601120" "fa80fb37f8a29d6429e0740d0c31c384f25565a1f87c69535f473587f3ed3947" "f116181165a45e2f707219e228912cd5feae86a99e4e4eacd68a4b8ad71975a4" "3c5fd638f5233816bde058aefe3e3a74bd564cc9cd5c7c89f07be8f59add43fe" "0c11fbce4b231a11ec2e64c27a6eeafcdabbf9102f1d50de8cb775e35257859d" "a05093ac4652b3a0916d8750d59f6849fe2ab37b837bf3808797b7677d094e74" "98d1734a3cf77fcb85c327b64b86a40950273f3c7f8745bd7ab7ee269117b1a8" "0516c9d3bf66bd7b3f31fb1432a15a1b4e106897797114313208ecfb53096df7" "4ff23437b3166eeb7ca9fa026b2b030bba7c0dfdc1ff94df14dfb1bcaee56c78" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "1297a022df4228b81bc0436230f211bad168a117282c20ddcba2db8c6a200743" "52588047a0fe3727e3cd8a90e76d7f078c9bd62c0b246324e557dfa5112e0d0c" "9e54a6ac0051987b4296e9276eecc5dfb67fdcd620191ee553f40a9b6d943e78" "1157a4055504672be1df1232bed784ba575c60ab44d8e6c7b3800ae76b42f8bd" "0c311fb22e6197daba9123f43da98f273d2bfaeeaeb653007ad1ee77f0003037" "4e262566c3d57706c70e403d440146a5440de056dfaeb3062f004da1711d83fc" "35b526231c23f558b76fe27307d424111dcadf24465c80c3bf40a7de49410b74" "579e9950513524d8739e08eae289419cfcb64ed9b7cc910dd2e66151c77975c4" "42ac06835f95bc0a734c21c61aeca4286ddd881793364b4e9bc2e7bb8b6cf848" "9e8becc2a4bb439855e49fbee863781dc5c4a5837d4508aa8fed47eb09b5fb2d" "f99f1105401cd92f1e3b6e9fd1fa3dafeac65847927b8f5e65984745d87385d4" "fdadd12f742200be37181eee89f11ec725e98dcbe439afda054fe4be47401240" "b10159307e655d6c3888df23c36e4f1cd970bb5cd477335637317dc8d1bb2358" "1f240eda4b53091a3ef08629fc0c8b37d4d62de474299736d7cc8bbc82a0350c" default)))
 '(exec-path
   (quote
    ("/usr/local/bin" "/Users/phyrex/dotfiles/bin/" "/Users/phyrex/bin/" "/usr/local/sbin/" "/usr/local/bin/" "/usr/bin/" "/bin/" "/usr/sbin/" "/sbin/" "/Users/phyrex/.rvm/bin/" "/usr/local/share/npm/bin/" "/Applications/Emacs.app/Contents/MacOS/bin/" "/usr/local/Cellar/ruby193/1.9.3-p547/bin/" "/usr/local/opt/android-sdk/platform-tools/" "/usr/local/opt/android-sdk/bin/" "/usr/local/opt/android-sdk/tools/" "/usr/local/bin/" "/usr/bin/" "/bin/" "/usr/sbin/" "/sbin/" "/opt/X11/bin/" "/Applications/Emacs.app/Contents/MacOS/bin-x86_64-10_9/" "/Applications/Emacs.app/Contents/MacOS/libexec-x86_64-10_9/" nil "/Applications/Emacs.app/Contents/MacOS/libexec/" "/Applications/Racket v6.2/bin")))
 '(fci-rule-color "#343d46")
 '(fill-column 140)
 '(foreground-color "#cccccc")
 '(grep-find-template
   "find . ! -name \"*.min.\" ! -name \"bundle.js\" <X> -type f <F> -exec grep <C> -nH -e <R> {} +")
 '(haskell-mode-hook
   (quote
    (imenu-add-menubar-index turn-on-haskell-doc turn-on-haskell-indent)))
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#49483E" . 0)
     ("#67930F" . 20)
     ("#349B8D" . 30)
     ("#21889B" . 50)
     ("#968B26" . 60)
     ("#A45E0A" . 70)
     ("#A41F99" . 85)
     ("#49483E" . 100))))
 '(jit-lock-defer-time 0.05)
 '(js2-basic-offset 8)
 '(linum-delay t)
 '(linum-format " %7i ")
 '(magit-diff-use-overlays nil)
 '(org-confirm-babel-evaluate nil)
 '(org-plantuml-jar-path "~/plantuml.jar")
 '(recentf-mode t)
 '(send-mail-function nil)
 '(show-paren-mode t)
 '(show-paren-style (quote parenthesis))
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#bf616a")
     (40 . "#DCA432")
     (60 . "#ebcb8b")
     (80 . "#B4EB89")
     (100 . "#89EBCA")
     (120 . "#89AAEB")
     (140 . "#C189EB")
     (160 . "#bf616a")
     (180 . "#DCA432")
     (200 . "#ebcb8b")
     (220 . "#B4EB89")
     (240 . "#89EBCA")
     (260 . "#89AAEB")
     (280 . "#C189EB")
     (300 . "#bf616a")
     (320 . "#DCA432")
     (340 . "#ebcb8b")
     (360 . "#B4EB89"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#49483E" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
'(custom-safe-themes (quote ("1f240eda4b53091a3ef08629fc0c8b37d4d62de474299736d7cc8bbc82a0350c" "62e0298c62733383b8aa90face0fcdb6067a97eae17bc557ec14566e96cb0c21" "014d3f9e9c7d777f8ba900ae97eda148799e9c5adcfd63ffa6c4b3bd2fd59975" "eb973e7b5c15d808814995b9d64662b137d6d9e9e4ea5860e085cb88e2ed4901" "178337b6c61214f0d560924a25039b074cfa49ea016cdba421bcd2ed304c87d6" "970037bb936d4947aaee8b88d451b46af08bc5a7d6d219701fd50304040e1a7c" "e7347192f07b5a6b452fc435853fff55ff8ad5fb80693131110fabfd6779647d" "6a81c982541f60ca8da778e3385cc0e6369353945b537e3b952cfcba2bbd21e5" "3c7d0a36b36076d1e4baf98e407d8ab84b87bea8b0b3df03b79d2c682c81510c" "a2320e7aee1df014d8c9b75425606333043c63a22d584482fbd5beeda55452a9" "9983621f620d73a6ce3b3e4a1529bc17672a540eefd349777723a6a684a7808d" "df0da5fa4c2cded1c5aafa2943636175a7b670b55f9aec3a24b8a609cd7e29c6" "687e48b1f1b5fd891cef4286ef251198ad24b3413101d42067603a3b80af91c6" "59309352ca47909f702a5dcd590096b86d2dffd1674ec952c03eb07ab9066810" "23b85026ec3dfa3b1c4e170b83b1e9f4e7828c44f1f32fb427d5252e66e60b7b" "1157a4055504672be1df1232bed784ba575c60ab44d8e6c7b3800ae76b42f8bd" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "nil" :family "Source Code Pro")))))
(put 'narrow-to-region 'disabled nil)

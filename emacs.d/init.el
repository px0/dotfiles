(require 'package)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

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
 '(custom-safe-themes (quote ("9e8becc2a4bb439855e49fbee863781dc5c4a5837d4508aa8fed47eb09b5fb2d" "f99f1105401cd92f1e3b6e9fd1fa3dafeac65847927b8f5e65984745d87385d4" "fdadd12f742200be37181eee89f11ec725e98dcbe439afda054fe4be47401240" "b10159307e655d6c3888df23c36e4f1cd970bb5cd477335637317dc8d1bb2358" "1f240eda4b53091a3ef08629fc0c8b37d4d62de474299736d7cc8bbc82a0350c" default)))
 '(recentf-mode t))
 '(custom-safe-themes (quote ("1f240eda4b53091a3ef08629fc0c8b37d4d62de474299736d7cc8bbc82a0350c" "62e0298c62733383b8aa90face0fcdb6067a97eae17bc557ec14566e96cb0c21" "014d3f9e9c7d777f8ba900ae97eda148799e9c5adcfd63ffa6c4b3bd2fd59975" "eb973e7b5c15d808814995b9d64662b137d6d9e9e4ea5860e085cb88e2ed4901" "178337b6c61214f0d560924a25039b074cfa49ea016cdba421bcd2ed304c87d6" "970037bb936d4947aaee8b88d451b46af08bc5a7d6d219701fd50304040e1a7c" "e7347192f07b5a6b452fc435853fff55ff8ad5fb80693131110fabfd6779647d" "6a81c982541f60ca8da778e3385cc0e6369353945b537e3b952cfcba2bbd21e5" "3c7d0a36b36076d1e4baf98e407d8ab84b87bea8b0b3df03b79d2c682c81510c" "a2320e7aee1df014d8c9b75425606333043c63a22d584482fbd5beeda55452a9" "9983621f620d73a6ce3b3e4a1529bc17672a540eefd349777723a6a684a7808d" "df0da5fa4c2cded1c5aafa2943636175a7b670b55f9aec3a24b8a609cd7e29c6" "687e48b1f1b5fd891cef4286ef251198ad24b3413101d42067603a3b80af91c6" "59309352ca47909f702a5dcd590096b86d2dffd1674ec952c03eb07ab9066810" "23b85026ec3dfa3b1c4e170b83b1e9f4e7828c44f1f32fb427d5252e66e60b7b" "1157a4055504672be1df1232bed784ba575c60ab44d8e6c7b3800ae76b42f8bd" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

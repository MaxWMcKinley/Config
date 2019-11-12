;;; package --- summary

;;; Commentary:
;;; Basic bootstrapping and then
;;; Load my config from an org file

;;; Code:

;;; Set up melpa
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)
(package-refresh-contents)

;;; Set up use-package which we will use for installing all other packages
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;;; Load in config org file
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))


;;; Auto-generated code
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("b0fd04a1b4b614840073a82a53e88fe2abc3d731462d6fde4e541807825af342" "34c99997eaa73d64b1aaa95caca9f0d64229871c200c5254526d0062f8074693" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(docker-compose-logs-arguments nil)
 '(docker-container-logs-arguments (quote ("--tail 1000")))
 '(org-agenda-files nil)
 '(package-selected-packages
   (quote
    (perspective perpective gnu-elpa-keyring-update posframe pretty-hydra dockerfile-mode deadgrep scala-mode org-super-agenda org-edna eyebrowse solidity-mode htmlize ob-sh org org-babel-eval-in-repl treemacs-magit treemacs-projectile treemacs markdown-mode doom-themes multiple-cursors projectile smooth-scrolling swiper delight ace-window yasnippet spacemacs-theme org-bullets which-key swiper-helm switch-window use-package undo-tree string-inflection solidity-flycheck powerline magit js2-mode ivy gitlab-ci-mode flycheck-yamllint docker company-solidity))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here

;; Disable the splash buffer
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")

;;;;;;;;;;;; Packages load
(defun user/load-config (config)
  (load-library (concat "~/.emacs.d/configs/" config ".el")))

(setq package-check-signature nil)
;; Package management
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))


;; ================= OS Specifics ========================
;; Load MacOS specifics. I wish to change to
;; (user/load-config system-type) but gnu/linux has a slash in it.
;; Maybe use a string split using the slash and name the file gnu?
(cond
 ((string-equal system-type "darwin")
  (user/load-config "darwin")))


;; ================ IDE Packages, and such ===============
(package-install 'use-package)
(require 'use-package)
(use-package all-the-icons)

;; Set layers here, for now they are just the file names in configs/
(setq layers
      '(
	"go"
	"magit"
	"neotree"
	"themes"
	"proxy"
	"python"
	))

;; Runs load-config on the layers
(while layers
  (user/load-config (car layers))
  (setq layers (cdr layers)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (lsp-python-ms magit neotree doom-themes exec-path-from-shell flycheck use-package go-mode yasnippet company-lsp company lsp-ui lsp-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;----------------------- erlang environment settings start ----------

(setq load-path (cons "/usr/local/OTP_174/lib/tools-2.7.1/emacs" load-path))
(setq erlang-root-dir "/usr/local/OTP_174")
(setq exec-path (cons "/usr/local/OTP_174/bin" exec-path))
(require 'erlang-start)

;(require 'erlang-flymake)
;(add-to-list 'load-path "/home/adrian/distel/elisp")
;(require 'distel)
;(distel-setup)

(add-hook 'after-init-hook 'my-after-init-hook)
(defun my-after-init-hook ()
  (require 'edts-start)
  (ido-vertical-mode t)
  )

;-------------- white space and tabulation settings ------
;; Use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; trailing whitespaces
(setq whitespace-line-column 120 whitespace-style '(face tabs trailing lines-tail))

;; activate minor whitespace mode when in python mode
(add-hook 'prog-mode-hook 'whitespace-mode)

(add-hook 'erlang-mode-hook 'whitespace-mode)

;--end--------- white space and tabulation settings ------




(add-to-list 'load-path "/Users/adrianstachurski/.emacs.d/elpa/rainbow-delimiters-20150320.17")
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'erlang-mode-hook 'rainbow-delimiters-mode)
;(global-rainbow-delimiters-mode) ; this would enabli it globally in emacs

;----------------------- erlang environment settings end ----------

(add-to-list 'load-path "/Users/adrianstachurski/.emacs.d/elpa/yaml-mode-20141125.37")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))


;(global-linum-mode t)
;(setq linum-format "%4d \u2502 ")

;-------------------------- repositories start --------------

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;-------------------------- repositories end  --------------

;-------------------- markdown handling --------------------

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)

(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;----end------------ markdown handling --------------------






;--------------------------------- ace window begin ------------


(global-set-key (kbd "M-5") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
(setq aw-dispatch-always t)

;--------------------------------- ace window end ------------ 

;ace jump mode major function --------------------- jump mode begin ---------

(add-to-list 'load-path "/Users/adrianstachurski/.emacs.d/elpa/ace-jump-mode-20140616.115/ace-jump-mode.el")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)

;you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)


;enable a more powerful jump back function from ace jump mode

(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

; ----------------------------------- jump mode end -----------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(edts-man-root "/Users/adrianstachurski/.emacs.d/edts/doc/R7B")
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 25))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;;----------------------------------------------------------------------------------------------------
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; load-pathに追加するフォルダ
;; 2つ以上フォルダを指定する場合の引数 => (add-to-load-path "elisp" "xxx" "xxx")
(add-to-load-path "elisp")

(when (< emacs-major-version 24.3) (require 'cl-lib))

(add-to-load-path "elpa")


;;; package.el
(when (require 'package nil t)
  ;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
  ;; (add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/"))
  )


(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (elscreen elscreen-separate-buffer-list quickrun flycheck helm helm-swoop php-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; ホットローダー
(global-auto-revert-mode 1)

;; ファイル履歴
(recentf-mode 1)
(setq recentf-max-menu-items 100)
(setq recentf-max-saved-items 1000)

;; バックアップを残さない
(setq make-backup-files nil)
(setq auto-save-default nil)

;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;; テーマ変更
(load-theme 'tsdh-dark t)

(add-hook 'after-init-hook #'global-flycheck-mode)

(global-set-key (kbd "C-x b") 'helm-mini)

(global-set-key (kbd "M-s s") 'helm-swoop)

(global-set-key (kbd "M-x") 'helm-M-x)

(global-set-key (kbd "C-x x") 'quickrun)

(when (require 'hiwin nil t)
  (hiwin-activate)
  ;; hiwin-modeを有効化
  (set-face-box 'hiwin-face white))
;; 非アクティブバッファの背景色を設定

(when(require 'elscreen nil t)
  (elscreen-start)
  (require 'elscreen-separate-buffer-list nil t)
  (elscreen-separate-buffer-list-mode))

;; タブにスペースを使用する
(setq-default tab-width 4 indent-tabs-mode nil)

(when (require 'whitespace nil t)
  (setq whitespace-style '(face tabs spaces newline trailing space-before-tab space-after-tab space-mark tab-mark newline-mark))
  (set-face-attribute 'whitespace-space nil
                      :foreground "pink4"
                      :background 'unspecified)
  (set-face-attribute 'whitespace-tab nil
                      :foreground "gray40"
                      :background 'unspecified
                      :strike-through t)
  (set-face-attribute 'whitespace-newline nil
                      :foreground "darkcyan"
                      :height 0.8)
  (setq whitespace-space-regexp "\\(　+\\)")
  (setq whitespace-display-mappings
        '((space-mark   ?\xA0  [?\xA4]  [?_])
          (space-mark   ?\x8A0 [?\x8A4] [?_])
          (space-mark   ?\x920 [?\x924] [?_])
          (space-mark   ?\xE20 [?\xE24] [?_])
          (space-mark   ?\xF20 [?\xF24] [?_])
          (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])
          (space-mark   ?　    [?口]    [?＿])
          (newline-mark ?\n    [?\x21B5 ?\n] [?$ ?\n])
          ))
  (setq whitespace-global-modes '(not dired-mode tar-mode))
  (global-whitespace-mode 1))
(require 'generic-x)

;;
;; フォント関係
;;----------------------------------------------------------------------------------------------------
(defvar font-size 140)
(set-face-attribute 'default nil :family "Migu 1M" :height font-size)
(set-face-attribute 'variable-pitch nil :family "Migu 1M" :height font-size)
(set-face-attribute 'fixed-pitch nil :family "Migu 1M" :height font-size)
(set-face-attribute 'tooltip nil :family "Migu 1M" :height font-size)

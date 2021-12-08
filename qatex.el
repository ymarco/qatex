;;; qatex.el --- TODO description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021 Yoav Marco
;;
;; Author: Yoav Marco <https://github.com/ymarco>
;; Maintainer: Yoav Marco <yoavm448@gmail.com>
;; Created: December 08, 2021
;; Modified: December 08, 2021
;; Version: 0.0.1
;; Keywords: tex
;; Homepage: https://github.com/ymarco/qatex
;; Package-Requires: ((emacs "26.1"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  TODO description
;;
;;; Code:

(require 'tree-sitter)

(defgroup qatex nil
  "TODO"
  :group 'languages)
(defvar qatex-ts-language
  (tree-sitter-load 'latex
                    (thread-first load-file-name
                                  (file-name-directory)
                                  (concat "latex")))
  "TODO")
(define-derived-mode qatex-mode text-mode "Qatex"
  "TODO"
  :group 'qatex
  (setq-local tree-sitter-language qatex-ts-language)
  (tree-sitter-hl-mode))

(provide 'qatex)
;;; qatex.el ends here

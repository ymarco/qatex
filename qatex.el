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

(setq qatex-ts-patterns
  (with-temp-buffer
    (insert-file-contents
     (thread-first load-file-name
                   (file-name-directory)
                   (concat "queries")
                   (file-name-as-directory)
                   (concat "highlights.scm")))
    (buffer-substring-no-properties (point-min) (point-max)))
  aoeu
  "TODO")


(defface tree-sitter-hl-face:text.math
  '((default :inherit font-lock-function-name-face))
  "Face used for math"
  :group 'tree-sitter-hl-faces)
(defface tree-sitter-hl-face:text.emphasis
  '((default :inherit italic))
  "Face used for emphasis"
  :group 'tree-sitter-hl-faces)
(defface tree-sitter-hl-face:text.environment
  '((default :inherit tree-sitter-hl-face:keyword :weight bold))
  "Face used for environment"
  :group 'tree-sitter-hl-faces)
(defface tree-sitter-hl-face:text.environment.name
  '((default :inherit tree-sitter-hl-face:variable.parameter))
  "Face used for name"
  :group 'tree-sitter-hl-faces)
(defface tree-sitter-hl-face:text.reference
  '((default :inherit tree-sitter-hl-face:doc :slant italic))
  "Face used for reference"
  :group 'tree-sitter-hl-faces)
(defface tree-sitter-hl-face:text.strong
  '((default :inherit bold))
  "Face used for strong"
  :group 'tree-sitter-hl-faces)
(defface tree-sitter-hl-face:text.title
  '((default :inherit font-lock-type-face :weight bold))
  "Face used for title"
  :group 'tree-sitter-hl-faces)
(defface tree-sitter-hl-face:function.macro-call
  '((default :inherit tree-sitter-hl-face:keyword))
  "Face used for usual tex macros"
  :group 'tree-sitter-hl-faces)
(defface tree-sitter-hl-face:text.uri
  '((default :inherit link))
  "Face used for uri"
  :group 'tree-sitter-hl-faces)
(defface tree-sitter-hl-face:text.math.frame
  '((default :inherit tree-sitter-hl-face:constant))
  "Face used for things surrounding math.
To distinguish from the math content itself."
  :group 'tree-sitter-hl-faces)

(define-derived-mode qatex-mode text-mode "Qatex"
  "TODO"
  :group 'qatex
  (setq-local tree-sitter-language qatex-ts-language
              tree-sitter-hl-default-patterns qatex-ts-patterns)
  (tree-sitter-hl-mode))

(provide 'qatex)
;;; qatex.el ends here

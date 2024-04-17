;;; poly-ansible.el --- Polymode for Ansible: Jinja2 in YAML -*- lexical-binding: t; -*-

;; Copyright (C) 2015, 2018, 2020, 2024, Peter Oliver.
;;
;; This file is part of poly-ansible.
;;
;; poly-ansible is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; poly-ansible is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with poly-ansible.  If not, see <https://www.gnu.org/licenses/>.
;;
;; Author: Peter Oliver <poly-ansible@mavit.org.uk>
;; Version: 0.4.0
;; Package-Requires: ((ansible "0.2") (ansible-doc "0.4") (emacs "29") (jinja2-mode "0.2") (polymode "0.2"))
;; Keywords: languages
;; URL: https://gitlab.com/mavit/poly-ansible/

;;; Commentary:

;; Edit YAML files for Ansible containing embedded Jinja2 templating.

;;; Code:

(require 'ansible)
(require 'ansible-doc)
(require 'poly-ansible-jinja2-filters)
(require 'polymode)
(require 'treesit)


(defun jinja2-ansible-functions-keywords (args)
  "Advice to provide additional keywords for Jinja2 filters defined by Ansible.
ARGS is provided by the advised function, `jinja2-functions-keywords'."
  (append args poly-ansible-jinja2-filters))

(advice-add 'jinja2-functions-keywords :filter-return
            #'jinja2-ansible-functions-keywords)

(require 'jinja2-mode)


(defcustom pm-inner/jinja2
  (pm-inner-chunkmode :mode #'jinja2-mode
                      :head-matcher "{[%{#][+-]?"
                      :tail-matcher "[+-]?[%}#]}"
                      :head-mode 'body
                      :tail-mode 'body
                      :head-adjust-face nil)
  "Jinja2 chunk."
  :group 'innermodes
  :type 'object)

(unless (boundp 'poly-yaml-ts-hostmode)
  (define-hostmode poly-yaml-ts-hostmode :mode 'yaml-ts-mode))

;;;###autoload (autoload 'poly-ansible-mode "poly-ansible")
(define-polymode poly-ansible-mode
                 :hostmode (if (treesit-ready-p 'yaml)
                               'poly-yaml-ts-hostmode 'poly-yaml-hostmode)
                 :innermodes '(pm-inner/jinja2)

                 (ansible 1)
                 (ansible-doc-mode 1))


;;;###autoload
(add-to-list 'auto-mode-alist
             '("/ansible/.*\\.ya?ml\\'" . poly-ansible-mode))

;;;###autoload
(add-to-list 'auto-mode-alist
             '("/\\(?:group\\|host\\)_vars/" . poly-ansible-mode))


(provide 'poly-ansible)

;;; poly-ansible.el ends here

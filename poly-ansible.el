;;; poly-ansible.el --- Polymode for Ansible: Jinja2 in YAML -*- lexical-binding: t; -*-

;; Copyright (C) 2015, 2018, Peter Oliver.
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;; Author: Peter Oliver <poly-ansible@mavit.org.uk>
;; Version: 0.2
;; Package-Requires: ((jinja2-mode "0.2") (polymode "0.1.5") (yaml-mode "0.0.13"))
;; Keywords: languages
;; URL: https://gitlab.com/mavit/poly-ansible/

;;; Commentary:

;; Edit YAML files for Ansible containing embedded Jinja2 templating.

;;; Code:

(require 'polymode)


(defcustom pm-inner/jinja2
  (pm-inner-chunkmode :mode #'jinja2-mode
                      :head-matcher "{[%{#][+-]?"
                      :tail-matcher "[+-]?[%}#]}"
                      :head-mode 'body
                      :head-adjust-face nil)
  "Jinja2 chunk."
  :group 'innermodes
  :type 'object)

;;;###autoload (autoload 'poly-ansible-mode "poly-ansible")
(define-polymode poly-ansible-mode
  :hostmode 'pm-host/yaml
  :innermodes '(pm-inner/jinja2))


;;;###autoload
(add-to-list 'auto-mode-alist
             '("/ansible/.*\\.ya?ml$" . poly-ansible-mode))

;;;###autoload
(add-to-list 'auto-mode-alist
             '("/\\(?:group\\|host\\)_vars/" . poly-ansible-mode))


(provide 'poly-ansible)

;;; poly-ansible.el ends here

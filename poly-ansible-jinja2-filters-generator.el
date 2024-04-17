#!/usr/bin/emacs -x

;; Copyright 2024, Peter Oliver.
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

;;; Code:

(let ((filename "poly-ansible-jinja2-filters.el")
      (version-comment
       (concat "Automatically generated for Ansible "
               (with-temp-buffer
                 (shell-command "ansible-doc --version" (current-buffer))
                 (goto-char (point-min))
                 (re-search-forward "\\[core \\([[:digit:]\\.]+\\)\\]")
                 (match-string 1)))))

  (set-buffer (create-file-buffer filename))
  (insert ";; " version-comment "

(defvar poly-ansible-jinja2-filters
  (list")
  (dolist (filters
           (with-temp-buffer
             (shell-command "ansible-doc --list --type=filter --json"
                            (current-buffer))
             (goto-char (point-min))
             (json-parse-buffer :object-type 'alist)))
    (let ((filter-name (symbol-name (car filters))))
      (insert "\n   \"" filter-name "\"")
      (when (string-prefix-p "ansible.builtin." filter-name)
        (insert "\n   \""
                (string-trim-left filter-name "ansible\\.builtin\\.")
                "\""))))
  (insert ")
  \"Additional Jinja2 filters defined by Ansible.
" version-comment "\")

(provide 'poly-ansible-jinja2-filters)")
  (write-file filename))

;;; poly-ansible-jinja2-filters-generator.el ends here

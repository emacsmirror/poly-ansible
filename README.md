# [poly-ansible](https://gitlab.com/mavit/poly-ansible/)

Edit [YAML files for Ansible](https://docs.ansible.com/ansible/latest/reference_appendices/YAMLSyntax.html) containing embedded [Jinja2 templating](http://jinja.pocoo.org/docs/).

This is a [polymode](https://polymode.github.io/), gluing [`jinja2-mode`](https://github.com/paradoxxxzero/jinja2-mode) into either `yaml-ts-mode` or `yaml-mode`.

You will need to ensure that at least one of the following is installed:
- The [`tree-sitter-yaml`](https://github.com/tree-sitter-grammars/tree-sitter-yaml) Tree-sitter parser (Emacs 29 and higher only).
- The [`yaml-mode`](https://github.com/yoshiki/yaml-mode) Emacs package.

If you have installed Emacs with your operating system’s package manager, it may have automatically installed the Tree-sitter parser for you, in which case you should be good to go.

## Copying

Copyright (C) 2015, 2018, 2020, 2024, Peter Oliver.

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <https://www.gnu.org/licenses/>.

# [poly-ansible](https://gitlab.com/mavit/poly-ansible/)

## `poly-ansible-mode`

Edit [YAML files for Ansible](https://docs.ansible.com/ansible/latest/reference_appendices/YAMLSyntax.html) containing embedded [Jinja2 templating](http://jinja.pocoo.org/docs/).

This is a [polymode](https://polymode.github.io/), gluing [`jinja2-mode`](https://github.com/paradoxxxzero/jinja2-mode) into either  [`yaml-mode`](https://github.com/yoshiki/yaml-mode) or `yaml-ts-mode`.  If you usually use `yaml-ts-mode` to edit YAML files, then that mode will be used as the host mode; otherwise, `yaml-mode` will be used.  In either case, minor modes [`ansible-mode`](https://gitlab.com/emacs-ansible/emacs-ansible) and [`ansible-doc-mode`](https://github.com/emacsorphanage/ansible-doc) are both also activated.

Although `yaml-ts-mode` is built in to Emacs, as of version 29 it is missing basic features compared to `yaml-mode` (such as indentation).  It also requires the separate installation of the [`tree-sitter-yaml`](https://github.com/tree-sitter-grammars/tree-sitter-yaml) Tree-sitter parser (either via your operating system’s package manager, via [`treesit-auto`](https://github.com/renzmann/treesit-auto), or manually).

## `poly-systemd-jinja2-mode`

Also included is a polymode gluing `jinja2-mode` into [`systemd-mode`](https://github.com/holomorph/systemd-mode/), for when you’re using templates to create [Systemd unit](https://www.freedesktop.org/software/systemd/man/latest/systemd.unit.html) configurations.

## Copying

Copyright (C) 2015, 2018, 2020, 2024, Peter Oliver.

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <https://www.gnu.org/licenses/>.

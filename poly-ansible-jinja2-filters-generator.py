#!/usr/bin/python3

from ansible.plugins.loader import filter_loader
from ansible.release import __version__

output = open('poly-ansible-jinja2-filters.el', 'w')

version_comment = 'Automatically generated for Ansible ' + __version__ + '.'

output.write(";; " + version_comment + "\n\n")
output.write("(defvar poly-ansible-jinja2-filters\n")
output.write("  (list")

for plugin in filter_loader.all():
    for filter_name in plugin.filters():
        output.write('\n   "' + filter_name + '"')

output.write(")\n")
output.write(
    "  \"Additional Jinja2 filters defined by Ansible.\n"
    + version_comment + "\")\n\n"
)
output.write("(provide 'poly-ansible-jinja2-filters)\n")

output.close()

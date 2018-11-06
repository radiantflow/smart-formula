# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "smartctl/map.jinja" import smartctl with context %}

smartctl-service:
  service.running:
    - name: {{ smartctl.service.name }}
    - enable: True
    - require:
        - pkg: {{ smartctl.pkg }}
    - watch:
        - file: {{ smartctl.config }}
        - file: {{ smartctl.boot_config }}

{% for device in smartctl.devices %}
smartctl -s on /dev/{{ device }}:
  cmd.run:
    - onlyif: "smartctl -i /dev/{{ device }} | grep -q 'SMART support is: Disabled'"
    - require:
      - pkg: {{ smartctl.pkg }}
{% endfor %}
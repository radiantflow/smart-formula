# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "smartmontools/map.jinja" import smartmontools_settings with context %}

smartmontools-service:
  service.running:
    - name: {{ smartmontools_settings.service.name }}
    - enable: True
    - require:
        - pkg: {{ smartmontools_settings.pkg }}
    - watch:
        - file: {{ smartmontools_settings.config }}
        - file: {{ smartmontools_settings.boot_config }}

{% for device in smartmontools_settings.devices %}
smartctl -s on /dev/{{ device }}:
  cmd.run:
    - onlyif: "smartctl -i /dev/{{ device }} | grep -q 'SMART support is: Disabled'"
    - require:
      - pkg: {{ smartmontools_settings.pkg }}
{% endfor %}
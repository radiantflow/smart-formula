# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "smartctl/map.jinja" import smartctl with context %}

smartctl-boot-config:
  file.managed:
    - name: {{ smartctl.boot_config }}
    - source: salt://smartctl/files/smartctl
    - mode: 644
    - user: root
    - group: root
    - template: jinja
    - context:
      smartctl: smartctl

smartctl-config:
  file.managed:
    - name: {{ smartctl.config }}
    - source: salt://smartctl/files/smartd.conf
    - mode: 644
    - user: root
    - group: root
    - template: jinja
    - context:
      smartctl: smartctl

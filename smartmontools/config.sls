# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "smartmontools/map.jinja" import smartmontools_settings with context %}

smartmontools-boot-config:
  file.managed:
    - name: {{ smartmontools_settings.boot_config }}
    - source: salt://smartmontools/files/smartmontools
    - mode: 644
    - user: root
    - group: root
    - template: jinja

smartmontools-config:
  file.managed:
    - name: {{ smartmontools_settings.config }}
    - source: salt://smartmontools/files/smartd.conf
    - mode: 644
    - user: root
    - group: root
    - template: jinja

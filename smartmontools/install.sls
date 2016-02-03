# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "smartmontools/map.jinja" import smartmontools_settings with context %}

smartmontools-pkg:
  pkg.installed:
    - name: {{ smartmontools_settings.pkg }}

sendmail-pkg:
  pkg.installed:
    - name: {{ smartmontools_settings.sendmail_pkg }}
  
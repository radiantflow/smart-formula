# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "smartctl/map.jinja" import smartctl with context %}

smartctl-pkg:
  pkg.installed:
    - name: {{ smartctl.pkg }}

smartctl-sendmail-pkg:
  pkg.installed:
    - name: {{ smartctl.sendmail_pkg }}
  
{{/*
The OpenVPN config secret to be included.
*/}}
{{- define "geek-cookbook.common.addon.vpn.secret" -}}
{{- if and .Values.addons.vpn.configFile (not .Values.addons.vpn.configFileSecret) }}
---
apiVersion: v1
kind: Secret
metadata:
  name: {{ include "geek-cookbook.common.names.fullname" . }}-vpnconfig
  labels: {{- include "geek-cookbook.common.labels" $ | nindent 4 }}
  annotations: {{- include "geek-cookbook.common.annotations" $ | nindent 4 }}
stringData:
  {{- with .Values.addons.vpn.configFile }}
  vpnConfigfile: |-
    {{- . | nindent 4}}
  {{- end }}
{{- end -}}
{{- end -}}

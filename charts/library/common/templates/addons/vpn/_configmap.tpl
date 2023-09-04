{{/*
The VPN config and scripts to be included.
*/}}
{{- define "geek-cookbook.common.addon.vpn.configmap" -}}
{{- if or .Values.addons.vpn.scripts.up .Values.addons.vpn.scripts.down }}
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "geek-cookbook.common.names.fullname" . }}-vpn
  labels: {{- include "geek-cookbook.common.labels" $ | nindent 4 }}
  annotations: {{- include "geek-cookbook.common.annotations" $ | nindent 4 }}
data:
{{- with .Values.addons.vpn.scripts.up }}
  up.sh: |-
    {{- . | nindent 4}}
{{- end }}
{{- with .Values.addons.vpn.scripts.down }}
  down.sh: |-
    {{- . | nindent 4}}
{{- end }}
{{- end -}}
{{- end -}}

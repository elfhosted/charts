{{/*
The OpenVPN credentials secrets to be included.
*/}}
{{- define "geek-cookbook.common.addon.openvpn.secret" -}}
{{- with .Values.addons.vpn.openvpn.auth }}
---
apiVersion: v1
kind: Secret
metadata:
  name: {{ include "geek-cookbook.common.names.fullname" $ }}-openvpn
  labels: {{- include "geek-cookbook.common.labels" $ | nindent 4 }}
  annotations: {{- include "geek-cookbook.common.annotations" $ | nindent 4 }}
data:
  VPN_AUTH: {{ . | b64enc }}
{{- end -}}
{{- end -}}

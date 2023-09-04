{{/*
The Secret object to be created.
*/}}
{{- define "geek-cookbook.common.secret" }}
---
apiVersion: v1
kind: Secret
metadata:
  name: {{ include "geek-cookbook.common.names.fullname" . }}
  labels: {{- include "geek-cookbook.common.labels" $ | nindent 4 }}
  annotations: {{- include "geek-cookbook.common.annotations" $ | nindent 4 }}
type: Opaque
{{- with .Values.secret }}
stringData:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- end }}

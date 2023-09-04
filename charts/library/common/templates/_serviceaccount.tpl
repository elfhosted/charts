{{/*
The ServiceAccount object to be created.
*/}}
{{- define "geek-cookbook.common.serviceAccount" }}
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: {{ include "geek-cookbook.common.names.serviceAccountName" . }}
  labels: {{- include "geek-cookbook.common.labels" $ | nindent 4 }}
  {{- with (merge (.Values.serviceAccount.annotations | default dict) (include "geek-cookbook.common.annotations" $ | fromYaml)) }}
  annotations: {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}

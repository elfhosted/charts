{{/* Common labels shared across objects */}}
{{- define "geek-cookbook.common.labels" -}}
helm.sh/chart: {{ include "geek-cookbook.common.names.chart" . }}
{{ include "geek-cookbook.common.labels.selectorLabels" . }}
  {{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
  {{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
  {{- with .Values.global.labels }}
    {{- range $k, $v := . }}
      {{- $name := $k }}
      {{- $value := tpl $v $ }}
{{ $name }}: {{ quote $value }}
    {{- end }}
  {{- end }}
{{- end -}}

{{/* Selector labels shared across objects */}}
{{- define "geek-cookbook.common.labels.selectorLabels" -}}
app.kubernetes.io/name: {{ include "geek-cookbook.common.names.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

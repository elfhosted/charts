{{/*
Template to render promtail addon
It will include / inject the required templates based on the given values.
*/}}
{{- define "geek-cookbook.common.addon.promtail" -}}
{{- if .Values.addons.promtail.enabled -}}
  {{/* Append the promtail container to the additionalContainers */}}
  {{- $container := include "geek-cookbook.common.addon.promtail.container" . | fromYaml -}}
  {{- if $container -}}
    {{- $_ := set .Values.additionalContainers "addon-promtail" $container -}}
  {{- end -}}

  {{/* Include the configmap if not empty */}}
  {{- $configmap := include "geek-cookbook.common.addon.promtail.configmap" . -}}
  {{- if $configmap -}}
    {{- $configmap | nindent 0 -}}
  {{- end -}}

  {{/* Append the promtail config volume to the volumes */}}
  {{- $volume := include "geek-cookbook.common.addon.promtail.volumeSpec" . | fromYaml -}}
  {{- if $volume -}}
    {{- $_ := set .Values.persistence "promtail-config" (dict "enabled" "true" "mountPath" "-" "type" "custom" "volumeSpec" $volume) -}}
  {{- end -}}
{{- end -}}
{{- end -}}

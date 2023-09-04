{{/*
The volume (referencing config) to be inserted into additionalVolumes.
*/}}
{{- define "geek-cookbook.common.addon.promtail.volumeSpec" -}}
configMap:
  name: {{ include "geek-cookbook.common.names.fullname" . }}-promtail
{{- end -}}

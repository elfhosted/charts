{{/*
Renders the Persistent Volume Claim objects required by the chart.
*/}}
{{- define "geek-cookbook.common.pvc" -}}
  {{- /* Generate pvc as required */ -}}
  {{- range $index, $PVC := .Values.persistence }}
    {{- if and $PVC.enabled (eq (default "pvc" $PVC.type) "pvc") (not $PVC.existingClaim) -}}
      {{- $persistenceValues := $PVC -}}
      {{- if not $persistenceValues.nameOverride -}}
        {{- $_ := set $persistenceValues "nameOverride" $index -}}
      {{- end -}}
      {{- $_ := set $ "ObjectValues" (dict "persistence" $persistenceValues) -}}
      {{- include "geek-cookbook.common.classes.pvc" $ | nindent 0 -}}
    {{- end }}
  {{- end }}
{{- end }}

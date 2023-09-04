{{/*
Renders the configMap objects required by the chart.
*/}}
{{- define "geek-cookbook.common.configmap" -}}
  {{- /* Generate named configMaps as required */ -}}
  {{- range $name, $configmap := .Values.configmap }}
    {{- if $configmap.enabled -}}
      {{- $configmapValues := $configmap -}}

      {{/* set the default nameOverride to the configMap name */}}
      {{- if not $configmapValues.nameOverride -}}
        {{- $_ := set $configmapValues "nameOverride" $name -}}
      {{ end -}}

      {{- $_ := set $ "ObjectValues" (dict "configmap" $configmapValues) -}}
      {{- include "geek-cookbook.common.classes.configmap" $ }}
    {{- end }}
  {{- end }}
{{- end }}

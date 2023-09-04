{{/*
Main entrypoint for the common library chart. It will render all underlying templates based on the provided values.
*/}}
{{- define "geek-cookbook.common.all" -}}
  {{- /* Merge the local chart values and the common chart defaults */ -}}
  {{- include "geek-cookbook.common.values.setup" . }}

  {{- /* Enable code-server add-on if required */ -}}
  {{- if .Values.addons.codeserver.enabled }}
    {{- include "geek-cookbook.common.addon.codeserver" . }}
  {{- end -}}

  {{- /* Enable VPN add-on if required */ -}}
  {{- if .Values.addons.vpn.enabled }}
    {{- include "geek-cookbook.common.addon.vpn" . }}
  {{- end -}}

  {{- /* Enable promtail add-on if required */ -}}
  {{- if .Values.addons.promtail.enabled }}
    {{- include "geek-cookbook.common.addon.promtail" . }}
  {{- end -}}

  {{- /* Enable netshoot add-on if required */ -}}
  {{- if .Values.addons.netshoot.enabled }}
    {{- include "geek-cookbook.common.addon.netshoot" . }}
  {{- end -}}

  {{ include "geek-cookbook.common.configmap" . | nindent 0 }}

  {{- /* Build the templates */ -}}
  {{- include "geek-cookbook.common.pvc" . }}

  {{- if .Values.serviceAccount.create -}}
    {{- include "geek-cookbook.common.serviceAccount" . }}
  {{- end -}}

  {{- if .Values.controller.enabled }}
    {{- if eq .Values.controller.type "deployment" }}
      {{- include "geek-cookbook.common.deployment" . | nindent 0 }}
    {{ else if eq .Values.controller.type "daemonset" }}
      {{- include "geek-cookbook.common.daemonset" . | nindent 0 }}
    {{ else if eq .Values.controller.type "statefulset"  }}
      {{- include "geek-cookbook.common.statefulset" . | nindent 0 }}
    {{ else }}
      {{- fail (printf "Not a valid controller.type (%s)" .Values.controller.type) }}
    {{- end -}}
  {{- end -}}

  {{ include "geek-cookbook.common.classes.hpa" . | nindent 0 }}

  {{ include "geek-cookbook.common.service" . | nindent 0 }}

  {{ include "geek-cookbook.common.ingress" .  | nindent 0 }}

  {{- if .Values.secret -}}
    {{ include "geek-cookbook.common.secret" .  | nindent 0 }}
  {{- end -}}
{{- end -}}

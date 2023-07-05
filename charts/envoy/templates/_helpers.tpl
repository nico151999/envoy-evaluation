{{- define "app.deploymentName" -}}
{{- .Release.Name -}}-app-depl
{{- end -}}

{{- define "envoy.deploymentName" -}}
{{- .Release.Name -}}-envoy-depl
{{- end -}}

{{- define "app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "app.deploymentName" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/component: app
{{- end -}}

{{- define "envoy.selectorLabels" -}}
app.kubernetes.io/name: {{ include "envoy.deploymentName" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/component: gateway
{{- end -}}

{{- define "app.portName" -}}
{{ printf "%s-port" (include "app.deploymentName" . ) | trunc 15 }}
{{- end -}}

{{- define "envoy.portName" -}}
{{ printf "%s-port" (include "envoy.deploymentName" . ) | trunc 15 }}
{{- end -}}

{{- define "app.serviceName" -}}
{{ include "app.deploymentName" . }}-svc
{{- end -}}

{{- define "envoy.serviceName" -}}
{{ include "envoy.deploymentName" . }}-svc
{{- end -}}

{{- define "app.servicePort" -}}
8080
{{- end -}}

{{- define "envoy.servicePort" -}}
8080
{{- end -}}

{{- define "envoy.configMapName" -}}
{{ include "envoy.deploymentName" . }}-cfg
{{- end -}}

{{- define "envoy.deploymentPort" -}}
8080
{{- end -}}

{{- define "envoy.ingressName" -}}
{{ include "envoy.deploymentName" . }}-ing
{{- end -}}
{{- define "main.app_name" }}
{{- /* 
This defines the template of the app name. It will be by default the release name followed by
the name of the chart if using this chart as a sub-chart. Otherwise, if this chart is used as the main chart,
Then the name will be the release name.
You can overwrite this behaviour by setting the 'name' value in the chart.

This value is used as the base to all resources created for this chart.
*/}}
{{- if ne .Chart.Name "main" }}
{{- default (printf "%s-%s" .Release.Name .Chart.Name) .Values.name | trunc 63 | replace "_" "-"}}
{{- else }}
{{- default (printf "%s" .Release.Name) .Values.name | trunc 63 | replace "_" "-"}}
{{- end }}
{{- end -}}
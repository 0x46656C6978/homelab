#!/usr/bin/env bash
helmfile repos
helmfile apply

# Get grafana admin password
# kubectl get secret --namespace system-monitor grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo

# Get jenkins admin password
# kubectl exec --namespace jenkins -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password && echo

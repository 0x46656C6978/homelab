#!/usr/bin/env bash
helmfile repos
helmfile apply

# kubectl get secret --namespace system-monitor grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo

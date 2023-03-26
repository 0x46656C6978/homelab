#!/usr/bin/env bash
helmfile repos
helmfile apply
kubectl apply -k .

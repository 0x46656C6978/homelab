#!/usr/bin/env bash
eval $(egrep -v '^#' .env | xargs)

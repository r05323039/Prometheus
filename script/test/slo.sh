#!/bin/bash
source "$(dirname "$0")/api.sh"

slo() {
  while true; do
    api_error
    sleep 0.1
  done
  # 觀測服務有沒有壞
  # sum(rate(http_server_requests_seconds_count{status=~"2.."}[1m])) / sum(rate(http_server_requests_seconds_count[1m]))
}

slo "$@"

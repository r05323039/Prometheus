#!/bin/bash
source "$(dirname "$0")/test-api.sh"


delay() {
  while true; do
    api_delay
    sleep 0.1
  done
  # 觀測服務快不快
  # histogram_quantile(0.99, sum by (le) (rate(http_server_requests_seconds_bucket[1m])))
}

delay "$@"

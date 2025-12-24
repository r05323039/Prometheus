#!/bin/bash
source "$(dirname "$0")/test-api.sh"

memory() {
  while true; do
    api_memory
    sleep 0.1
  done
  # 服務多久後會死（Old Gen 攀升是 OOM 的前兆）
  #jvm_memory_used_bytes{area="heap"}
  #predict_linear(jvm_memory_used_bytes{area="heap"}[2m], 600)
}

memory "$@"

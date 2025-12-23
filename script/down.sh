#!/bin/bash

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

cd "$PROJECT_ROOT"

echo "正在停止並移除所有服務: $PROJECT_ROOT"

# 如果你想連同數據 (Volumes) 一併刪除，可以加上 -v 參數
docker-compose down -v
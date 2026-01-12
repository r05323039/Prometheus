#!/bin/bash

# 獲取腳本所在目錄的上一層（也就是專案根目錄）
PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

# 切換到根目錄執行
cd "$PROJECT_ROOT"

echo "正在根目錄啟動服務: $PROJECT_ROOT"
docker compose up -d --build --force-recreate

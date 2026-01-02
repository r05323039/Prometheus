#!/bin/bash

# --- 1. 定義變數 ---
PUSHGATEWAY_URL="http://localhost:9091"
JOB_NAME="db_backup"
INSTANCE_NAME="my-server-01"

# 模擬獲取數據 (實際環境中可能是 du -b 或 ls -l)
USER_DB_SIZE=1024
ORDER_DB_SIZE=512
CURRENT_TIME=$(date +%s)

# --- 2. 執行推送 ---
# 使用 cat 將多行指標餵給 curl
cat <<EOF | curl --data-binary @- "${PUSHGATEWAY_URL}/metrics/job/${JOB_NAME}/instance/${INSTANCE_NAME}"
# HELP backup_file_size_bytes 備份檔案大小 (Byte)
# TYPE backup_file_size_bytes gauge
backup_file_size_bytes{db="user_db"} ${USER_DB_SIZE}
backup_file_size_bytes{db="order_db"} ${ORDER_DB_SIZE}

# HELP backup_last_success_unixtime 上次備份成功時間
# TYPE backup_last_success_unixtime gauge
backup_last_success_unixtime ${CURRENT_TIME}
EOF

# --- 3. 檢查結果 ---
if [ $? -eq 0 ]; then
    echo "✅ 指標推送成功！"
else
    echo "❌ 指標推送失敗，請檢查 Pushgateway 是否啟動。"
fi
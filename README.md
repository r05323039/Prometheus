# Prometheus & Alertmanager 監控告警實戰

輕量化的監控解決方案，展示如何快速建立自動化監控鏈路：從數據採集、告警判定到 Gmail 郵件通知。

## 🚀 專案核心特點

* **一鍵部署**：透過 `./script/recreate.sh` 腳本，自動清理並重新建立所有 Docker 資源，確保環境一致性。
* **即時告警**：整合 Alertmanager 與 Gmail SMTP，當服務離線時即時發送通知。
* **配置簡單**：僅需在 `alertmanager.yml` 填入郵件資訊即可完成驗證。

## 🛠 快速上手

### 1. 準備環境
確保你的環境已安裝 Docker 與 Docker Compose。

### 2. 配置郵件
編輯 `alertmanager.yml`，填入你的 Gmail 帳號與應用程式密碼：
```yaml
auth_username: '你的帳號@gmail.com'
auth_password: '你的16位應用程式密碼'
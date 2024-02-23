# BookStack Docker 部署指南

此專案使用 Docker 和 Docker Compose 在系統上部署 BookStack。此設置包括了整合 wkhtmltopdf 來支持將頁面轉換成 PDF 的功能。

## 前置要求

- Docker
- Docker Compose

## 安裝步驟

1. **克隆存儲庫**

首先，克隆或下載這個存儲庫到您的本地系統。

2. **配置環境變量**

在 `docker-compose.yml` 文件中，將以下變量值替換為您的設定：

- `yourdbpass` - 替換為您的資料庫密碼。
- `http://localhost:6875` - 如有需要，請更改為 BookStack 應用 URL。

3. **構建和運行容器**

在包含 `Dockerfile` 和 `docker-compose.yml` 的目錄中運行以下命令：

```sh
docker-compose up -d --build
```

這將會構建並啟動所有必要的 Docker 容器。

4. **設定 `.env` 文件**

將以下環境變量添加到 `bookstack_app_data/www/.env` 文件中：

```env
WKHTMLTOPDF=/bin/wkhtmltopdf
```

這是為了確保 BookStack 可以正確地使用 wkhtmltopdf 來生成 PDF 文件。

## 使用

您現在可以通過訪問 `http://localhost:6875` 來使用 BookStack 了。如果您在步驟 2 中更改了地址，請使用您指定的地址。
# bookstack_chinese_pdf

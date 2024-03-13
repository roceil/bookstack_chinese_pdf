# BookStack Docker Deployment Guide

This project uses Docker and Docker Compose to deploy BookStack on your system. This setup includes integration with wkhtmltopdf to support converting pages into PDF.

- [繁體中文文件](./README_ZH.md)

## Prerequisites

- Docker
- Docker Compose

## Installation Steps

1. **Clone the Repository**

First, clone or download this repository to your local system.

2. **Configure Environment Variables**

In the `docker-compose.yml` file, replace the following variable values with your configuration:

- `yourdbpass` - Replace with your database password.
- `http://localhost:6875` - Change to your BookStack application URL if needed.

3. **Build and Run Containers**

Run the following command in the directory containing `Dockerfile` and `docker-compose.yml`:

```sh
docker-compose up -d --build
```

This will build and start all the necessary Docker containers.

4. **Setup `.env` File**

Add the following environment variable to the `bookstack_app_data/www/.env` file:

```env
WKHTMLTOPDF=/bin/wkhtmltopdf
```

This ensures that BookStack can properly use wkhtmltopdf to generate PDF files.

## Usage

You can now access BookStack by visiting `http://localhost:6875`. If you changed the address in step 2, use the address you specified.

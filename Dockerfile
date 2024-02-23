FROM surnet/alpine-wkhtmltopdf:3.19.0-0.12.6-full as wkhtmltopdf
FROM linuxserver/bookstack:23.12.2

# Install dependencies for wkhtmltopdf
RUN apk add --no-cache \
    libstdc++ \
    libx11 \
    libxrender \
    libxext \
    libssl3 \
    ca-certificates \
    fontconfig \
    freetype \
    ttf-dejavu \
    ttf-droid \
    ttf-freefont \
    ttf-liberation \
  && apk add --no-cache --virtual .build-deps \
    msttcorefonts-installer \
  # 安裝中文字體
  && apk add --no-cache font-noto-cjk \
  # 清除字體快取
  && fc-cache -f \
  && rm -rf /tmp/* \
  && apk del .build-deps

# Copy wkhtmltopdf files from docker-wkhtmltopdf image
COPY --from=wkhtmltopdf /bin/wkhtmltopdf /bin/wkhtmltopdf
COPY --from=wkhtmltopdf /bin/wkhtmltoimage /bin/wkhtmltoimage
COPY --from=wkhtmltopdf /bin/libwkhtmltox* /bin/


#　Bookstack 建立完成後，進到 `bookstack_app_data/www/.env` 增加以下設定
# WKHTMLTOPDF=/bin/wkhtmltopdf
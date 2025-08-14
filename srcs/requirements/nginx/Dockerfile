FROM debian:bookworm

RUN apt-get update && apt-get install -y \
    nginx \
    openssl \
    && rm -rf /var/lib/apt/lists/*

COPY default.conf /etc/nginx/sites-available/default
COPY setup.sh /setup.sh

RUN chmod +x /setup.sh && /setup.sh

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]


#!/bin/sh

mkdir -p /etc/ssl/certs /etc/ssl/private

openssl req -x509 -nodes -days 365 \
  -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=Student/CN=${vnavarre}" \
  -newkey rsa:2048 \
  -keyout /etc/ssl/private/nginx.key \
  -out /etc/ssl/certs/nginx.crt
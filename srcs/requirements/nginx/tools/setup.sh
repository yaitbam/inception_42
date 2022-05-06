#!/bin/sh

sed -i "s~CERT_TEMPLATE~${CERT_NGINX_CRT}~g" /etc/nginx/http.d/default.conf
sed -i "s~KEY_TEMPLATE~${CERT_NGINX_KEY}~g" /etc/nginx/http.d/default.conf
sed -i "s/SERVER_NAME_TEMPLATE/${DOMAIN_NAME}/g" /etc/nginx/http.d/default.conf

nginx -g "daemon off;"
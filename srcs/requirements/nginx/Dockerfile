FROM alpine:3.14

RUN	apk update && apk upgrade && apk add --no-cache \
        nginx \
        vim \
        openssl

# nginx config
RUN mkdir -p /run/nginx
COPY config/wordpress.conf /etc/nginx/http.d/default.conf

ENV	DOMAIN_NAME=${DOMAIN_NAME}	\
        CERT_NGINX_KEY=${CERT_NGINX_KEY} \
        CERT_NGINX_CRT=${CERT_NGINX_CRT}

# nginx SSL
RUN mkdir /etc/nginx/ssl
WORKDIR /etc/nginx/ssl
RUN openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes \
        -keyout yait-bam.42.fr.key -out yait-bam.42.fr.crt \
        -subj "/CN=yait-bam.42.fr" \
        -addext "subjectAltName=DNS:yait-bam.42.fr"

COPY tools/setup.sh /tmp/tools/setup.sh
RUN chmod -R +x /tmp/tools/setup.sh

EXPOSE 443

ENTRYPOINT ["sh", "/tmp/tools/setup.sh"]

# Start nginx
# CMD ["nginx", "-g", "daemon off;"]
FROM alpine:3.14

RUN	apk update && apk upgrade && apk add --no-cache \
    vsftpd

COPY config/vsftpd.conf /tmp/vsftpd.conf
COPY ./tools/ /tmp/tools
RUN	 chmod -R +x /tmp/tools

ENTRYPOINT ["sh", "/tmp/tools/setup.sh"]

# You need to install filezilla to test ftp-server
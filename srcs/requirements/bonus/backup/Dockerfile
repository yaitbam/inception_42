FROM alpine:3.14

RUN apk update && apk upgrade

# Create a backup Folder
RUN mkdir /backup

# ADD ./tools/run.sh to container
COPY ./tools/ /tmp/tools
RUN	 chmod -R +x /tmp/tools

ENTRYPOINT ["sh", "/tmp/tools/run.sh"]
FROM alpine:latest

RUN apk add --no-cache curl

COPY bin/send_email.sh /usr/local/bin/send_email.sh
RUN chmod +x /usr/local/bin/send_email.sh

ENTRYPOINT ["/usr/local/bin/send_email.sh"]

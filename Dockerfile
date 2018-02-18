FROM alpine:latest

RUN apk add --update openvpn iptables bash && \
	rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*


ENV OPENVPN "/etc/openvpn"

COPY rootfs/ /

VOLUME ["/etc/openvpn"]

RUN chmod +x /app-entrypoint.sh && \
	chmod +x /run.sh

#WORKDIR /etc/openvpn

EXPOSE 1194/udp

#ENTRYPOINT ["/app-entrypoint.sh"]

CMD ["/run.sh"]

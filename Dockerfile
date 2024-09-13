FROM ubuntu:focal
ENV PIN 0000
RUN apt-get update && \
    apt-get install --no-install-recommends -y gammu-smsd curl gettext locales ca-certificates && \
	localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && \
	apt-get clean && apt-get autoclean && \
	rm -rf /var/lib/apt/lists/*
ENV LC_ALL en_US.UTF-8
COPY gammurc /etc/gammurc
COPY sms_to_telegram.sh /etc/sms_to_telegram.sh
COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN mkdir /var/log/smsd/ && \
    chmod +x /usr/bin/entrypoint.sh /etc/sms_to_telegram.sh

ENTRYPOINT ["entrypoint.sh"]
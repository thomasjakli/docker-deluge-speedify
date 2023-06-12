FROM linuxserver/deluge:2.0.5-0202202181752ubuntu20.04.1-ls140
COPY --chmod=777 install-speedify.sh /setup/install-speedify.sh

ARG DEBIAN_FRONTEND=noninteractive
RUN . /setup/install-speedify.sh

COPY root/ /

RUN chmod a+x /usr/share/speedify/connect-speedify.sh

ENV \
    SPEEDIFY_USER= \
    SPEEDIFY_PASSWORD= 

EXPOSE 8112 58846 58946 58946/udp

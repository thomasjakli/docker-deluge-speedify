FROM linuxserver/deluge:2.0.5-0202202181752ubuntu20.04.1-ls140
COPY --chmod=777 install-speedify.sh /setup/install-speedify.sh

ARG DEBIAN_FRONTEND=noninteractive
RUN . /setup/install-speedify.sh

COPY root/ /

RUN sed -i "s|SCRIPTS_DIR=\"/config/custom-cont-init.d\"|SCRIPTS_DIR=\"/custom-cont-init.d\"|g" /etc/cont-init.d/99-custom-scripts
RUN sed -i "s|SERVICES_DIR=\"/config/custom-services.d\"|SERVICES_DIR=\"/custom-services.d\"|g" /etc/cont-init.d/99-custom-scripts

RUN chmod a+x /usr/share/speedify/connect-speedify.sh

ENV \
    SPEEDIFY_USER= \
    SPEEDIFY_PASSWORD= 

EXPOSE 8112 58846 58946 58946/udp

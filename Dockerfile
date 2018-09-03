FROM debian:stretch


ENV FAKTURAMA_MAJOR="2.0.2"
ENV FAKTURAMA_VERSION="${FAKTURAMA_MAJOR}.1"
ENV DEBIAN_FRONTEND="noninteractive"
ENV DISPLAY=":0.0"
ENV LANG=de_DE.UTF-8
ENV LANGUAGE de_DE:en
ENV LC_ALL de_DE.UTF-8

COPY fakturama.deb /root/fakturama.deb
COPY com.sebulli.fakturama.rcp.prefs /root/.fakturama2/.metadata/.plugins/org.eclipse.core.runtime/.settings/com.sebulli.fakturama.rcp.prefs

RUN ls -lah /root
RUN apt-get update && \
     apt-get upgrade -y --no-install-recommends && \
     dpkg -i /root/fakturama.deb; \
     apt-get install -f -y --no-install-recommends && \
     apt-get install -y --no-install-recommends libwebkitgtk-3.0-0 locales libreoffice && \
     rm -rf /var/lib/apt/lists/*

RUN sed -i -e 's/# de_DE.UTF-8 UTF-8/de_DE.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen

VOLUME  "/tmp/.X11-unix"
VOLUME "/root/fakturama-workingdir"



ENTRYPOINT ["/usr/share/fakturama2/Fakturama"]

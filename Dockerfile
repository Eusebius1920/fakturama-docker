FROM ubuntu:bionic


ENV FAKTURAMA_MAJOR="2.0.2"
ENV FAKTURAMA_VERSION="${FAKTURAMA_MAJOR}.1"
ENV DEBIAN_FRONTEND="noninteractive"
ENV DISPLAY=":0.0"
ENV LANG=de_DE.UTF-8
ENV LANGUAGE de_DE:en
ENV LC_ALL de_DE.UTF-8

COPY fakturama.deb /root/fakturama.deb

RUN apt-get update && \
    apt-get upgrade -y --no-install-recommends && \
    apt-get install -y locales xterm dbus dbus-x11 && \
    sed -i -e 's/# de_DE.UTF-8 UTF-8/de_DE.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen && \
    dpkg -i /root/fakturama.deb; \
    apt-get install -f -y --no-install-recommends && \
    apt-get install -y --no-install-recommends libwebkitgtk-3.0-0 locales && \
    apt-get install -y libreoffice gvfs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

VOLUME  "/tmp/.X11-unix"
VOLUME "/root/fakturama-workingdir"
VOLUME "/root/.fakturama2"

ENTRYPOINT ["/usr/share/fakturama2/Fakturama"]

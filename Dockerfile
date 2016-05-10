FROM ubuntu:xenial
RUN echo 'deb http://archive.ubuntu.com/ubuntu/ xenial multiverse' >> /etc/apt/sources.list.d/multiverse.list && \
    apt-get update  && apt-get install -y -qq alsa-base alsa-utils alsa-oss pulseaudio libttspico-utils && \
    apt-get -y clean && rm -rf /var/lib/apt/lists/* && echo enable-shm=no >> /etc/pulse/client.conf
ENV PULSE_SERVER /run/pulse/native
COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["picotts", "Bonjour"]

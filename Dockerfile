FROM debian:11-slim
LABEL maintainer="Weltongbi <weltongbi@gmail.com>"
ARG TEA_VERSION=1.5.6

RUN mkdir -p /opt/teaspeak
WORKDIR /opt/teaspeak

# Instalação das dependências básicas e Python 3.9
RUN apt-get update -y && \
    apt-get install --no-install-recommends -y \
    wget \
    curl \
    unzip \
    ca-certificates \
    gnupg2 \
    python3.9 \
    python3.9-distutils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Instalar pip
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.9

# Instalação do yt-dlp
RUN curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/youtube-dl && \
    chmod a+rx /usr/local/bin/youtube-dl && \
    /usr/local/bin/youtube-dl --version

# Instalação do TeaSpeak
RUN wget https://repo.teaspeak.de/server/linux/amd64_stable/TeaSpeak-$TEA_VERSION.tar.gz && \
    tar -xzf TeaSpeak-$TEA_VERSION.tar.gz && \
    rm TeaSpeak-$TEA_VERSION.tar.gz && \
    ./install_music.sh install

COPY config.yml /opt/teaspeak/
COPY protocol_key.txt /opt/teaspeak/

EXPOSE 10011/tcp 30033/tcp 9987/udp 9987/tcp
VOLUME /opt/teaspeak/files /opt/teaspeak/database /opt/teaspeak/certs /opt/teaspeak/logs

SHELL ["/bin/bash", "-c"]
CMD ["./teastart_minimal.sh"]

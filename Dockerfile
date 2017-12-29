# Base docker image
FROM debian:jessie
LABEL maintainer "Christophe Boucharlat <christophe.boucharlat@gmail.com>"

# Discord Version 0.0.4 

RUN apt-get update && apt-get install -y \
    apt-utils \
    dbus-x11 \
    dunst \
    hunspell-en-us \
    libx11-xcb1 \
    libasound2 \
    libatomic1 \
    libgconf-2-4 \
    libnotify4 \
    libnspr4 \
    libnss3 \
    libxss1 \
    libxtst6 \
    libappindicator1 \
    libc++1 \
    wget \
    --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget http://dl.discordapp.net/apps/linux/0.0.4/discord-0.0.4.tar.gz -O /tmp/discord.tar.gz && \
    cd /tmp/ && \
    tar xvzf /tmp/discord.tar.gz && \
    rm /etc/fonts/conf.d/10-scale-bitmap-fonts.conf && \
    fc-cache -fv && \
    rm /tmp/discord.tar.gz

ENV QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb

## Autorun Discord
CMD ["/tmp/Discord/Discord"]

FROM ubuntu
LABEL maintainer="makazeu@gmail.com"

# environment variables
ENV username admin
ENV password admin123
ENV rpc rpc

# prepare
RUN mkdir -p /aria2 \
    && mkdir -p /download \
    && touch /aria2/aria2.session

COPY aria2.conf /aria2
COPY caddy.conf /aria2
COPY entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/entrypoint.sh

# install software
RUN apt update \
    && apt install -y unzip wget aria2

# download yaaw
RUN cd /aria2 \
    && wget -O yaaw.zip https://github.com/binux/yaaw/archive/master.zip \
    && unzip yaaw.zip \
    && mv yaaw-master/ yaaw/ \
    && rm yaaw.zip

# download caddy server
RUN cd /aria2 \
    && wget -O caddy.zip https://mdown.win/dev/caddy.filemanager_v0.10.10_linux_amd64.zip \
    && unzip caddy.zip \
    && rm caddy.zip

EXPOSE 80 6800

ENTRYPOINT ["entrypoint.sh"]
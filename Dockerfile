#################################################
# Copyright (c) 2018 teikoku-penguin
# Released under the MIT license
# https://opensource.org/licenses/mit-license.php
#################################################

FROM alpine:3.8

LABEL maintainer 'teikoku-penguin <ijn.penguin@gmail.com>'

ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:jp
ENV LC_ALL=ja_JP.UTF-8

ENV TIME_ZONE=Asia/Tokyo

# install package
RUN apk update && \
    apk upgrade; \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub; \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk; \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-bin-2.28-r0.apk; \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-i18n-2.28-r0.apk; \
    apk add --no-cache --update \
    bash \
    tzdata \
    glibc-2.28-r0.apk \
    glibc-bin-2.28-r0.apk \
    glibc-i18n-2.28-r0.apk; \
    rm glibc-2.28-r0.apk glibc-bin-2.28-r0.apk glibc-i18n-2.28-r0.apk

# set time zone
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# set language ja_JP
RUN /usr/glibc-compat/bin/localedef -i ja_JP -f UTF-8 ja_JP.UTF-8

CMD ["bash"]
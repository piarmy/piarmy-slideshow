# Experimenting with creating a base Apline/armhf image which includes:
#   * Updates
#   * Base tools
#   * Development tools
#

FROM armhf/alpine
LABEL maintainer "matt@brightpixel.com"

####################
# Toolsets
RUN apk update && apk upgrade && \
  apk add --no-cache --virtual .build-deps \
  alpine-sdk \
  bash git bash-doc bash-completion \
  nano \
  util-linux pciutils usbutils coreutils findutils grep \
  build-base gcc abuild binutils binutils-doc gcc-doc \
  linux-headers \
  eudev-dev \
  man man-pages \
  musl-dev \
  libc-dev \
  flex \
  flex-dev \
  bison \
  readline-dev \
  ca-certificates \
  supervisor \
  openssl \
  ncurses \
  ncurses-dev \
  perl \
  libexif \
  libexif-dev \
  libjpeg-turbo \
  libjpeg-turbo-dev \
  fbida-fbi \
  font-croscore \
  ruby

RUN mkdir /home/piarmy-slideshow
COPY images /home/piarmy-slideshow/images
COPY slideshow.sh /home/piarmy-slideshow/slideshow.sh
WORKDIR /home/piarmy-slideshow

ENTRYPOINT ["/home/piarmy-slideshow/slideshow.sh"]
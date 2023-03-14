# use aws linux
FROM --platform=amd64 ubuntu:jammy

# copy stuff
COPY build.sh /root/

# install stuff
RUN apt update
RUN apt install -q -y git wget zlib-devel perl perl-devel perl-ExtUtils-Embed libxslt libxslt-devel libxml2 libxml2-devel libmaxminddb gd gd-devel
RUN apt install -q -y install build-essential

# the end
CMD ["sh", "/root/build.sh"]

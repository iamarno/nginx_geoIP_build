# use aws linux
FROM --platform=amd64 ubuntu:jammy

# copy stuff
COPY build.sh /root/

# install stuff
RUN apt update
#zlib1g-dev perl perl-devel perl-ExtUtils-Embed libxslt libxslt-devel libxml2 libxml2-devel libmaxminddb gd gd-devel
RUN apt install -q -y install git wget build-essential libpcre3 libpcre3-dev zlib1g zlib1g-dev libssl-dev libgd-dev libxml2 libxml2-dev uuid-dev

# the end
CMD ["sh", "/root/build.sh"]

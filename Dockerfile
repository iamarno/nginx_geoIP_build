# use centos linux
FROM --platform=amd64 quay.io/centos/centos:stream9

# copy stuff
COPY build.sh /root/

# install stuff
RUN yum install -q -y git wget zlib-devel perl perl-devel perl-ExtUtils-Embed libxslt libxslt-devel libxml2 libxml2-devel libmaxminddb gd gd-devel
RUN yum groups -q -y install "Development Tools"

# the end
CMD ["sh", "/root/build.sh"]

#!/bin/bash

###versions

nginx_version="1.23.1"
module_version="3.4"

# install geoIP library
wget https://github.com/maxmind/geoip-api-c/releases/download/v1.6.12/GeoIP-1.6.12.tar.gz
tar xfv GeoIP-1.6.12.tar.gz
cd GeoIP-1.6.12
./configure
make
make check
make install

# build nginx module
echo "build with nginx version $nginx_version"

# download nginx binary from nginx.org
wget http://nginx.org/download/nginx-$nginx_version.tar.gz

# extract
tar xfv nginx-$nginx_version.tar.gz

# cd
cd nginx-$nginx_version

# ./configure
#./configure --with-compat --add-dynamic-module=../ngx_http_geoip2_module-$module_version/ --with-cc-opt=-Wno-stringop-overread
./configure --with-compat --with-http_geoip_module=dynamic

# make
make

# make install
make install

# copy module to module directory
cp objs/ngx_http_geoip_module.so /module/.

exit 0

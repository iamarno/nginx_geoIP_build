#!/bin/bash

###versions

nginx_version="1.23.1"
module_version="3.4"

# build nginx module
echo "build with nginx version $nginx_version"

# download nginx binary from nginx.org
wget http://nginx.org/download/nginx-$nginx_version.tar.gz

# extract
tar xfv nginx-$nginx_version.tar.gz

# download module source
wget https://github.com/leev/ngx_http_geoip2_module/archive/refs/tags/$module_version.tar.gz

# extract
tar xfv $module_version.tar.gz

# cd
cd nginx-$nginx_version

# ./configure
./configure --add-dynamic-module=../ngx_http_geoip2_module-$module_version/
#./configure --with-compat --add-dynamic-module=../ngx_http_geoip2_module-$module_version/ --with-cc-opt=-Wno-stringop-overread

# make
make

# make install
make install

# copy module to module directory
cp objs/ngx_http_geoip2_module.so /module/.

exit 0

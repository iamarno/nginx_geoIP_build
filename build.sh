#!/bin/bash

###versions

nginx_version="1.23.1"
module_version="3.4"

# install libmaxminddb
#echo "install libmaxminddb dependency"
#git clone --recursive https://github.com/maxmind/libmaxminddb
#cd libmaxminddb
#./bootstrap
#./configure
#make
#make install
#cd ..

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
#./configure --with-compat --add-dynamic-module=../ngx_http_geoip2_module-$module_version/
#./configure --with-compat --add-dynamic-module=../ngx_http_geoip2_module-$module_version/ --with-cc-opt=-Wno-stringop-overread
./configure --with-compat --with-http_geoip_module=dynamic
# make
make

# make install
make install

# copy module to module directory
cp objs/ngx_http_geoip2_module.so /module/.

exit 0

#!/usr/bin/env bash

sudo consul-template -consul-addr=10.10.10.12:8500 -template "/vagrant/conf/nginx/default.ctmpl:/etc/nginx/sites-available/default:systemctl reload nginx" &

echo Now inspect /etc/nginx/sites-available/default
echo then run \'sudo apt install nginx\' on consul02 and consul03
echo Inspect /etc/nginx/sites-available/default again

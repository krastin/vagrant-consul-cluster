#!/usr/bin/env bash

mkdir -p /etc/consul.d/
cp /vagrant/conf/* /etc/consul.d/
cat > /etc/consul.d/client.hcl <<EOF
retry_join = ["${BUDDYIPADDR}"]
bind_addr = "${IPADDR}"
EOF
systemctl restart consul

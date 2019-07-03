#!/usr/bin/env bash

mkdir -p /etc/consul.d/
mv /vagrant/conf/* /etc/consul.d/
cat > /etc/consul.d/client.hcl <<EOF
retry_join = ["${BUDDYIPADDR}"]
bind_addr = "${IPADDR}"
node_name = "${NODENAME}"
EOF
systemctl restart consul

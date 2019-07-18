#!/usr/bin/env bash

mkdir -p /etc/consul.d/
cp /vagrant/conf/* /etc/consul.d/
cat > /etc/consul.d/client.hcl <<EOF
retry_join = ["${BUDDYIPADDR}"]
bind_addr = "${IPADDR}"
EOF
cat > /etc/consul.d/dc.hcl <<EOF
bootstrap_expect = ${NODESCOUNT}
datacenter = "${DC}"
retry_join_wan = ["${DCBUDDYIPADDR}"]
EOF
chown -R consul /etc/consul.d
systemctl restart consul

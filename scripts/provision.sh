mv /tmp/etc/consul.d/* /etc/consul.d/
echo '' > /etc/consul.d/client.hcl
echo "retry_join = [\"$BUDDYIPADDR\"]" >> /etc/consul.d/client.hcl
echo "bind_addr = \"$IPADDR\"" >> /etc/consul.d/client.hcl
echo "node_name = \"$NODENAME\"" >> /etc/consul.d/client.hcl
systemctl restart consul
echo "curl 'http://localhost:8500/v1/agent/checks' -G --data-urlencode 'filter=Status != passing'" > ~vagrant/show_failing_checks.sh

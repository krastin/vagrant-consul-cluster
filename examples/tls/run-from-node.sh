#!/usr/bin/bash env

cd /vagrant
echo 'Creating temp file /vagrant/tls_tmp'
mkdir tls_tmp
cd tls_tmp

echo 'Creating a TLS CA'
consul tls ca create

# generate three keys for our servers
echo 'Creating 3 TLS server keys'
consul tls cert create -server
consul tls cert create -server
consul tls cert create -server

# generate one key for our client
echo 'Creating 1 TLS client key'
consul tls cert create -client

# generate one key for the CLI
echo 'Creating 1 TLS CLI key'
consul tls cert create -cli


# put all the keys in each node
echo 'SSH and setting up keys and configs on server node Consul01'
ssh -i '/vagrant/.vagrant/machines/consul01/virtualbox/private_key' -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null  10.10.10.11 "\
sudo cp /vagrant/tls_tmp/consul-agent-ca.pem /etc/consul.d/consul-agent-ca.pem; \
sudo cp /vagrant/tls_tmp/consul-agent-ca-key.pem /etc/consul.d/consul-agent-ca-key.pem; \
sudo cp /vagrant/tls_tmp/dc1-server-consul-0-key.pem /etc/consul.d/dc1-server-consul-key.pem; \
sudo cp /vagrant/tls_tmp/dc1-server-consul-0.pem /etc/consul.d/dc1-server-consul.pem; \
sudo cp /vagrant/tls_tmp/dc1-cli-consul-0-key.pem /etc/consul.d/dc1-cli-consul-key.pem; \
sudo cp /vagrant/tls_tmp/dc1-cli-consul-0.pem /etc/consul.d/dc1-cli-consul.pem; \
sudo cp /vagrant/examples/tls/tls_encryption_server.json /etc/consul.d/ ; \
if grep -q 'Default TLS consul vars' ~/.bashrc; then echo 'skipping env setup config in .bashrc'; else cat /vagrant/examples/tls/https_consul_env.vars >> ~/.bashrc; fi; \
sudo chown consul -R /etc/consul.d; \
sudo systemctl restart consul"

echo 'SSH and setting up keys and configs on server node Consul02'
ssh -i '/vagrant/.vagrant/machines/consul02/virtualbox/private_key' -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null  10.10.10.12 "\
sudo cp /vagrant/tls_tmp/consul-agent-ca.pem /etc/consul.d/consul-agent-ca.pem; \
sudo cp /vagrant/tls_tmp/consul-agent-ca-key.pem /etc/consul.d/consul-agent-ca-key.pem; \
sudo cp /vagrant/tls_tmp/dc1-server-consul-1-key.pem /etc/consul.d/dc1-server-consul-key.pem; \
sudo cp /vagrant/tls_tmp/dc1-server-consul-1.pem /etc/consul.d/dc1-server-consul.pem; \
sudo cp /vagrant/tls_tmp/dc1-cli-consul-0-key.pem /etc/consul.d/dc1-cli-consul-key.pem; \
sudo cp /vagrant/tls_tmp/dc1-cli-consul-0.pem /etc/consul.d/dc1-cli-consul.pem; \
sudo cp /vagrant/examples/tls/tls_encryption_server.json /etc/consul.d/; \
if grep -q 'Default TLS consul vars' ~/.bashrc; then echo 'skipping env setup config in .bashrc'; else cat /vagrant/examples/tls/https_consul_env.vars >> ~/.bashrc; fi; \
sudo chown consul -R /etc/consul.d; \
sudo systemctl restart consul"

echo 'SSH and setting up keys and configs on server node Consul03'
ssh -i '/vagrant/.vagrant/machines/consul03/virtualbox/private_key' -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null  10.10.10.13 "\
sudo cp /vagrant/tls_tmp/consul-agent-ca.pem /etc/consul.d/consul-agent-ca.pem; \
sudo cp /vagrant/tls_tmp/consul-agent-ca-key.pem /etc/consul.d/consul-agent-ca-key.pem; \
sudo cp /vagrant/tls_tmp/dc1-server-consul-2-key.pem /etc/consul.d/dc1-server-consul-key.pem; \
sudo cp /vagrant/tls_tmp/dc1-server-consul-2.pem /etc/consul.d/dc1-server-consul.pem; \
sudo cp /vagrant/tls_tmp/dc1-cli-consul-0-key.pem /etc/consul.d/dc1-cli-consul-key.pem; \
sudo cp /vagrant/tls_tmp/dc1-cli-consul-0.pem /etc/consul.d/dc1-cli-consul.pem; \
sudo cp /vagrant/examples/tls/tls_encryption_server.json /etc/consul.d/; \
if grep -q 'Default TLS consul vars' ~/.bashrc; then echo 'skipping env setup config in .bashrc'; else cat /vagrant/examples/tls/https_consul_env.vars >> ~/.bashrc; fi; \
sudo chown consul -R /etc/consul.d; \
sudo systemctl restart consul"

echo 'SSH and setting up keys and configs on client node revproxy01'
ssh -i '/vagrant/.vagrant/machines/revproxy01/virtualbox/private_key' -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null 10.10.10.10 "\
sudo cp /vagrant/tls_tmp/consul-agent-ca.pem /etc/consul.d/consul-agent-ca.pem; \
sudo cp /vagrant/tls_tmp/dc1-client-consul-0-key.pem /etc/consul.d/dc1-client-consul-key.pem; \
sudo cp /vagrant/tls_tmp/dc1-client-consul-0.pem /etc/consul.d/dc1-client-consul.pem; \
sudo cp /vagrant/tls_tmp/dc1-cli-consul-0-key.pem /etc/consul.d/dc1-cli-consul-key.pem; \
sudo cp /vagrant/tls_tmp/dc1-cli-consul-0.pem /etc/consul.d/dc1-cli-consul.pem; \
sudo cp /vagrant/examples/tls/tls_encryption_client.json /etc/consul.d/; \
if grep -q 'Default TLS consul vars' ~/.bashrc; then echo 'skipping env setup config in .bashrc'; else cat /vagrant/examples/tls/https_consul_env.vars >> ~/.bashrc; fi; \
sudo chown consul -R /etc/consul.d; \
sudo systemctl restart consul"

# cleanup
echo 'Clening up /vagrant/tls_tmp'
cd /tmp
rm -rf /vagrant/tls_tmp

#!/usr/bin/env bash

cp outgoing-only.json /etc/consul.d/encryption.json
systemctl restart consul


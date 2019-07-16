#!/usr/bin/env bash

cp key-only.json /etc/consul.d/encryption.json
systemctl restart consul


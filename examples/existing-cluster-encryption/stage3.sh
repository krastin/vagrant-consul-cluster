#!/usr/bin/env bash

cp encryption.json /etc/consul.d/encryption.json
systemctl restart consul


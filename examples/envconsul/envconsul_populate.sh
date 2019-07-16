#!/usr/bin/env bash
consul kv put 'config/webserver/hostname' 'example.org'
consul kv put 'config/webserver/port' '80'
consul kv put 'config/webserver/sampledata' 'test123123'

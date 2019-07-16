#!/usr/bin/env bash

envconsul -pristine -consul-addr=10.10.10.11:8500 -prefix 'config/webserver' -log-level debug env
envconsul -pristine -consul-addr=10.10.10.12:8500 -prefix 'config/webserver' -log-level debug env
envconsul -pristine -consul-addr=10.10.10.13:8500 -prefix 'config/webserver' -log-level debug env

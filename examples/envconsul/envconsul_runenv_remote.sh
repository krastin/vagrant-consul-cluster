#!/usr/bin/env bash

envconsul -consul-addr=10.10.10.11:8500 -prefix 'config/webserver' env
envconsul -consul-addr=10.10.10.12:8500 -prefix 'config/webserver' env
envconsul -consul-addr=10.10.10.13:8500 -prefix 'config/webserver' env

#!/usr/bin/env bash
curl --request PUT --data '{"name":"krastin"}' http://10.10.10.11:8500/v1/kv/owner

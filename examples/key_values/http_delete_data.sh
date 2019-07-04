#!/usr/bin/env bash
curl --request DELETE --data '{"name":"krastin"}' http://10.10.10.11:8500/v1/kv/owner

#!/usr/bin/env bash
curl \
     --request POST \
     --data @any_query_with_failover.json \
     http://127.0.0.1:8500/v1/query

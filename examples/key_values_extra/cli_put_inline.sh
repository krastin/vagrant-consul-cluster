#!/usr/bin/env bash
echo "inline_cli_passwd" | consul kv put web/config/password -

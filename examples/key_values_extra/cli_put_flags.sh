#!/usr/bin/env bash

consul kv put -flags=41 web/config/password s3cr3t #extra flags for our use

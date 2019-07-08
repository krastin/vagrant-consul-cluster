#!/usr/bin/env bash

# acquire lock
consul kv put -acquire -session=SomeSessionID web/config/inprogress

#
# do some other stuff here regarding the lock
#

#
# This will fail
# consul kv put -acquire -session=SomeOtherSessionID web/config/inprogress 
# 

# unlock
consul kv put -release -session=SomeSessionID web/config/inprogress

#!/usr/bin/env bash
echo "127.0.0.1    postgres" >> /etc/hosts
echo "127.0.0.1    redis" >> /etc/hosts
/etc/init.d/postgresql restart
/etc/init.d/redis-server restart
/bin/bash
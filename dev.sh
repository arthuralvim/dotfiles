#!/bin/bash

source common/functions.sh

sh development/python/install.sh
sh development/ruby/install.sh
sh development/js/install.sh
sh database/elasticsearch/install.sh
sh cache/memcached/install.sh
sh database/postgresql/install.sh
sh database/redis/install.sh
sh database/mongodb/install.sh
sh queue/rabbitmq/install.sh

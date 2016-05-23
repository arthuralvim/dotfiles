#!/bin/bash

source common/functions.sh

sh version-control/git/install.sh
sh zsh/install.sh
sh profile/install.sh
sh search/fzf/install.sh
sh brew/install.sh
sh ubuntu/install.sh
sh webserver/install.sh
sh queue/rabbitmq/install.sh
sh cache/memcached/install.sh
sh database/couchdb/install.sh
sh database/elasticsearch/install.sh
sh database/mysql/install.sh
sh database/redis/install.sh
sh database/riak/install.sh
sh database/mongodb/install.sh
sh database/postgresql/install.sh
sh development/js/install.sh
sh development/python/install.sh
sh development/ruby/install.sh
sh development/go/install.sh
sh development/clojure/install.sh
sh development/test/install.sh

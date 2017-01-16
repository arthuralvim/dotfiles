#!/bin/bash

source common/functions.sh

msg_alert ' ______     ______     ______   __  __     __  __     ______        ______     __         __   __   __     __    __    '
msg_alert '/\  __ \   /\  == \   /\__  _\ /\ \_\ \   /\ \/\ \   /\  == \      /\  __ \   /\ \       /\ \ / /  /\ \   /\  -./  \   '
msg_alert '\ \  __ \  \ \  __<   \/_/\ \/ \ \  __ \  \ \ \_\ \  \ \  __<      \ \  __ \  \ \ \____  \ \ \ /   \ \ \  \ \ \-./\ \  '
msg_alert ' \ \_\ \_\  \ \_\ \_\    \ \_\  \ \_\ \_\  \ \_____\  \ \_\ \_\     \ \_\ \_\  \ \_____\  \ \__|    \ \_\  \ \_\ \ \_\ '
msg_alert '  \/_/\/_/   \/_/ /_/     \/_/   \/_/\/_/   \/_____/   \/_/ /_/      \/_/\/_/   \/_____/   \/_/      \/_/   \/_/  \/_/ '
msg_alert ''

sh queue/rabbitmq/install.sh
sh database/elasticsearch/install.sh
sh database/postgresql/install.sh
sh database/mongodb/install.sh
sh database/redis/install.sh
sh cache/memcached/install.sh
sh development/python/install.sh
sh development/js/install.sh

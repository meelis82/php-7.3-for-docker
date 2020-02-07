#!/usr/bin/env bash

puppet apply --modulepath=/src/php-7.4/run/modules /src/php-7.4/run/run.pp

supervisord -n -c /etc/supervisor/supervisord.conf

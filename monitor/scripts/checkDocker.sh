#!/bin/bash
cd $(dirname $0)/..

if /usr/local/bin/docker-compose ps | grep -q -i 'monitor'; then
  # https://github.com/docker/compose/issues/3352
  COMPOSE_INTERACTIVE_NO_CLI=1 /usr/local/bin/docker-compose exec -T monitor /bin/bash -c 'yarn check-all'
else
  echo "Monitor is not running, skipping checks."
fi

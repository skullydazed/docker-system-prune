#!/bin/sh

# What arguments to pass to `docker system prune`
if [ -z "$DOCKER_SYSTEM_PRUNE_ARGS" ]; then
	DOCKER_SYSTEM_PRUNE_ARGS="-f"
fi

# Date format
if [ -z "$DOCKER_SYSTEM_PRUNE_DATE_FMT" ]; then
	DOCKER_SYSTEM_PRUNE_DATE_FMT="%Y-%m-%d %H:%M:%S %Z"
fi

# How long to wait between runs
if [ -z "$1" -a -z "$DOCKER_SYSTEM_PRUNE_SLEEP" ]; then
	DOCKER_SYSTEM_PRUNE_SLEEP=86400
elif [ -z "$DOCKER_SYSTEM_PRUNE_SLEEP" ]; then
	DOCKER_SYSTEM_PRUNE_SLEEP=$1
fi

# Main
while true; do
	echo "$(date +${DOCKER_SYSTEM_PRUNE_DATE_FMT}) Running 'docker system prune $DOCKER_SYSTEM_PRUNE_ARGS'"
	docker system prune $DOCKER_SYSTEM_PRUNE_ARGS
	echo "$(date +${DOCKER_SYSTEM_PRUNE_DATE_FMT}) Sleeping $DOCKER_SYSTEM_PRUNE_SLEEP seconds...)"
	sleep $DOCKER_SYSTEM_PRUNE_SLEEP
done

#!/bin/sh

# What arguments to pass to `docker system prune`
if [ -z "$DOCKER_SYSTEM_PRUNE_ARGS" ]; then
	DOCKER_SYSTEM_PRUNE_ARGS="-f"
fi

# How long to wait between runs
if [ -z "$1" -a -z "$DOCKER_SYSTEM_PRUNE_SLEEP" ]; then
	DOCKER_SYSTEM_PRUNE_SLEEP=86400
elif [ -z "$DOCKER_SYSTEM_PRUNE_SLEEP" ]; then
	DOCKER_SYSTEM_PRUNE_SLEEP=$1
fi

# Main
while true; do
	echo "$(date) Running 'docker system prune $DOCKER_SYSTEM_PRUNE_ARGS'"
	docker system prune $DOCKER_SYSTEM_PRUNE_ARGS
	echo "$(date) Sleeping $DOCKER_SYSTEM_PRUNE_SLEEP seconds...)"
	sleep $DOCKER_SYSTEM_PRUNE_SLEEP
done

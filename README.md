# Docker System Prune

Executes the `docker system prune` command periodically.

# Usage

This image allows you to program automatically when a prune will be done on your hosts. The main advantage over external solutions like a cron job is that you can launch it in a cluster easily: "fire & forget"

Note: You need to mount the docker socket as a volume to allow the command to be executed in the host.

Unlike [the upstream image](/softonic/docker-system-prune) this was based on, this image runs continuously. It's probably better to do it @softonic's way, but I'm one person running a very small cluster, and this is the easiest way for me to both run this and examine its logs on my rancher infrastructure.

## Installation

use the docker image `skullydazed/docker-system-prune` hosted at http://hub.docker.com/r/skullydazed/docker-system-prune.

## Environment variables

| Variable | Default Value | Description |
|----------|---------------|-------------|
| `DOCKER_SYSTEM_PRUNE_ARGS` | `--force` | The arguments to pass to `docker system prune` |
| `DOCKER_SYSTEM_PRUNE_SLEEP` | `86400` | How long to sleep between runs |

## Rancher

When running this service on a Rancher cluster here are a few tips:

* Under Scale use "Always run one instance of this container on every host"
* Under Volumes click "Add Volume" and enter `/var/run/docker.sock:/var/run/docker.sock`
* Under Security/Host check "Full access to the host"

# Requirements

As it executes the `docker system prune` command this can work only in nodes with Docker versions `>=1.13`

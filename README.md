# Dockerized GitLab

This is a simple GitLab environment built with docker-compose.

## Usage

Follow the steps below to start:

1. `$ make init` - pull images and make **.env** file
2. Setup environments in **.env** file
3. `$ make up` - up the containers

GitLab will run installation scripts in silent mode, wait until it will be available at the address you have configured.
You can watch the progress with `make watch` command.

### GitLab Runner

`$ make runner` - register a new runner.

Runners config will be `./volume/runner/config.toml`.

### Available Makefile commands

* `init` - pull images and make **.env** file
* `up` - up the containers
* `down` - down the containers
* `restart` - restart the containers
* `shell` - connect to the gitlab container
* `watch` - watch the gitlab container logs
* `runner` - register a new gitlab runner

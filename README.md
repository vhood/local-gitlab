# Dockerized GitLab

This is a simple GitLab environment built with docker-compose.

## Requirements

* docker-compose 1.6.0+
* docker 1.10.0+

## Usage

Follow the steps below to start:

1. `$ make config` - create **.env** file from the example
2. Setup environments in **.env** file
3. `$ make up` - up the containers

GitLab will run installation scripts in a silent mode,  
the address you have configured will redirect you to a login page after all done.

You can watch the progress (online logs) with `make watch` command.

### GitLab Runner

`$ make runner` - register a new runner.

Runners config will be `./volume/runner/config.toml`.

### Available Makefile commands

* `config` - create **.env** file from **.env-example**
* `up` - up the containers
* `down` - down the containers
* `restart` - restart the containers
* `shell` - connect to the gitlab container
* `rails-console` - connect to the gitlab-rails console
* `watch` - watch the gitlab container logs
* `runner` - register a new gitlab runner

## Troubleshooting

### Invalid login or password for user "root"

The user "root" is created  automatically only if you send a correct GITLAB_ROOT_PASSWORD environment **on the first gitlab container start**.  
If you doesn't, you have to remove all volume data manually and then up the container again.

You can check the root user exists by rails console:

* `make rails-console`
* `User.where(username: "root").first` - get the root user object

### Runner could not resolve host

If you register a runner and this runner jobs failed with fatal error "Could not resolve host", add current gitlab network from docker-compose to the runner in `./volume/runner/config.toml` like this

```toml
# ...
[[runners]]
  # ...
  [runners.docker]
    # ...
    network_mode = "local-gitlab_gitlab"
```

You can check docker networks with command `docker network ls`

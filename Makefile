init:
	@docker-compose build &&\
	cp .env-example .env

up:
	@docker-compose up -d

down:
	@docker-compose down --remove-orphans

restart: down up

shell:
	@docker-compose exec gitlab /bin/bash

watch:
	@docker-compose logs -f gitlab

runner:
	@docker-compose exec gitlab-runner /bin/gitlab-runner register

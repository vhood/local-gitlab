config:
	@cp .env-example .env

up:
	@docker-compose up --build -d

down:
	@docker-compose down --remove-orphans -v

restart: down up

shell:
	@docker-compose exec gitlab /bin/bash

rails-console:
	@docker-compose exec gitlab gitlab-rails console

watch:
	@docker-compose logs -f gitlab

runner:
	@docker-compose exec gitlab-runner /bin/gitlab-runner register


# Makefile for Django project

# Variables
DJANGO_RUN		= poetry run python -m core.manage
POETRY_RUN		= poetry run
DOCKER_COMPOSE		= docker compose


# Commands
.PHONY: install
install:
	poetry install

.PHONY: install-pre-commit
install-pre-commit:
	$(POETRY_RUN) pre-commit uninstall && $(POETRY_RUN) pre-commit install

.PHONY: lint
lint:
	$(POETRY_RUN) pre-commit run --all-files


.PHONY: run-server
run-server:
	$(DJANGO_RUN) runserver

.PHONY: migrate
migrate:
	$(DJANGO_RUN) migrate

.PHONY: migrations
migrations:
	$(DJANGO_RUN) makemigrations

.PHONY: superuser
superuser:
	$(DJANGO_RUN) createsuperuser


.PHONY: app
app:
	$(eval name=$(filter-out $@,$(MAKECMDGOALS)))
	$(DJANGO_RUN) startapp $(name)
	mv $(name) core/
%:
	@:


.PHONY: local-settings
local-settings:
	if [ ! -f "local/settings.dev.py" ]; then mkdir local && cp ./core/project/settings/templates/settings.dev.py local/settings.dev.py; fi


.PHONY: update
update: install migrate install-pre-commit;

.PHONY: up-dependencies-only
up-dependencies-only:
	test -f .env || touch .env
	$(DOCKER_COMPOSE)  -f docker-compose.dev.yaml up --force-recreate db


.PHONY: collectstatic
collectstatic:
	$(POETRY_RUN) python -m core.manage collectstatic

.PHONY: docker/build
docker/build:
	$(DOCKER_COMPOSE) build

.PHONY: docker/up
docker/up:
	$(DOCKER_COMPOSE) up -d

.PHONY: build-up
build-up:build up;

.PHONY: docker/down
docker/down:
	$(DOCKER_COMPOSE) down

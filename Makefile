
# Makefile for Django project

# Variables commands
POETRY_RUN				= poetry run
DJANGO_RUN				= $(POETRY_RUN) python -m core.manage
PRE_COMMIT_CMD				= $(POETRY_RUN) pre-commit
DOCKER_COMPOSE				= docker compose
CARGO_INSTALL				= cargo install
DOCS_PATH				= docs

# Variables paths
PROJECT_SETTINGS_TEMPLATE_PATH				= core/project/settings/templates/settings.dev.py



# Commands
.PHONY: install
install:
	poetry install

.PHONY: install-pre-commit
install-pre-commit:
	$(PRE_COMMIT_CMD) uninstall && $(PRE_COMMIT_CMD) install

.PHONY: lint
lint:
	$(PRE_COMMIT_CMD) run --all-files


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
	if [ ! -f "local/settings.dev.py" ]; then mkdir local && cp $(PROJECT_SETTINGS_TEMPLATE_PATH) local/settings.dev.py; fi


.PHONY: update
update: install migrate install-pre-commit;

.PHONY: up-dependencies-only
up-dependencies-only:
	test -f .env || touch .env
	$(DOCKER_COMPOSE)  -f docker-compose.dev.yaml up --force-recreate db


.PHONY: collectstatic
collectstatic:
	$(DJANGO_RUN) collectstatic

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

.PHONY: install/cargo
install/cargo:
	curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

.PHONY: install/mdbook
install/mdbook:
	$(CARGO_INSTALL) mdbook


.PHONY: docs/build
docs/build:
	cd $(DOCS_PATH) && mdbook build

.PHONY: docs/serve
docs/serve:
	cd $(DOCS_PATH) && mdbook serve --open

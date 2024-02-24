BASE_COMMAND = poetry run python -m core.manage

.PHONY: install
install:
	poetry install

.PHONY: install-pre-commit
install-pre-commit:
	poetry run pre-commit uninstall && poetry run pre-commit install

.PHONY: lint
lint:
	poetry run pre-commit run --all-files


.PHONY: run-server
run-server:
	$(BASE_COMMAND) runserver

.PHONY: migrate
migrate:
	$(BASE_COMMAND) migrate

.PHONY: migrations
migrations:
	$(BASE_COMMAND) makemigrations

.PHONY: superuser
superuser:
	$(BASE_COMMAND) createsuperuser


.PHONY: app
app:
	$(eval name=$(filter-out $@,$(MAKECMDGOALS)))
	$(BASE_COMMAND) startapp $(name)
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
	docker-compose  -f docker-compose.dev.yaml up --force-recreate db


.PHONY: collectstatic
collectstatic:
	poetry run python -m core.manage collectstatic

.PHONY: build
build:
	docker compose build

.PHONY: up
up:
	docker compose up -d

.PHONY: build-up
build-up:build up;

.PHONY: down
down:
	docker compose down

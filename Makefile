BASE_COMMAND = poetry run python -m core.manage

.PHONY: install
install:
	poetry install

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
	$(BASE_COMMAND) startapp $(name)
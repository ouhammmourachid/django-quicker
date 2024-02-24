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
	$(eval name=$(filter-out $@,$(MAKECMDGOALS)))
	$(BASE_COMMAND) startapp $(name)
	mv $(name) core/
%:
	@:


.PHONY: local-settings
local-settings:
	if [ ! -f "local/settings.dev.py" ]; then mkdir local && cp ./core/project/settings/templates/settings.dev.py local/settings.dev.py; fi
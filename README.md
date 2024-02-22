## Django Quick start

this is s open source template that is pre-configured and ready to work with in Django
* [version-1.0.x](#get-started-with-version-10x)

## Versions
#### get started with `version-1.0.x`:

1. clone the repo and checkout to the `version-1.0.x` branch.

```bash
git clone https://github.com/ouhammmourachid/django-quick-start.git
git checkout version-1.0.x
```

2. run the initial app.

```bash
make migrations
make migrate
make superuser
make run-server
```

and then access the app on [local host](http://127.0.0.1:8000/)

3. create your app like this.

delete the `welcome` app (optional) `rm -rf core/welcome`.

remove the app from the list of installed apps on `core/project/settings.py`

```python
...
INSTALLED_APPS = [
    ...
    # 'core.welcome.apps.WelcomeConfig',
]
...
```
make a new app using this command.

```bash
make app name=AppName
cp AppName core/
```
change the app configuration in the `core/AppName/apps.py`
```python
...
class AppNameConfig(AppConfig):
    ...
    name = 'core.AppName'
...
```
and make sure to add the configuration to the installed apps list in the `core/project/settings.py`.

```python
...
INSTALLED_APPS = [
    ...
    'core.AppName.apps.AppNameConfig',
]
...
```

## TODO for version 2.0.x:

- [ ] add Django split settings.
- [ ] move settings to a new package `core.project.settings`.
- [ ] move the default settings to `core.project.settings.__init__.py`.
- [ ] Create a template for additional settings like docker and others.
- [ ] add `LICENSE` type to the project .
- [ ] upgrade the project to use version 5 of Django.

## TODO for version 3.0.x:
- [ ] add lint tools like `mypy` , `flake8`.
- [ ] add pre-commit tools to the project.
- [ ] add the new command to the `Makefile`.

## TODO for version 4.0.x:
- [ ] add `Dockerfile` for building.
- [ ] add `docker-compose.dev.yml` local dev.
- [ ] add `docker-compose.yml` for deployment.
- [ ] add the docker command to the `Makefile`.

## TODO for version 5.0.x:
- [ ] add git hub actions for lint.
- [ ] add git hub actions for testing.
- [ ] add git hub actions for integrating `codecov`.
- [ ] add git hub actions for deploying the image to a repository. (dockerhub, ghr).
- [ ] add `depandaboot` to update automatiquement update `Pypi` packages.

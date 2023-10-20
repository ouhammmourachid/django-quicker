## Django Quick start

this is s open source template that is pre configured and ready to work with in django

#### get started with version-1.0.x:

1. clone the repo and checkout to `version-1.0.x` branch.

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

3. create your own app like this .

delete the `welcome` app (optional) `rm -rf core/welcome`.

remove the app from the list of instaled apps on `core/project/settings.py`

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
change the the app configuration in the `core/AppName/apps.py`
```python
...
class AppNameConfig(AppConfig):
    ...
    name = 'core.AppName'
...
```
and meke sure to add the configuration to the instaled apps list in the `core/project/settings.py`.

```python
...
INSTALLED_APPS = [
    ...
    'core.AppName.apps.AppNameConfig',
]
...
```

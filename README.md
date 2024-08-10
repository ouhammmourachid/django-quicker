# Django Quicker

[![License: MIT](https://img.shields.io/github/license/ouhammmourachid/django-quicker)](https://github.com/ouhammmourachid/django-quicker/blob/main/LICENSE)
[![ruff badge](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/ruff/main/assets/badge/v2.json)](https://github.com/astral-sh/ruff)
[![Backend Framework](https://img.shields.io/badge/Django-RESTful_API-0C4B33?logo=django)](https://www.djangoproject.com/)
[![Database](https://img.shields.io/badge/PostgreSQL-Database-336791?logo=postgresql)](https://www.postgresql.org/)

Django Quicker is a Django template that helps you to start your Django project quickly. It includes a lot of features that you will need in your project.


## Features

- Django 5.1
- Django REST framework
- PostgreSQL
- Docker
- Docker Compose
- Github Actions
- linters (ruff,mypy,codespell)

## Getting Started

### Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Python](https://www.python.org/downloads/)
- [Poetry](https://python-poetry.org/docs/)
- [Git](https://git-scm.com/downloads)


### Installation

1. Clone the repo

```sh
git clone https://github.com/ouhammmourachid/django-quicker.git
cd django-quicker
```

2. get help command

```sh
$ make help
run 'make' to run the the django server

or 'make <target>' where <target> is one of the following:

  install                               Install the project dependencies
  install-pre-commit                    Install pre-commit hooks
  lint                                  Run pre-commit hooks

  run-server                            Run the django server
  migrate                               Apply migrations
  migrations                            Create migrations
  superuser                             Create superuser
  app <name>                            Create a new app

  local-settings                        Create local settings file
  update                                Install dependencies, apply migrations and install pre-commit hooks
  up-dependencies-only                  Up only the dependencies
  collectstatic                         Collect static files

  docker/build                          Build the docker images
  docker/up                             Up the docker containers
  build-up                              Build and up the docker containers
  docker/down                           Down the docker containers

  install/cargo                         Install cargo
  install/mdbook                        Install mdbook
  docs/build                            Build the documentation
  docs/serve                            Serve the documentation

For more information, see the README.md file.
```

3. Install the project dependencies

```sh
make install
```

4. Create a local settings file

```sh
make local-settings
```

5. Apply migrations

```sh
make migrate
```

6. Create a superuser

```sh
make superuser
```

7. Run the Django server

```sh
make run-server
```

8. Open your browser and go to [http://localhost:8000](http://localhost:8000)

9. You can access the Django admin panel by going to [http://localhost:8000/admin](http://localhost:8000/admin)

10. You can access the Django REST framework by going to [http://localhost:8000/api](http://localhost:8000/api)

## License

Distributed under the [MIT License](LICENSE).


## Contact

If you have any questions or want to get in touch, you can reach out to me at [rachidouhammou21@gmail.com](rachidouhammou21@gmail.com).

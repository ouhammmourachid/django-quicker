from pathlib import Path

from split_settings.tools import include

BASE_DIR = Path(__file__).resolve().parent.parent.parent.parent

# your project NAME
ENVVAR_SETTINGS_PREFIX: str = "APP_NAME_SETTINGS_"


include(
    "base.py",
    "custom.py",
    "envvars.py",
    "docker.py",
)

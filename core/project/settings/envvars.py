from dj_split_settings.utils.collections import deep_update
from dj_split_settings.utils.settings import get_settings_from_environment

# Load settings from environment variables

deep_update(globals(), get_settings_from_environment(ENVVAR_SETTINGS_PREFIX))  # type: ignore # noqa: F821

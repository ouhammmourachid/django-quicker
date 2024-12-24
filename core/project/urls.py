from django.conf import settings
from django.contrib import admin
from django.urls import include, path

from .views import api_info

base: str = f"{settings.API_VERSION}"


urlpatterns = [
    # Admin
    path("admin/", admin.site.urls),
    # Api info
    path(f"{base}/info/", api_info, name="api-info"),
    path(f"{base}/", api_info, name="api-info"),
    # include other app urls
    path(f"{base}/", include("core.accounts.urls")),
    path(f"{base}/", include("core.welcome.urls")),
]

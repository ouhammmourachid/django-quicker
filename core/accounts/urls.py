from django.urls import include, path
from rest_framework import routers

from .views import *

router = routers.SimpleRouter()
router.register("users", UserViewSet, basename="user")

urlpatterns = [
    path("", include(router.urls)),
    # Authentication and Authorization
    path("auth/", include("rest_framework.urls")),
    path("token/", CustomTokenObtainPairView.as_view(), name="token_obtain_pair"),
    path("token/refresh/", CustomTokenRefreshView.as_view(), name="token_refresh"),
]

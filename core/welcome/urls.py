from django.urls import path, include
from .views import *
from rest_framework import routers

router = routers.SimpleRouter()
router.register("welcome", WelcomeView, basename="welcome")

urlpatterns = [
    path("", include(router.urls)),
]
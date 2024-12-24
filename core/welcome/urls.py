from django.urls import path

from .views import *

urlpatterns = [
    path("", WelcomeView.as_view(), name="welcome"),
]

from django.conf import settings
from rest_framework.decorators import api_view
from rest_framework.response import Response


@api_view(["GET"])
def api_info(request):
    api_info = {
        "name": "django-quicker API",
        "version": settings.API_VERSION,
        "description": "API for Django Quicker",
        "author": "Rachid Ouhammou",
        "author_email": "rachidouhammou21@gmail.com",
    }
    return Response(api_info)
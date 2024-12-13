from rest_framework.response import Response
from rest_framework.views import APIView

from core.accounts.permissions import Permission


class WelcomeView(APIView):
    permission_classes = [Permission]

    def get(self, request):
        return Response({"message": "Welcome from Django Quicker API!"})

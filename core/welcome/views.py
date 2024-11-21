from rest_framework.response import Response
from rest_framework.views import APIView

from core.project.permissions import IsAdminAuthenticated


class WelcomeView(APIView):
    permission_classes = [IsAdminAuthenticated]

    def get(self, request):
        return Response({"message": "Welcome from Django Quicker API!"})

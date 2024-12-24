from rest_framework.viewsets import ModelViewSet
from rest_framework.response import Response
from rest_framework import status
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView

from .models import User
from .permissions import Permission, IsAuthenticated
from .serializers import UserSerializer


class UserViewSet(ModelViewSet):
    serializer_class = UserSerializer
    queryset = User.objects.all()
    permission_classes = [Permission]

    def get_permissions(self):
        if self.request.method == "POST":
            return []
        return [Permission()]
    
    def partial_update(self, request, *args, **kwargs):
        user = self.get_object()
        serializer = self.get_serializer(user, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)
        return Response(serializer.data)
    
    def destroy(self, request, *args, **kwargs):
        user = self.get_object()
        user.is_active = False
        user.save()
        return Response({"detail": "User account has been deactivated."}, status=status.HTTP_200_OK)


class CustomTokenObtainPairView(TokenObtainPairView):
    def post(self, request, *args, **kwargs):
        response = super().post(request, *args, **kwargs)

        if response.status_code == 200:
            # Set refresh token in httpOnly cookie
            refresh_token = response.data.pop("refresh")  # Remove from response body
            response.set_cookie(
                "refresh",
                refresh_token,
                httponly=True,
                secure=True,  # Only send over HTTPS
                samesite="Lax",
                max_age=settings.SIMPLE_JWT["REFRESH_TOKEN_LIFETIME"].total_seconds(),
            )
        return response


class CustomTokenRefreshView(TokenRefreshView):
    def post(self, request, *args, **kwargs):
        refresh_token = request.COOKIES.get("refresh")
        if not refresh_token:
            return Response(
                {"error": "No refresh token found in cookies"},
                status=status.HTTP_400_BAD_REQUEST,
            )

        data = request.data.copy()  # Copy the data to make it mutable
        data["refresh"] = refresh_token

        # Replace the request's data with the updated version
        request._full_data = data
        return super().post(request, *args, **kwargs)
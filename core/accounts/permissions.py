from rest_framework.permissions import BasePermission

from .authoritize import Authorization


class Permission(BasePermission):
    permissions = {
        "admin": [
            Authorization.USER_ALL.value,
        ],
        "client": [
            # Authorization.USER_READ.value,
            Authorization.USER_UPDATE.value,
            Authorization.USER_DELETE.value,
        ],
    }

    def has_permission(self, request, view):
        if view.action == "retrieve":
            return True
        if f"{view.basename}::all" in self.permissions[request.user.role]:
            return True
        return (
            self.map_request_to_permission(request, view)
            in self.permissions[request.user.role]
        )

    def has_object_permission(self, request, view, obj):
        if request.user.role == "admin":
            return True
        return obj == request.user

    def map_request_to_permission(self, request, view):
        method_value = {
            "GET": "read",
            "POST": "write",
            "PUT": "update",
            "DELETE": "delete",
            "PATCH": "update",
        }

        return f"{view.basename}::{method_value[request.method]}"


class IsAuthenticated(BasePermission):
    def has_permission(self, request, view):
        return bool(request.user and request.user.is_authenticated)

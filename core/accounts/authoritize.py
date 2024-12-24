from enum import Enum


class Authorization(Enum):
    # User
    USER_READ = "user::read"
    USER_WRITE = "user::write"
    USER_DELETE = "user::delete"
    USER_UPDATE = "user::update"
    USER_ALL = "user::all"

from base import *

class LoginRequest(BaseModel):
    mobile_number: str
    password: str




class UserModel(BaseModel):
    name: str
    username: str
    email: str
    mobile_number: str
    password: str



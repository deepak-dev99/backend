from base import *
# SECRET KEY (should be kept secret in .env or config)
SECRET_KEY = "your_super_secret_key"
ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_SECONDS = 3600

def create_access_token(data: dict, expires_delta: timedelta = None):
    to_encode = data.copy()

    expire = datetime.utcnow() + (expires_delta or timedelta(seconds=ACCESS_TOKEN_EXPIRE_SECONDS))
    to_encode.update({"exp": expire})
    
    encoded_jwt = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
    return encoded_jwt


def decode_access_token(token: str, verify_sign: bool):
    
    
    decoded_jwt = None
    print("verify_signverify_sign",verify_sign,"verify_signverify_sign")
    if(verify_sign):
        decoded_jwt = jwt.decode(token, SECRET_KEY)
    else:
        decoded_jwt = jwt.decode(
            token,
            SECRET_KEY,
            options={
                "verify_signature": False,
                "verify_exp": False
            }
        )
        
        
    
    print(decoded_jwt.get("email"),"decoded_jwtdecoded_jwt")
    return decoded_jwt
from base import *


def verify_token(request: Request):
    token = request.headers.get("authorization")
    if not token:
        raise HTTPException(status_code=401, detail="Missing token")

    try:
        caa.decode_access_token(token.split(" ")[1])
    except Exception:
        raise HTTPException(status_code=401, detail="Invalid token")

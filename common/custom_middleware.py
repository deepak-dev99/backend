from fastapi import Request, HTTPException, Depends
from base import caa,run_query  # assuming caa is defined in base (e.g. token utilities)



def verify_token(request: Request):
    # Get the authorization header
    auth_header = request.headers.get("authorization")

    if not auth_header:
        raise HTTPException(status_code=401, detail="Missing Authorization header")

    try:
        # Expecting "Bearer <token>"
        scheme, token = auth_header.split(" ")
        if scheme.lower() != "bearer":
            raise HTTPException(status_code=401, detail="Invalid token scheme")

        # Decode and verify token
        user_details = caa.decode_access_token(token)

        # Store in request state for later access
        request.state.token = token
        request.state.user_details = user_details

        return user_details  # optional return if you want to use it in Depends
    except ValueError:
        print("Invalid Authorization header format")
        raise HTTPException(status_code=401, detail="Invalid Authorization header format")
    except Exception as e:
        print("Invalid Authorization header format"+str(e))
        raise HTTPException(status_code=401, detail=f"Invalid or expired token: {str(e)}")





def token_busy_info(request: Request):
    
    print("token_busy_info","token_busy_infotoken_busy_info")
    auth_header = request.headers.get("authorization")

    if not auth_header:
        raise HTTPException(status_code=401, detail="Missing Authorization header")

    try:
        # Expecting "Bearer <token>"
        scheme, token = auth_header.split(" ")
        if scheme.lower() != "bearer":
            raise HTTPException(status_code=403, detail="Invalid token scheme")

        # Decode and verify token
        user_details = caa.decode_access_token(token)

        # Store in request state for later access
        request.state.token = token
        request.state.user_details = user_details
        
        
        print(user_details["email"])
        
        
        sqal_q = f"SELECT TOP 1 PartyName FROM BillingDet where Email = '{user_details["email"]}';"
  
        output = run_query(sqal_q)
        
        
        if(len(output) > 0):
            
            # request.state.PartyName = output[0]["PartyName"]
            # request.state.PartyName = output[0]["PartyName"]
            request.state.PartyName = user_details["name"]
            print(output[0]["PartyName"],"outputoutputoutput")
            
        else:
            
            request.state.PartyName = ""
            
        return user_details
            
    except ValueError:
        print("Invalid Authorization header format")
        raise HTTPException(status_code=403, detail="Invalid Busy Authorization header format")
    except Exception as e:
        print("Invalid Authorization header format"+str(e))
        raise HTTPException(status_code=403, detail=f"Busy Invalid or expired token: {str(e)}")

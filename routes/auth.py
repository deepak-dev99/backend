from base import * 
from models import User



router = APIRouter()




@router.post("/login", status_code=200)
def login_user(request: Request,credentials: User.LoginRequest):
    
    print("auth_login called",request,credentials)
    
    
    email = credentials.email
    m_passw = credentials.password
    
    sql_q = f"select * from users where email=%s AND password=%s;"
    data = request.app.state.db.get_data_as_json(sql_q,(email,m_passw))
    
    print(data)
    if(len(data) > 0):
        userInfo = data[0]
        del userInfo["password"]
        userInfo["userType"]="admin_team"
        
        userData = {
            "userInfo":userInfo,
            "token":caa.create_access_token(data=userInfo)
        }
        
        return JSONResponse(status_code=200, content={"status": True, "message":"Login Successfully","data": userData})
    else:
        return JSONResponse(status_code=401, content={"status": True, "message":"Not authorized","data": {}})




@router.post("/customer_login", status_code=200)
def customer_login(request: Request,credentials: User.LoginRequest):
    
    print("customer_login called",request,credentials)
    
    
    email = credentials.email
    m_passw = credentials.password
    
    sql_q = f"select id,uuid,name,email,phone,address,city,state,country,gst,pan,company_name,description,documents,customer_image from customers where email=%s AND password=%s;"
    data = request.app.state.db.get_data_as_json(sql_q,(email,m_passw))
    
    print(data)
    
    
    if(len(data) > 0):
        userInfo = data[0]
        userInfo["userType"]="customer"
        
        userData = {
            "userInfo":userInfo,
            "token":caa.create_access_token(data=userInfo)
        }
        
        return JSONResponse(status_code=200, content={"status": True, "message":"Login Successfully","data": userData})
    else:
        return JSONResponse(status_code=401, content={"status": True, "message":"Not authorized","data": {}})




@router.get("/users", status_code=200)
def users_list(request: Request):
    
    
    print(request.app)
    sql_q = f"select name,username,email,mobile_number from users where status = TRUE"
    sql_q = f"select name,username,email,mobile_number from users where status = TRUE"
    data = request.app.state.db.get_data_as_json(sql_q,())
    return JSONResponse(status_code=200, content={"status": True, "message":"User Fetched Successfully","data": data})
    

@router.post("/user", status_code=200)
def users_list(request: Request,json_data: User.UserModel):

    
    sql_q = f"INSERT INTO users (name,username,email,mobile_number,password, status) VALUES (%s, %s, %s, %s,%s, True)"
    data = request.app.state.db.save_data(sql_q,(json_data.name,json_data.username,json_data.email,json_data.mobile_number,json_data.password))
    
    if(data["success"]):
        return JSONResponse(status_code=200, content={"status": True, "message":"User created Successfully","data": data})
    
    else:    
        return JSONResponse(status_code=400, content={"status": False, "message":"Something went wrong"})
    

# ================================nwwwwww

@router.put("/user", status_code=200)
def users_list(request: Request,json_data: User.UserModel):

    
    sql_q = f"INSERT INTO users (name,username,email,mobile_number,password, status) VALUES (%s, %s, %s, %s,%s, True)"
    data = request.app.state.db.save_data(sql_q,(json_data.name,json_data.username,json_data.email,json_data.mobile_number,json_data.password))
    
    if(data["success"]):
        return JSONResponse(status_code=200, content={"status": True, "message":"User created Successfully","data": data})
    
    else:    
        return JSONResponse(status_code=400, content={"status": False, "message":"Something went wrong"})
    

    


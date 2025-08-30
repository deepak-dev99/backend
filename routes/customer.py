from base import *
from models import Customer


router = APIRouter()


@router.post("/customer", status_code=200)
async def customer_creation(request: Request,customer: Customer.CustomerModel = Depends(Customer.CustomerModel.as_form),customer_image: UploadFile = File(None)):
    
    print("customer called",request,customer,customer_image)
    
    
    
    customer_image_url = ""
    if(customer_image):
        
        print(os.getcwd(),os.path.join("uploads",customer_image.filename),"os.getcwd()")
        customer_image_url = os.path.join("uploads","customer_image",customer_image.filename)
        image_save_path = os.path.join(os.getcwd(),customer_image_url)
        
        print(image_save_path,customer_image_url)
        with open(image_save_path, "wb") as f:
            print(image_save_path,customer_image_url)
            f.write(await customer_image.read())
            


    sql_q = f"INSERT INTO customers(name,email,phone,address,city,state,country,zip_code,customer_type) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)"
    data = request.app.state.db.save_data(sql_q,(customer.name,customer.email,customer.phone,customer.address,customer.city,customer.state,customer.country,customer.zip_code,customer.customer_type))
    
    
    print(data,"customer customer customer")
    
    if(data["success"]):
        return JSONResponse(status_code=200, content={"status": True, "message":"Customer created Successfully","data": data})
    
    else:    
        return JSONResponse(status_code=400, content={"status": False, "message":"Something went wrong"})
    



@router.get("/customer", status_code=200)
async def customer_list(request: Request):
    
    
    print(request.app)
    sql_q = f"select uuid as id,name,email,phone,address,city,state,country,zip_code,customer_type,status from customers where status = TRUE"
    data = request.app.state.db.get_data_as_json(sql_q,())
    
    
    print(data,"datadatadata")
    return JSONResponse(status_code=200, content={"status": True, "message":"Customer Fetched Successfully","data": data})
    
    





@router.post("/sub_customer", status_code=200)
async def sub_customer_creation(request: Request,sub_customer: Customer.SubCustomerModel = Depends(Customer.SubCustomerModel.as_form),sub_customer_image: UploadFile = File(None)):
    
    print("customer called",request,sub_customer,sub_customer_image)
    
    
    
    sub_customer_image_url = ""
    if(sub_customer_image):
        
        print(os.getcwd(),os.path.join("uploads",sub_customer_image.filename),"os.getcwd()")
        sub_customer_image_url = os.path.join("uploads","customer_image",sub_customer_image.filename)
        image_save_path = os.path.join(os.getcwd(),sub_customer_image_url)
        
        print(image_save_path,sub_customer_image_url)
        with open(image_save_path, "wb") as f:
            print(image_save_path,sub_customer_image_url)
            f.write(await sub_customer_image.read())
            


    sql_q = f"INSERT INTO sub_customers(customer_id,name,email,phone,address,city,state,country,zip_code) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)"
    data = request.app.state.db.save_data(sql_q,(sub_customer.customer_id,sub_customer.name,sub_customer.email,sub_customer.phone,sub_customer.address,sub_customer.city,sub_customer.state,sub_customer.country,sub_customer.zip_code))
    
    
    print(data,"customer customer customer")
    
    if(data["success"]):
        return JSONResponse(status_code=200, content={"status": True, "message":"Sub Customer created Successfully","data": data})
    
    else:    
        return JSONResponse(status_code=400, content={"status": False, "message":"Something went wrong"})
    



@router.get("/sub_customer", status_code=200)
async def sub_customer_list(request: Request):
    
    
    print(request.app)
    sql_q = f"SELECT c.name as customer_name,sc.uuid as id,sc.customer_id,sc.name,sc.email,sc.phone,sc.address,sc.city,sc.state,sc.country,sc.zip_code from sub_customers as sc join customers as c on c.uuid = sc.customer_id  where sc.status = TRUE;"
    data = request.app.state.db.get_data_as_json(sql_q,())
    
    
    print(data,"datadatadata")
    return JSONResponse(status_code=200, content={"status": True, "message":"Sub Customer Fetched Successfully","data": data})
    
    

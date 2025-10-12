from base import *
from models import Customer


router = APIRouter()


@router.post("/customer-review", status_code=200)

async def customer_review(request: Request):
    data = await request.json()
    
    
    user_details_id = request.state.user_details["uuid"]
    
    enquiry_id = str(uuid.uuid4())  # unique ID

    sql_q = """
        INSERT INTO enquiries (
            id, name, email, bill_number, phone, enquiry_text,user_id
        )
        VALUES (%s,%s,%s,%s,%s,%s,%s)
    """

    values = (
        enquiry_id,
        data["name"],
        data["email"],
        data["billNumber"],
        data["phone"],
        data["enquiry"],
        user_details_id
    )

    try:
        request.app.state.db.save_data(sql_q, values)  # your DB helper
        return JSONResponse(status_code=200, content={"status": True, "message": "Enquiry saved successfully"})
    except Exception as e:
        return JSONResponse(status_code=400, content={"status": False, "error": str(e)})

    

@router.post("/customer", status_code=200)
async def customer_creation(request: Request,customer: Customer.CustomerModel = Depends(Customer.CustomerModel.as_form),customer_image: UploadFile = File(None)):
    
    print("customer called",request,customer,customer_image)
    
    
    
    customer_image_url = ""
    documents_url = ""
    if(customer_image):
        
        print(os.getcwd(),os.path.join("uploads",customer_image.filename),"os.getcwd()")
        customer_image_url = os.path.join("uploads","customer",customer_image.filename)
        image_save_path = os.path.join(os.getcwd(),customer_image_url)
        
        print(image_save_path,customer_image_url)
        with open(image_save_path, "wb") as f:
            print(image_save_path,customer_image_url)
            f.write(await customer_image.read())
            


    sql_q = f"INSERT INTO customers(name,email,phone,address,city,state,country,zip_code,customer_type,gst,pan,company_name,password,description,documents,customer_image) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
    data = request.app.state.db.save_data(sql_q,(customer.name,customer.email,customer.phone,customer.address,customer.city,customer.state,customer.country,customer.zip_code,customer.customer_type,customer.gst,customer.pan,customer.company_name,customer.password,customer.description,documents_url,customer_image_url))
    
    
    print(data,"customer customer customer")
    
    if(data["success"]):
        return JSONResponse(status_code=200, content={"status": True, "message":"Customer created Successfully","data": data})
    
    else:    
        return JSONResponse(status_code=400, content={"status": False, "message":"Something went wrong"})
    









@router.get("/getmysubcustomer", status_code=200)
async def getmysubcustomer_list(request: Request):
    
    
    cid = request.state.user_details["uuid"]
    print(request.state.token,type(request.state.user_details),"requestrequestrequest")
    sql_q = f"SELECT id,uuid,customer_id,name,email,phone,address,city,state,country,zip_code,status FROM sub_customers WHERE customer_id = '{cid}';"
    data = request.app.state.db.get_data_as_json(sql_q,())
    
    
    # print(data,"datadatadata")
    return JSONResponse(status_code=200, content={"status": True, "message":"Customer Fetched Successfully","data": data})
    
    



@router.get("/customer-review", status_code=200)
async def customer_review_list(request: Request):
    
    user_details_id = request.state.user_details["uuid"]
    print(request.state.token,request.state.user_details,"requestrequestrequest")
    sql_q = f"""SELECT
    e.id AS enquiry_id,
    e.name AS enquiry_name,
    e.email AS enquiry_email,
    e.bill_number,
    e.phone AS enquiry_phone,
    e.enquiry_text,
    c.id AS customer_id,
    c.name AS customer_name,
    c.email AS customer_email,
    c.phone AS customer_phone,
    c.address AS customer_address
FROM enquiries e
LEFT JOIN customers c
    ON e.user_id = c.uuid;
    """
    data = request.app.state.db.get_data_as_json(sql_q,())
    
    
    # print(data,"datadatadata")
    return JSONResponse(status_code=200, content={"status": True, "message":"Customer Fetched Successfully","data": data})
    
    




@router.get("/customer", status_code=200)
async def customer_list(request: Request):
    
    
    print(request.state.token,request.state.user_details,"requestrequestrequest")
    sql_q = f"select uuid as id,name,email,phone,address,city,state,country,zip_code,pan,gst,customer_type,company_name,description,password,status,customer_image from customers where status = TRUE"
    data = request.app.state.db.get_data_as_json(sql_q,())
    
    
    # print(data,"datadatadata")
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
    
    

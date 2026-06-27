from base import *
from models import Salesman


router = APIRouter()



    
@router.get("/salesman", status_code=200)
async def salesman_list(request: Request):
    
    
    sql_q = f"select uuid as id,name,email,phone,address,password,salesman_image from salesmen;"
    data = request.app.state.db.get_data_as_json(sql_q,())
    
    
    # print(data,"datadatadata")
    return JSONResponse(status_code=200, content={"status": True, "message":"Customer Fetched Successfully","data": data})
    
    

@router.post("/salesman", status_code=200)
async def salesman_creation(request: Request,salesman: Salesman.SalesmanModel = Depends(Salesman.SalesmanModel.as_form),salesman_image: UploadFile = File(None)):
    
    print("salesman called",request,salesman,salesman_image)
    
    
    
    salesman_image_url = ""
    documents_url = ""
    if(salesman_image):
        
        print(os.getcwd(),os.path.join("uploads",salesman_image.filename),"os.getcwd()")
        salesman_image_url = os.path.join("uploads","salesman",salesman_image.filename)
        image_save_path = os.path.join(os.getcwd(),salesman_image_url)
        
        print(image_save_path,salesman_image_url)
        with open(image_save_path, "wb") as f:
            print(image_save_path,salesman_image_url)
            f.write(await salesman_image.read())
            


    

    sql_q = f"INSERT INTO salesmen(name,email,phone,address,password,code,status,salesman_image) VALUES (%s,%s,%s,%s,%s,%s,%s,%s)"
    data = request.app.state.db.save_data(sql_q,(salesman.name,salesman.email,salesman.phone,salesman.address,salesman.password,salesman.code,salesman.status,salesman_image_url))
    
    
    print(data,"salesman salesman salesman")
    
    if(data["success"]):
        return JSONResponse(status_code=200, content={"status": True, "message":"salesmen created Successfully","data": data})
    
    else:    
        return JSONResponse(status_code=400, content={"status": False, "message":"Something went wrong"})
    




@router.post("/save_fcm_token", status_code=200)
def save_fcm_token(request: Request,credentials: Salesman.FCMTokenRequest):
    
    print("save_fcm_token called",request.state,request.state.user_details,credentials)
    
    
    
    sql_q = f"update salesmen set app_token = %s where uuid = %s;"
    data = request.app.state.db.save_data(sql_q,(credentials.token,request.state.user_details['uuid'] ))
    
    
    print(credentials,"credentials")




@router.post("/checkin_salesman", status_code=200)
async def salesman_checkin_creation(request: Request,SalesmanCheckin: Salesman.SalesmanCheckinModel = Depends(Salesman.SalesmanCheckinModel.as_form)):
    
    
    
    print(vars(request.state))
    print(request.state.user_details,"requestrequestrequest")
    
    
    salesman_uuid = request.state.user_details.get("uuid","")
    
    
    

    salesman_checkin_image_url = ""

    if SalesmanCheckin.checkin_image:
        salesman_checkin_image_url = os.path.join("uploads", "salesman_checkin", SalesmanCheckin.checkin_image.filename)
        image_save_path = os.path.join(os.getcwd(), salesman_checkin_image_url)

        with open(image_save_path, "wb") as f:
            f.write(await SalesmanCheckin.checkin_image.read())
    
    
    
    sql_q = f"INSERT INTO salesman_checkin(party_id, party_name, party_address, checkin_image, checkin_time, salesman_id) VALUES (%s, %s, %s, %s, %s, %s)"
    data = request.app.state.db.save_data(sql_q,(SalesmanCheckin.party_id, SalesmanCheckin.party_name, SalesmanCheckin.party_address, salesman_checkin_image_url, datetime.now(), salesman_uuid))
    
    
    print(data,"datadatadatadata")

    if(data["success"]):
        return JSONResponse(status_code=200, content={"status": True, "message":"salesmen checkin Successfully","data": {
            "checkin":data["new_id"]
        }})
    
    else:    
        return JSONResponse(status_code=400, content={"status": False, "message":"Something went wrong"})





@router.post("/checkout_salesman", status_code=200)
async def salesman_checkout_creation(request: Request,SalesmanCheckout: Salesman.SalesmanCheckoutModel = Depends(Salesman.SalesmanCheckoutModel.as_form)):
    
    
    
    

    salesman_checkout_image_url = ""

    if SalesmanCheckout.checkout_image:
        salesman_checkout_image_url = os.path.join("uploads", "salesman_checkin", SalesmanCheckout.checkout_image.filename)
        image_save_path = os.path.join(os.getcwd(), salesman_checkout_image_url)

        with open(image_save_path, "wb") as f:
            f.write(await SalesmanCheckout.checkout_image.read())
    
    
    
    print(SalesmanCheckout.checkin_id,"SalesmanCheckout.discussion")
    
    sql_q = f"update salesman_checkin set checkout_image = %s, checkout_time = %s, discussion = %s, purpose = %s, remarks = %s where uuid = %s;"
    data = request.app.state.db.save_data(sql_q,(salesman_checkout_image_url, datetime.now(), SalesmanCheckout.discussion, SalesmanCheckout.purpose,SalesmanCheckout.remarks, SalesmanCheckout.checkin_id))
    
    
    print(data,"datadatadatadata")

    if(data["success"]):
        return JSONResponse(status_code=200, content={"status": True, "message":"salesmen checkin Successfully","data": {
            "checkin":data["new_id"]
        }})
    
    else:    
        return JSONResponse(status_code=400, content={"status": False, "message":"Something went wrong"})








@router.get("/salesman_visit_history", status_code=200)
async def salesman_visit_history(request: Request):
    
    
    salesman_uuid = request.state.user_details.get("uuid","")
    
    
    sql_q = f"""
    SELECT 
        uuid,
        party_id,
        party_name,
        party_address,
        checkin_image,
        checkout_image,
        discussion,
        remarks,
        purpose,
    TO_CHAR(checkin_time::timestamp, 'YYYY-MM-DD HH24:MI:SS') AS checkin_time,
    TO_CHAR(checkout_time::timestamp, 'YYYY-MM-DD HH24:MI:SS') AS checkout_time
    FROM salesman_checkin
    where salesman_id = %s
    ORDER BY created_at DESC;
"""
    data = request.app.state.db.get_data_as_json(sql_q,(salesman_uuid,))
    
    
    # print(data,"datadatadata")
    return JSONResponse(status_code=200, content={"status": True, "message":"Customer Fetched Successfully","data": data})
    
    




@router.get("/salesman_one_visit_history/{one_uuid}", status_code=200)
async def salesman_one_visit_history(request: Request, one_uuid: str):
    
    
    
    print(one_uuid,"one_uuidone_uuidone_uuid")
    
    
    print(request.state.user_details,"requestrequestrequest")
    
    
    salesman_uuid = request.state.user_details.get("uuid","")
    
    
    
    sql_q = f"""
        SELECT 
            sc.party_id,
            sc.party_name,
            sc.uuid,
            sc.purpose,
            sc.discussion,
            sc.party_address,
            sc.checkin_image,
            sc.checkout_image,
            TO_CHAR(sc.checkin_time::timestamp, 'YYYY-MM-DD HH24:MI:SS') AS checkin_time,
            TO_CHAR(sc.checkout_time::timestamp, 'YYYY-MM-DD HH24:MI:SS') AS checkout_time,
            (
                SELECT json_agg(
                    jsonb_build_array(
                        ci.lat,
                        ci.lng
                    )
                )
                FROM salesman_location ci
                WHERE ci.salesman_uuid = sc.uuid
            ) AS items_array
        FROM salesman_checkin sc
        WHERE sc.uuid = %s AND 
        sc.salesman_id = %s
        ;
    """
    data = request.app.state.db.get_data_as_json(sql_q,(one_uuid,salesman_uuid))
    
    
    if(len(data) > 0):
        return JSONResponse(status_code=200, content={"status": True, "message":"Customer Fetched Successfully","data": data[0]})
    else:
        return JSONResponse(status_code=200, content={"status": True, "message":"Customer Fetched Successfully","data": {}})
    # print(data,"datadatadata")
    
    
    
    




@router.post("/add_party", status_code=200)
def save_add_party(request: Request,salesmanAddParty: Salesman.SalesmanAddPartyModel):
    
    sql_q = """
        INSERT INTO parties (
            party_name,
            owner_name,
            mobile,
            gst,
            address,
            salesman_id,
            status
        )
        VALUES (%s, %s, %s, %s, %s, %s, %s)
    """
    data = request.app.state.db.save_data(sql_q,(
        salesmanAddParty.party_name,
        salesmanAddParty.owner_name,
        salesmanAddParty.mobile,
        salesmanAddParty.gst,
        salesmanAddParty.address,
        request.state.user_details['uuid'],
        "Pending"
    ))
    
    if(data["success"]):
        return JSONResponse(status_code=200, content={"status": True, "message":"salesmen Party created Successfully","data": data})
    
    else:    
        return JSONResponse(status_code=400, content={"status": False, "message":"Something went wrong"})
    






# @router.get("/customer-review", status_code=200)
# async def customer_review_list(request: Request):
    
#     user_details_id = request.state.user_details["uuid"]
#     print(request.state.token,request.state.user_details,"requestrequestrequest")
#     sql_q = f"""SELECT
#     e.id AS enquiry_id,
#     e.name AS enquiry_name,
#     e.email AS enquiry_email,
#     e.bill_number,
#     e.phone AS enquiry_phone,
#     e.enquiry_text,
#     c.id AS customer_id,
#     c.name AS customer_name,
#     c.email AS customer_email,
#     c.phone AS customer_phone,
#     c.address AS customer_address
# FROM enquiries e
# LEFT JOIN customers c
#     ON e.user_id = c.uuid;
#     """
#     data = request.app.state.db.get_data_as_json(sql_q,())
    
    
#     # print(data,"datadatadata")
#     return JSONResponse(status_code=200, content={"status": True, "message":"Customer Fetched Successfully","data": data})
    
    


# @router.post("/customer-review", status_code=200)

# async def customer_review(request: Request):
#     data = await request.json()
    
    
#     user_details_id = request.state.user_details["uuid"]
    
#     enquiry_id = str(uuid.uuid4())  # unique ID

#     sql_q = """
#         INSERT INTO enquiries (
#             id, name, email, bill_number, phone, enquiry_text,user_id
#         )
#         VALUES (%s,%s,%s,%s,%s,%s,%s)
#     """

#     values = (
#         enquiry_id,
#         data["name"],
#         data["email"],
#         data["billNumber"],
#         data["phone"],
#         data["enquiry"],
#         user_details_id
#     )

#     try:
#         request.app.state.db.save_data(sql_q, values)  # your DB helper
#         return JSONResponse(status_code=200, content={"status": True, "message": "Enquiry saved successfully"})
#     except Exception as e:
#         return JSONResponse(status_code=400, content={"status": False, "error": str(e)})

    
# @router.get("/customer", status_code=200)
# async def customer_list(request: Request):
    
    
#     print(request.state.token,request.state.user_details,"requestrequestrequest")
#     sql_q = f"select uuid as id,name,email,phone,address,city,state,country,zip_code,pan,gst,customer_type,company_name,description,password,status,customer_image from customers where status = TRUE"
#     data = request.app.state.db.get_data_as_json(sql_q,())
    
    
#     # print(data,"datadatadata")
#     return JSONResponse(status_code=200, content={"status": True, "message":"Customer Fetched Successfully","data": data})
    
    


# @router.post("/customer", status_code=200)
# async def customer_creation(request: Request,customer: Customer.CustomerModel = Depends(Customer.CustomerModel.as_form),customer_image: UploadFile = File(None)):
    
#     print("customer called",request,customer,customer_image)
    
    
    
#     customer_image_url = ""
#     documents_url = ""
#     if(customer_image):
        
#         print(os.getcwd(),os.path.join("uploads",customer_image.filename),"os.getcwd()")
#         customer_image_url = os.path.join("uploads","customer",customer_image.filename)
#         image_save_path = os.path.join(os.getcwd(),customer_image_url)
        
#         print(image_save_path,customer_image_url)
#         with open(image_save_path, "wb") as f:
#             print(image_save_path,customer_image_url)
#             f.write(await customer_image.read())
            


#     sql_q = f"INSERT INTO customers(name,email,phone,address,city,state,country,zip_code,customer_type,gst,pan,company_name,password,description,documents,customer_image) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
#     data = request.app.state.db.save_data(sql_q,(customer.name,customer.email,customer.phone,customer.address,customer.city,customer.state,customer.country,customer.zip_code,customer.customer_type,customer.gst,customer.pan,customer.company_name,customer.password,customer.description,documents_url,customer_image_url))
    
    
#     print(data,"customer customer customer")
    
#     if(data["success"]):
#         return JSONResponse(status_code=200, content={"status": True, "message":"Customer created Successfully","data": data})
    
#     else:    
#         return JSONResponse(status_code=400, content={"status": False, "message":"Something went wrong"})
    



# @router.put("/customer/{customer_id}", status_code=200)
# async def update_customer(
#     customer_id: str,
#     request: Request,
#     customer: Customer.CustomerModel = Depends(Customer.CustomerModel.as_form),
#     customer_image: UploadFile = File(None)
# ):

#     customer_image_url = ""

#     if customer_image:
#         customer_image_url = os.path.join("uploads", "customer", customer_image.filename)
#         image_save_path = os.path.join(os.getcwd(), customer_image_url)

#         with open(image_save_path, "wb") as f:
#             f.write(await customer_image.read())

#     sql_q = """
#         UPDATE customers
#         SET name=%s,
#             email=%s,
#             phone=%s,
#             address=%s,
#             city=%s,
#             state=%s,
#             country=%s,
#             zip_code=%s,
#             customer_type=%s,
#             gst=%s,
#             pan=%s,
#             company_name=%s,
#             password=%s,
#             description=%s,
#             customer_image=%s
#         WHERE uuid=%s
#     """

#     values = (
#         customer.name,
#         customer.email,
#         customer.phone,
#         customer.address,
#         customer.city,
#         customer.state,
#         customer.country,
#         customer.zip_code,
#         customer.customer_type,
#         customer.gst,
#         customer.pan,
#         customer.company_name,
#         customer.password,
#         customer.description,
#         customer_image_url,
#         customer_id
#     )

#     data = request.app.state.db.execute_update_query(sql_q, values)

#     if data["success"]:
#         return JSONResponse(
#             status_code=200,
#             content={"status": True, "message": "Customer updated successfully"}
#         )

#     return JSONResponse(
#         status_code=400,
#         content={"status": False, "message": "Something went wrong"}
#     )


# @router.delete("/customer/{customer_id}", status_code=200)
# async def soft_delete_customer(customer_id: str, request: Request):

#     sql_q = """
#         UPDATE customers
#         SET is_deleted = TRUE,
#             deleted_at = NOW()
#         WHERE id = %s
#     """

#     try:
#         request.app.state.db.execute_update_query(sql_q, (customer_id,))
#         return JSONResponse(
#             status_code=200,
#             content={"status": True, "message": "Customer soft deleted successfully"}
#         )
#     except Exception as e:
#         return JSONResponse(
#             status_code=400,
#             content={"status": False, "error": str(e)}
#         )



# @router.get("/getmysubcustomer", status_code=200)
# async def getmysubcustomer_list(request: Request):
    
    
#     cid = request.state.user_details["uuid"]
#     print(request.state.token,type(request.state.user_details),"requestrequestrequest")
#     sql_q = f"SELECT id,uuid,customer_id,name,email,phone,address,city,state,country,zip_code,status FROM sub_customers WHERE customer_id = '{cid}';"
#     data = request.app.state.db.get_data_as_json(sql_q,())
    
    
#     # print(data,"datadatadata")
#     return JSONResponse(status_code=200, content={"status": True, "message":"Customer Fetched Successfully","data": data})
    
    





# @router.post("/sub_customer", status_code=200)
# async def sub_customer_creation(request: Request,sub_customer: Customer.SubCustomerModel = Depends(Customer.SubCustomerModel.as_form),sub_customer_image: UploadFile = File(None)):
    
#     print("customer called",request,sub_customer,sub_customer_image)
    
    
    
#     sub_customer_image_url = ""
#     if(sub_customer_image):
        
#         print(os.getcwd(),os.path.join("uploads",sub_customer_image.filename),"os.getcwd()")
#         sub_customer_image_url = os.path.join("uploads","customer_image",sub_customer_image.filename)
#         image_save_path = os.path.join(os.getcwd(),sub_customer_image_url)
        
#         print(image_save_path,sub_customer_image_url)
#         with open(image_save_path, "wb") as f:
#             print(image_save_path,sub_customer_image_url)
#             f.write(await sub_customer_image.read())
            


#     sql_q = f"INSERT INTO sub_customers(customer_id,name,email,phone,address,city,state,country,zip_code) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)"
#     data = request.app.state.db.save_data(sql_q,(sub_customer.customer_id,sub_customer.name,sub_customer.email,sub_customer.phone,sub_customer.address,sub_customer.city,sub_customer.state,sub_customer.country,sub_customer.zip_code))
    
    
#     print(data,"customer customer customer")
    
#     if(data["success"]):
#         return JSONResponse(status_code=200, content={"status": True, "message":"Sub Customer created Successfully","data": data})
    
#     else:    
#         return JSONResponse(status_code=400, content={"status": False, "message":"Something went wrong"})
    



# @router.get("/sub_customer", status_code=200)
# async def sub_customer_list(request: Request):
    
    
#     print(request.app)
#     sql_q = f"SELECT c.name as customer_name,sc.uuid as id,sc.customer_id,sc.name,sc.email,sc.phone,sc.address,sc.city,sc.state,sc.country,sc.zip_code from sub_customers as sc join customers as c on c.uuid = sc.customer_id  where sc.status = TRUE;"
#     data = request.app.state.db.get_data_as_json(sql_q,())
    
    
#     print(data,"datadatadata")
#     return JSONResponse(status_code=200, content={"status": True, "message":"Sub Customer Fetched Successfully","data": data})
    
    

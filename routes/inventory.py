from base import * 
from models import Inventory



router = APIRouter()




@router.post("/category", status_code=200)
def category_creation(request: Request,category: Inventory.CategoryModel):
    
    print("category called",request,category)

    
    sql_q = f"INSERT INTO category (category_name) VALUES (%s)"
    data = request.app.state.db.save_data(sql_q,(category.category_name,))
    
    
    print(data,"category_namecategory_name")
    
    if(data["success"]):
        return JSONResponse(status_code=200, content={"status": True, "message":"User created Successfully","data": data})
    
    else:    
        return JSONResponse(status_code=400, content={"status": False, "message":"Something went wrong"})
    


@router.get("/category", status_code=200)
def category_list(request: Request):
    
    
    print(request.app)
    sql_q = f"select * from category where status = TRUE"
    data = request.app.state.db.get_data_as_json(sql_q,())
    return JSONResponse(status_code=200, content={"status": True, "message":"Category Fetched Successfully","data": data})
    
    
    
    



@router.post("/sub_category", status_code=200)
def sub_category_creation(request: Request,sub_category: Inventory.SubCategoryModel):
    
    print("sub_category called",request,sub_category)

    
    sql_q = f"INSERT INTO sub_category (category_id,sub_category_name) VALUES (%s,%s)"
    data = request.app.state.db.save_data(sql_q,(sub_category.category_id,sub_category.sub_category_name))
    
    
    print(data,"sub_categorysub_category")
    
    if(data["success"]):
        return JSONResponse(status_code=200, content={"status": True, "message":"Subcategory created Successfully","data": data})
    
    else:    
        return JSONResponse(status_code=400, content={"status": False, "message":"Something went wrong"})
    


@router.get("/sub_category", status_code=200)
def sub_category_list(request: Request):
    
    
    print(request.app)
    sql_q = f"SELECT sub_c.id as id,c.id as category_id,c.category_name as category_name, sub_c.sub_category_name from public.sub_category as sub_c join public.category as c on c.id = sub_c.category_id where sub_c.status = TRUE"
    data = request.app.state.db.get_data_as_json(sql_q,())
    return JSONResponse(status_code=200, content={"status": True, "message":"Subcategory Fetched Successfully","data": data})
    






@router.post("/product_type", status_code=200)
def product_type(request: Request,product_type: Inventory.ProductTypeModel):
    
    print("sub_category called",request,product_type)

    
    sql_q = f"INSERT INTO product_type(category_id,sub_category_id,product_type_name) VALUES (%s,%s,%s)"
    data = request.app.state.db.save_data(sql_q,(product_type.category_id,product_type.sub_category_id,product_type.product_type_name))
    
    
    print(data,"sub_categorysub_category")
    
    if(data["success"]):
        return JSONResponse(status_code=200, content={"status": True, "message":"Product Type created Successfully","data": data})
    
    else:    
        return JSONResponse(status_code=400, content={"status": False, "message":"Something went wrong"})
    


@router.get("/product_type", status_code=200)
def product_type(request: Request):
    
    
    print(request.app)
    sql_q = f"""
        SELECT cat_sub_data.category_name,cat_sub_data.sub_category_name,pt.*
        FROM public.product_type AS pt join (
            SELECT 
                c.id AS id,
                c.id AS category_id,
                c.category_name AS category_name,
                sub_c.sub_category_name
            FROM public.sub_category AS sub_c
            JOIN public.category AS c 
                ON c.id = sub_c.category_id
        ) AS cat_sub_data
            ON pt.sub_category_id = cat_sub_data.id
        where pt.status = TRUE;
    """
    
    
    data = request.app.state.db.get_data_as_json(sql_q,())
    return JSONResponse(status_code=200, content={"status": True, "message":"Product Type Fetched Successfully","data": data})
    

# @router.post("/user", status_code=200)
# def users_list(request: Request,json_data: User.UserModel):

    
#     sql_q = f"INSERT INTO users (name,username,email,mobile_number,password, status) VALUES (%s, %s, %s, %s,%s, True)"
#     data = request.app.state.db.save_data(sql_q,(json_data.name,json_data.username,json_data.email,json_data.mobile_number,json_data.password))
    
#     if(data["success"]):
#         return JSONResponse(status_code=200, content={"status": True, "message":"User created Successfully","data": data})
    
#     else:    
#         return JSONResponse(status_code=400, content={"status": False, "message":"Something went wrong"})
    

# # ================================nwwwwww

# @router.put("/user", status_code=200)
# def users_list(request: Request,json_data: User.UserModel):

    
#     sql_q = f"INSERT INTO users (name,username,email,mobile_number,password, status) VALUES (%s, %s, %s, %s,%s, True)"
#     data = request.app.state.db.save_data(sql_q,(json_data.name,json_data.username,json_data.email,json_data.mobile_number,json_data.password))
    
#     if(data["success"]):
#         return JSONResponse(status_code=200, content={"status": True, "message":"User created Successfully","data": data})
    
#     else:    
#         return JSONResponse(status_code=400, content={"status": False, "message":"Something went wrong"})
    

    


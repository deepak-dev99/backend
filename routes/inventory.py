from base import * 
from models import Inventory



router = APIRouter()




@router.post("/category", status_code=200)
@router.patch("/category/{cat_id}", status_code=200)
async def category_creation_and_updation(request: Request,cat_id=None,category: Inventory.CategoryModel = Depends(Inventory.CategoryModel.as_form),category_image: UploadFile = File(None)):
    
    print("category called",request,category,cat_id)


    category_image_url = ""
    if(category_image):
        
        print(os.getcwd(),os.path.join("uploads",category_image.filename),"os.getcwd()")
        category_image_url = os.path.join("uploads","category",category_image.filename)
        image_save_path = os.path.join(os.getcwd(),category_image_url)
        
        print(image_save_path,category_image_url)
        with open(image_save_path, "wb") as f:
            print(image_save_path,category_image_url)
            f.write(await category_image.read())
            

    
    sql_q = f"INSERT INTO category (category_name,category_image) VALUES (%s,%s)"
    data = request.app.state.db.save_data(sql_q,(category.category_name,category_image_url))
    
    
    print(data,"category_namecategory_name")
    
    if(data["success"]):
        return JSONResponse(status_code=200, content={"status": True, "message":"User created Successfully","data": data})
    
    else:    
        return JSONResponse(status_code=400, content={"status": False, "message":"Something went wrong"})
    


@router.get("/category", status_code=200)
async def category_list(request: Request):
    
    
    print(request.app)
    sql_q = f"select uuid as id,category_name,category_image from category where status = TRUE"
    data = request.app.state.db.get_data_as_json(sql_q,())
    return JSONResponse(status_code=200, content={"status": True, "message":"Category Fetched Successfully","data": data})
    
        


@router.delete("/category/{cat_id}", status_code=200)
async def category_delete(request: Request,cat_id):
    
    
    print(request.app,"cat_idcat_idcat_id",cat_id)
    sql_q = f"delete from category where uuid = %s"
    data = request.app.state.db.delete_data(sql_q,(cat_id,))
    return JSONResponse(status_code=200, content={"status": True, "message":"Category Deleted Successfully","data": data})
    
    
    
    
    

@router.patch("/category/{cat_id}", status_code=200)
async def category_delete(request: Request,cat_id,category: Inventory.CategoryModel = Depends(Inventory.CategoryModel.as_form),category_image: UploadFile = File(None)):
    
    
    print(request.app,"cat_idcat_idcat_id",cat_id,category,category_image)
    # sql_q = f"delete from category where uuid = %s"
    # data = request.app.state.db.delete_data(sql_q,(cat_id,))
    # return JSONResponse(status_code=200, content={"status": True, "message":"Category Deleted Successfully","data": data})
    
    
    
    
    
    

@router.post("/brand", status_code=200)
async def brand_creation(request: Request,brand: Inventory.BrandModel):
    
    print("brand called",request,brand)

    
    sql_q = f"INSERT INTO brand (brand_name) VALUES (%s)"
    data = request.app.state.db.save_data(sql_q,(brand.brand_name,))
    
    
    print(data,"category_namecategory_name")
    
    if(data["success"]):
        return JSONResponse(status_code=200, content={"status": True, "message":"Brand created Successfully","data": data})
    
    else:    
        return JSONResponse(status_code=400, content={"status": False, "message":"Something went wrong"})
    


@router.get("/brand", status_code=200)
async def brand_list(request: Request):
    
    
    print(request.app)
    sql_q = f"select brand_name, uuid as id from brand where status = TRUE"
    data = request.app.state.db.get_data_as_json(sql_q,())
    return JSONResponse(status_code=200, content={"status": True, "message":"Brand Fetched Successfully","data": data})
    
    
    

@router.delete("/brand/{brand_id}", status_code=200)
async def brand_delete(request: Request,brand_id):
    
    
    print(request.app,"cat_idcat_idcat_id",brand_id)
    sql_q = f"delete from brand where uuid = %s"
    data = request.app.state.db.delete_data(sql_q,(brand_id,))
    return JSONResponse(status_code=200, content={"status": True, "message":"Brand Deleted Successfully","data": data})
    
    

@router.post("/unit", status_code=200)
async def unit_creation(request: Request,unit: Inventory.UnitModel):
    
    print("unit called",request,unit)


    
    sql_q = f"INSERT INTO unit (unit_name) VALUES (%s)"
    data = request.app.state.db.save_data(sql_q,(unit.unit_name,))
    
    
    print(data,"category_namecategory_name")
    
    if(data["success"]):
        return JSONResponse(status_code=200, content={"status": True, "message":"Unit created Successfully","data": data})
    
    else:    
        return JSONResponse(status_code=400, content={"status": False, "message":"Something went wrong"})
    


@router.get("/unit", status_code=200)
async def unit_list(request: Request):
    
    
    print(request.app)
    sql_q = f"select * from unit where status = TRUE"
    
    sql_q = f"select unit_name, uuid as id from unit where status = TRUE"
    data = request.app.state.db.get_data_as_json(sql_q,())
    return JSONResponse(status_code=200, content={"status": True, "message":"Unit Fetched Successfully","data": data})
    
    
    

@router.delete("/unit/{unit_id}", status_code=200)
async def unit_delete(request: Request,unit_id):
    
    
    print(request.app,"cat_idcat_idcat_id",unit_id)
    sql_q = f"delete from unit where uuid = %s"
    data = request.app.state.db.delete_data(sql_q,(unit_id,))
    return JSONResponse(status_code=200, content={"status": True, "message":"Unit Deleted Successfully","data": data})
    
    
    

@router.post("/store", status_code=200)
async def store_creation(request: Request,store: Inventory.StoreModel):
    
    print("store called",request,store)

    
    sql_q = f"INSERT INTO store(store_name) VALUES (%s)"
    data = request.app.state.db.save_data(sql_q,(store.store_name,))
    
    
    print(data,"category_namecategory_name")
    
    if(data["success"]):
        return JSONResponse(status_code=200, content={"status": True, "message":"Store created Successfully","data": data})
    
    else:    
        return JSONResponse(status_code=400, content={"status": False, "message":"Something went wrong"})
    


@router.get("/store", status_code=200)
async def store_list(request: Request):
    
    
    print(request.app)
    sql_q = f"select uuid as id,store_name from store where status = TRUE"
    data = request.app.state.db.get_data_as_json(sql_q,())
    return JSONResponse(status_code=200, content={"status": True, "message":"Store Fetched Successfully","data": data})
    
    
    

@router.delete("/store/{store_id}", status_code=200)
async def store_delete(request: Request,store_id):
    
    
    print(request.app,"cat_idcat_idcat_id",store_id)
    sql_q = f"delete from store where uuid = %s"
    data = request.app.state.db.delete_data(sql_q,(store_id,))
    return JSONResponse(status_code=200, content={"status": True, "message":"Store Deleted Successfully","data": data})
    
    
    
        
    

@router.post("/warehouse", status_code=200)
async def warehouse_creation(request: Request,warehouse: Inventory.WarehouseModel):
    
    print(" called",request,warehouse)

    
    sql_q = f"INSERT INTO warehouse(warehouse_name) VALUES (%s)"
    data = request.app.state.db.save_data(sql_q,(warehouse.warehouse_name,))
    
    
    print(data,"category_namecategory_name")
    
    if(data["success"]):
        return JSONResponse(status_code=200, content={"status": True, "message":"Warehouse created Successfully","data": data})
    
    else:    
        return JSONResponse(status_code=400, content={"status": False, "message":"Something went wrong"})
    


@router.get("/warehouse", status_code=200)
async def warehouse_list(request: Request):
    
    
    print(request.app)
    sql_q = f"select uuid as id,warehouse_name from warehouse where status = TRUE"
    data = request.app.state.db.get_data_as_json(sql_q,())
    return JSONResponse(status_code=200, content={"status": True, "message":"Warehouse Fetched Successfully","data": data})
    
    
    
    
@router.delete("/warehouse/{warehouse_id}", status_code=200)
async def warehouse_delete(request: Request,warehouse_id):
    
    
    print(request.app,"cat_idcat_idcat_id",warehouse_id)
    sql_q = f"delete from warehouse where uuid = %s"
    data = request.app.state.db.delete_data(sql_q,(warehouse_id,))
    return JSONResponse(status_code=200, content={"status": True, "message":"Warehouse Deleted Successfully","data": data})
    
    



@router.post("/sub_category", status_code=200)
async def sub_category_creation(request: Request,sub_category: Inventory.SubCategoryModel):
    
    print("sub_category called",request,sub_category)

    
    sql_q = f"INSERT INTO sub_category (category_id,sub_category_name) VALUES (%s,%s)"
    data = request.app.state.db.save_data(sql_q,(sub_category.category_id,sub_category.sub_category_name))
    
    
    print(data,"sub_categorysub_category")
    
    if(data["success"]):
        return JSONResponse(status_code=200, content={"status": True, "message":"Subcategory created Successfully","data": data})
    
    else:    
        return JSONResponse(status_code=400, content={"status": False, "message":"Something went wrong"})
    


@router.get("/sub_category", status_code=200)
async def sub_category_list(request: Request):
    
    
    print(request.app)
    sql_q = f"SELECT sub_c.uuid as id,c.uuid as category_id,c.category_name as category_name, sub_c.sub_category_name from public.sub_category as sub_c join public.category as c on c.uuid = sub_c.category_id where sub_c.status = TRUE"
    data = request.app.state.db.get_data_as_json(sql_q,())
    return JSONResponse(status_code=200, content={"status": True, "message":"Subcategory Fetched Successfully","data": data})
    


@router.delete("/sub_category/{sub_category_id}", status_code=200)
async def sub_category_delete(request: Request,sub_category_id):
    
    
    print(request.app,"cat_idcat_idcat_id",sub_category_id)
    sql_q = f"delete from sub_category where uuid = %s"
    data = request.app.state.db.delete_data(sql_q,(sub_category_id,))
    return JSONResponse(status_code=200, content={"status": True, "message":"Sub Category Deleted Successfully","data": data})
    




@router.post("/product_type", status_code=200)
async def product_type(request: Request,product_type: Inventory.ProductTypeModel):
    
    print("sub_category called",request,product_type)

    
    sql_q = f"INSERT INTO product_type(category_id,sub_category_id,product_type_name) VALUES (%s,%s,%s)"
    data = request.app.state.db.save_data(sql_q,(product_type.category_id,product_type.sub_category_id,product_type.product_type_name))
    
    
    print(data,"sub_categorysub_category")
    
    if(data["success"]):
        return JSONResponse(status_code=200, content={"status": True, "message":"Product Type created Successfully","data": data})
    
    else:    
        return JSONResponse(status_code=400, content={"status": False, "message":"Something went wrong"})
    


@router.get("/product_type", status_code=200)
async def product_type(request: Request):
    
    
    print(request.app)
    sql_q = f"""
        SELECT cat_sub_data.category_name,cat_sub_data.sub_category_name,pt.uuid as id,pt.category_id,pt.sub_category_id,pt.product_type_name
        FROM public.product_type AS pt join (
            SELECT  
                c.uuid AS category_id,
                c.category_name AS category_name,
                sub_c.sub_category_name,
                sub_c.uuid AS sub_category_id
            FROM public.sub_category AS sub_c
            JOIN public.category AS c 
                ON c.uuid = sub_c.category_id
        ) AS cat_sub_data
            ON pt.sub_category_id = cat_sub_data.sub_category_id
        where pt.status = TRUE;
    """
    
    
    data = request.app.state.db.get_data_as_json(sql_q,())
    return JSONResponse(status_code=200, content={"status": True, "message":"Product Type Fetched Successfully","data": data})
    
    
    


@router.post("/product", status_code=200)
async def product_creation(request: Request,product: Inventory.ProductModel = Depends(Inventory.ProductModel.as_form),product_image: UploadFile = File(None)):
    
    print("brand called",request,product,product_image)
    
    
    product_image_url = ""
    if(product_image):
        
        print(os.getcwd(),os.path.join("uploads",product_image.filename),"os.getcwd()")
        product_image_url = os.path.join("uploads","product",product_image.filename)
        image_save_path = os.path.join(os.getcwd(),product_image_url)
        
        print(image_save_path,product_image_url)
        with open(image_save_path, "wb") as f:
            print(image_save_path,product_image_url)
            f.write(await product_image.read())
            

    
    sql_q = f"INSERT INTO product(category_id,sub_category_id,product_type_id,brand_id,unit_id,product_name,product_image) VALUES (%s,%s,%s,%s,%s,%s,%s)"
    data = request.app.state.db.save_data(sql_q,(product.category_id,product.sub_category_id,product.product_type_id,product.brand_id,product.unit_id,product.product_name,product_image_url))
    
    
    print(data,"category_namecategory_name")
    
    if(data["success"]):
        return JSONResponse(status_code=200, content={"status": True, "message":"Product created Successfully","data": data})
    
    else:    
        return JSONResponse(status_code=400, content={"status": False, "message":"Something went wrong"})
    


@router.get("/product", status_code=200)
async def product_list(request: Request):
    
    
    print(request.app)
    sql_q = f"""SELECT 
    b.brand_name,
    u.unit_name,
    
pd.uuid as id,
pd.stock_quantity,
pd.category_id,
pd.sub_category_id,
pd.product_type_id,
pd.brand_id,
pd.unit_id,
pd.product_name,
pd.product_image,
    ptd.*
    FROM (
        SELECT 
            c.category_name,
            sub_c.sub_category_name,
            pt.product_type_name,
            pt.uuid as pt_id
        FROM public.product_type AS pt
        JOIN public.sub_category AS sub_c
            ON pt.sub_category_id = sub_c.uuid
        JOIN public.category AS c
            ON c.uuid = sub_c.category_id
    ) AS ptd
    JOIN public.product AS pd 
        ON pd.product_type_id = ptd.pt_id
    JOIN public.brand AS b
        ON b.uuid = pd.brand_id
    JOIN public.unit AS u
        ON u.uuid = pd.unit_id;
    """
    data = request.app.state.db.get_data_as_json(sql_q,())
    return JSONResponse(status_code=200, content={"status": True, "message":"Product Fetched Successfully","data": data})
    
    
    
    
    


@router.get("/product_list", status_code=200)
async def product_list_non_admin(request: Request,
    category: Optional[str] = Query(None, description="Filter by category")):
    
    where_clause = ""
    params = []
    
    print(category,"categorycategorycategorycategory")

    if category:
        where_clause += " WHERE c.category_name = %s"
        params.append(category)

    sql_q = f"""
        SELECT 
            b.brand_name,
            u.unit_name,
            ppr.price::text AS price,
            pd.uuid as id,
            pd.category_id,
            pd.sub_category_id,
            pd.product_type_id,
            pd.brand_id,
            pd.unit_id,
            pd.product_name,
            pd.product_image,
            ptd.*
        FROM (
            SELECT 
                c.category_name,
                sub_c.sub_category_name,
                pt.product_type_name,
                pt.uuid as pt_id
            FROM public.product_type AS pt
            JOIN public.sub_category AS sub_c
                ON pt.sub_category_id = sub_c.uuid
            JOIN public.category AS c
                ON c.uuid = sub_c.category_id
            {where_clause}
        ) AS ptd
        JOIN public.product AS pd 
            ON pd.product_type_id = ptd.pt_id
        JOIN public.brand AS b
            ON b.uuid = pd.brand_id
        JOIN public.unit AS u
            ON u.uuid = pd.unit_id
        LEFT JOIN (
            SELECT DISTINCT ON (product_id)
                product_id,
                price::text
            FROM public.product_prices
            ORDER BY product_id, id DESC
        ) AS ppr
            ON ppr.product_id = pd.uuid;

    """
    
    
    print(sql_q,"sql_qsql_qsql_qsql_qsql_qsql_qsql_q")

    data = request.app.state.db.get_data_as_json(sql_q, tuple(params))
    return JSONResponse(
        status_code=200,
        content={"status": True, "message": "Product Fetched Successfully", "data": data}
    )
    
    
    
    
    


@router.post("/manage_stock", status_code=200)
async def manage_stock_creation(request: Request,ProductStockMovementModel: Inventory.ProductStockMovementModel):
    
    print("manage_stock called",request,ProductStockMovementModel)

    
    
    
    sql_q = f"INSERT INTO product_stock_movements (product_id,movement_type,quantity,note) VALUES (%s,%s,%s,%s)"
    data = request.app.state.db.save_data(sql_q,(ProductStockMovementModel.product_id,ProductStockMovementModel.movement_type,ProductStockMovementModel.quantity,ProductStockMovementModel.note))
    
    
    
    sql_q = {
        "IN":f"""UPDATE product SET stock_quantity = stock_quantity + %s WHERE uuid = %s;""",
        "RETURN_IN":f"""UPDATE product SET stock_quantity = stock_quantity + %s WHERE uuid = %s;""",
        "OUT":f"""UPDATE product SET stock_quantity = stock_quantity - %s WHERE uuid = %s;""",
        "RETURN_OUT":f"""UPDATE product SET stock_quantity = stock_quantity - %s WHERE uuid = %s;""",
        "ADJUSTMENT":f"""UPDATE product SET stock_quantity = %s WHERE uuid = %s;"""
    }
        
    sql_qup = sql_q[ProductStockMovementModel.movement_type]
    data_uppr = request.app.state.db.save_data(sql_qup,(ProductStockMovementModel.quantity,ProductStockMovementModel.product_id))
    print("going to update product quantity",sql_qup,data_uppr)
        
    
    if(data["success"]):
        return JSONResponse(status_code=200, content={"status": True, "message":"Product Stock Movement created Successfully","data": data})
    
    else:    
        return JSONResponse(status_code=400, content={"status": False, "message":"Something went wrong"})
    


@router.get("/manage_stock", status_code=200)
async def manage_stock_list(request: Request):
    
    
    print(request.app)
    sql_q = f"SELECT p.product_name,psm.movement_type,psm.note,psm.product_id,psm.quantity from product_stock_movements as psm JOIN product as p on psm.product_id = p.uuid;"
    data = request.app.state.db.get_data_as_json(sql_q,())
    
    print(data,"datadatadatadatadata")
    return JSONResponse(status_code=200, content={"status": True, "message":"Product Stock Movement Fetched Successfully","data": data})
    
    
    

@router.post("/product_price", status_code=200)
async def product_prices_creation(request: Request,ProductPriceModel: Inventory.ProductPriceModel):
    
    print("unit called",request,ProductPriceModel)

    
    sql_q = f"INSERT INTO product_prices(product_id, price, valid_from, valid_to, customer_type, store_id) VALUES (%s, %s, %s, %s, %s, %s);"
    data = request.app.state.db.save_data(sql_q,(ProductPriceModel.product_id,ProductPriceModel.price,ProductPriceModel.valid_from,ProductPriceModel.valid_to,ProductPriceModel.customer_type,ProductPriceModel.store_id))
    
    
    print(data,"category_namecategory_name")
    
    if(data["success"]):
        return JSONResponse(status_code=200, content={"status": True, "message":"Product Prices created Successfully","data": data})
    
    else:    
        return JSONResponse(status_code=400, content={"status": False, "message":"Something went wrong"})
    


@router.get("/product_price", status_code=200)
async def product_prices_list(request: Request):
    
    
    print(request.app)
    sql_q = f"""SELECT 
        pro.product_name,
        pr.product_id,
        pr.price::text AS price,
        pr.customer_type,
        pr.store_id,
        st.store_name
        FROM product_prices AS pr
        JOIN product AS pro ON pro.uuid = pr.product_id
        JOIN store AS st ON st.uuid = pr.store_id;
    """
    data = request.app.state.db.get_data_as_json(sql_q,())
    return JSONResponse(status_code=200, content={"status": True, "message":"Product Prices Fetched Successfully","data": data})
    
    
    
    
    

# @router.post("/user", status_code=200)
# async def users_list(request: Request,json_data: User.UserModel):

    
#     sql_q = f"INSERT INTO users (name,username,email,mobile_number,password, status) VALUES (%s, %s, %s, %s,%s, True)"
#     data = request.app.state.db.save_data(sql_q,(json_data.name,json_data.username,json_data.email,json_data.mobile_number,json_data.password))
    
#     if(data["success"]):
#         return JSONResponse(status_code=200, content={"status": True, "message":"User created Successfully","data": data})
    
#     else:    
#         return JSONResponse(status_code=400, content={"status": False, "message":"Something went wrong"})
    

# # ================================nwwwwww

# @router.put("/user", status_code=200)
# async def users_list(request: Request,json_data: User.UserModel):

    
#     sql_q = f"INSERT INTO users (name,username,email,mobile_number,password, status) VALUES (%s, %s, %s, %s,%s, True)"
#     data = request.app.state.db.save_data(sql_q,(json_data.name,json_data.username,json_data.email,json_data.mobile_number,json_data.password))
    
#     if(data["success"]):
#         return JSONResponse(status_code=200, content={"status": True, "message":"User created Successfully","data": data})
    
#     else:    
#         return JSONResponse(status_code=400, content={"status": False, "message":"Something went wrong"})
    

    


from base import *

class CartItemModel(BaseModel):
    brand_name: str
    unit_name: str
    price: float
    id: str
    category_id: str
    sub_category_id: str
    product_type_id: str
    brand_id: str
    unit_id: str
    product_name: str
    product_image: str
    category_name: str
    sub_category_name: str
    product_type_name: str
    pt_id: str
    qty: int
    totalPrice: float


class OrderModel(BaseModel):
    subcustomerId: str
    deliveryName: str
    mobile: str
    email: EmailStr
    pincode: str
    address: str
    district: str
    state: str
    country: str
    note: str = ""
    deliveryMode: str = ""
    orderType: str = ""
    igst: float
    cgst: float
    subtotal: float
    total: float
    cartList: List[CartItemModel]
    
    
    
    

class CategoryModel(BaseModel):
    category_name: str
    
    @classmethod
    def as_form(
        cls,
        category_name: str = Form(...)
    ):
        return cls(
            category_name=category_name 
        )
        
        
class BannerModel(BaseModel):
    banner_name: str
    
    @classmethod
    def as_form(
        cls,
        category_name: str = Form(...)
    ):
        return cls(
            category_name=category_name 
        )

class BrandModel(BaseModel):
    brand_name: str
    
    @classmethod
    def as_form(
        cls,
        brand_name: str = Form(...)
    ):
        return cls(
            brand_name=brand_name 
        )
    


class UnitModel(BaseModel):
    unit_name: str
    
    @classmethod
    def as_form(
        cls,
        unit_name: str = Form(...)
    ):
        return cls(
            unit_name=unit_name 
        )
    
    
    
    

class WarehouseModel(BaseModel):
    warehouse_name: str
    
    @classmethod
    def as_form(
        cls,
        warehouse_name: str = Form(...)
    ):
        return cls(
            warehouse_name=warehouse_name 
        )
    



class StoreModel(BaseModel):
    store_name: str
    
    @classmethod
    def as_form(
        cls,
        store_name: str = Form(...)
    ):
        return cls(
            store_name=store_name 
        )
    



class SubCategoryModel(BaseModel):
    
    category_id: str
    sub_category_name: str

    @classmethod
    def as_form(
        cls,
        category_id: str = Form(...),
        sub_category_name: str = Form(...)
        
    ):
        return cls(
            category_id=category_id,
            sub_category_name=sub_category_name
            
        )
    
    
    
class ProductTypeModel(BaseModel):
    
    category_id: str
    sub_category_id: str
    product_type_name: str

    @classmethod
    def as_form(
        cls,
        category_id: str = Form(...),
        sub_category_id: str = Form(...),
        product_type_name: str = Form(...),
        
    ):
        return cls(
            category_id=category_id,
            sub_category_id=sub_category_id,
            product_type__name=product_type_name,
            
        )
    
  
  
class ProductModel(BaseModel):
    category_id: str
    sub_category_id: str
    product_type_id: str
    brand_id: str
    unit_id:str
    product_name: str
    product_price:float

    @classmethod
    def as_form(
        cls,
        category_id: str = Form(...),
        sub_category_id: str = Form(...),
        product_type_id: str = Form(...),
        brand_id: str = Form(...),
        unit_id: str = Form(...),
        product_name: str = Form(...),
        product_price: float = Form(...),
        
    ):
        return cls(
            category_id=category_id,
            sub_category_id=sub_category_id,
            product_type_id=product_type_id,
            brand_id=brand_id,
            unit_id=unit_id,
            product_name=product_name,
            product_price=product_price
            
        )

# class ProductModel(BaseModel):
#     category_id: str
#     sub_category_id: str
#     product_type_id: str
#     brand_id: str
#     product_name: str
    

class ProductStockMovementModel(BaseModel):
    product_id: str
    quantity: int
    movement_type: str
    note: Optional[str] = None

    @classmethod
    def as_form(
        cls,
        product_id: str = Form(...),
        quantity: int = Form(...),
        movement_type: str = Form(...),
        note: Optional[str] = Form(None)
    ):
        return cls(
            product_id=product_id,
            quantity=quantity,
            movement_type=movement_type,
            note=note
        )


class ProductPriceModel(BaseModel):
    product_id: str
    price: float
    valid_from: Optional[datetime] = None
    valid_to: Optional[datetime] = None
    customer_type: Optional[str] = None
    store_id: Optional[str] = None

    @classmethod
    def as_form(
        cls,
        product_id: str = Form(...),
        price: float = Form(...),
        valid_from: Optional[datetime] = Form(None),
        valid_to: Optional[datetime] = Form(None),
        customer_type: Optional[str] = Form(None),
        store_id: Optional[str] = Form(None)
    ):
        return cls(
            product_id=product_id,
            price=price,
            valid_from=valid_from,
            valid_to=valid_to,
            customer_type=customer_type,
            store_id=store_id
        )
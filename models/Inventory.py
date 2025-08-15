from base import *


class CategoryModel(BaseModel):
    category_name: str


class SubCategoryModel(BaseModel):
    category_id: str
    sub_category_name: str
    
    
    
class ProductTypeModel(BaseModel):
    category_id: str
    sub_category_id: str
    product_type_name: str
    



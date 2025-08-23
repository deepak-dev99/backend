from base import *



class CustomerModel(BaseModel):
    name: str
    email: Optional[EmailStr] = None
    phone: Optional[str] = None
    address: Optional[str] = None
    city: Optional[str] = None
    state: Optional[str] = None
    country: Optional[str] = None
    zip_code: Optional[str] = None
    customer_type: Optional[str] = None  # e.g., 'Individual' or 'Business'
    status: Optional[bool] = True

    @classmethod
    def as_form(
        cls,
        name: str = Form(...),
        email: Optional[EmailStr] = Form(None),
        phone: Optional[str] = Form(None),
        address: Optional[str] = Form(None),
        city: Optional[str] = Form(None),
        state: Optional[str] = Form(None),
        country: Optional[str] = Form(None),
        zip_code: Optional[str] = Form(None),
        customer_type: Optional[str] = Form(None),
        status: Optional[bool] = Form(True),
    ):
        return cls(
            name=name,
            email=email,
            phone=phone,
            address=address,
            city=city,
            state=state,
            country=country,
            zip_code=zip_code,
            customer_type=customer_type,
            status=status,
        )



class SubCustomerModel(BaseModel):
    customer_id: int
    name: str
    email: Optional[EmailStr] = None
    phone: Optional[str] = None
    address: Optional[str] = None
    city: Optional[str] = None
    state: Optional[str] = None
    country: Optional[str] = None
    zip_code: Optional[str] = None
    status: Optional[bool] = True

    @classmethod
    def as_form(
        cls,
        customer_id: int = Form(...),
        name: str = Form(...),
        email: Optional[EmailStr] = Form(None),
        phone: Optional[str] = Form(None),
        address: Optional[str] = Form(None),
        city: Optional[str] = Form(None),
        state: Optional[str] = Form(None),
        country: Optional[str] = Form(None),
        zip_code: Optional[str] = Form(None),
        status: Optional[bool] = Form(True),
    ):
        return cls(
            customer_id=customer_id,
            name=name,
            email=email,
            phone=phone,
            address=address,
            city=city,
            state=state,
            country=country,
            zip_code=zip_code,
            status=status,
        )

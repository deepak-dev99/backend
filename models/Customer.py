from base import *



class CustomerModel(BaseModel):
    name: str
    email: Optional[EmailStr] = None
    phone: Optional[str] = None
    company_name: Optional[str] = None
    gst: Optional[str] = None
    pan: Optional[str] = None
    country: Optional[str] = None
    state: Optional[str] = None
    city: Optional[str] = None
    password: Optional[str] = None
    address: Optional[str] = None
    zip_code: Optional[str] = None
    customer_type: Optional[str] = None  # e.g., 'Individual' or 'Business'
    description: Optional[str] = None  # e.g., 'Individual' or 'Business'
    status: Optional[bool] = True

    @classmethod
    def as_form(
        cls,
        name: str = Form(...),
        email: Optional[EmailStr] = Form(None),
        phone: Optional[str] = Form(None),
        company_name: Optional[str] = Form(None),
        pan: Optional[str] = Form(None),
        gst: Optional[str] = Form(None),
        address: Optional[str] = Form(None),
        city: Optional[str] = Form(None),
        state: Optional[str] = Form(None),
        country: Optional[str] = Form(None),
        password: Optional[str] = Form(None),
        zip_code: Optional[str] = Form(None),
        customer_type: Optional[str] = Form(None),
        status: Optional[bool] = Form(True),
        description: Optional[str] = Form(None),
    ):
        return cls(
            name=name,
            email=email,
            phone=phone,
            address=address,
            gst=gst,
            pan=pan,
            company_name=company_name,
            password=password,
            city=city,
            state=state,
            country=country,
            zip_code=zip_code,
            customer_type=customer_type,
            status=status,
            description=description
        )



class SubCustomerModel(BaseModel):
    customer_id: str
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
        customer_id: str = Form(...),
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

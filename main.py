from base import *

load_dotenv()


cdso = cso.CommonDB()

app = FastAPI()
auth_app = FastAPI()


app.state.db = cso.CommonDB()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.route("/home")

def home():
    print("home called")
    
    
    return "fasfsadsa"



 
# app.add_middleware(ccm.CustomAuthTokenMiddleware)

auth_dependency = Depends(ccm.verify_token)


app.include_router(inventory.router, prefix="/api/inventory", tags=["Inventory"],dependencies=[auth_dependency])   
app.include_router(statistics.router, prefix="/api/statistics", tags=["statistics"],dependencies=[auth_dependency])
app.include_router(common.router, prefix="/common", tags=["common"])   
app.include_router(customer.router, prefix="/api/customer", tags=["customer"],dependencies=[auth_dependency])
app.include_router(busy_board.router, prefix="/api/busyboard", tags=["busyboard"],dependencies=[auth_dependency])


app.include_router(auth.router, prefix="/api/auth", tags=["User"])

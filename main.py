from base import *

load_dotenv()


cdso = cso.CommonDB()

app = FastAPI()


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




app.include_router(auth.router, prefix="/api/auth", tags=["User"])   
app.include_router(inventory.router, prefix="/api/inventory", tags=["Inventory"])   

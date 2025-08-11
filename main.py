from base import *

load_dotenv()


cdso = cso.CommonDB()

app = FastAPI()


app.state.db = cso.CommonDB()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # or ["http://localhost:3000"] etc.
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.route("/home")

def home():
    print("home called")
    
    
    return "fasfsadsa"




app.include_router(auth.router, prefix="/api", tags=["User"])   

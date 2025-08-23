from base import * 
from models import Inventory



router = APIRouter()



@router.get("/category", status_code=200)
async def category_list(request: Request):
    
    
    print(request.app)
    sql_q = f"select * from category where status = TRUE"
    data = request.app.state.db.get_data_as_json(sql_q,())
    return JSONResponse(status_code=200, content={"status": True, "message":"Category Fetched Successfully","data": data})
    
    
    
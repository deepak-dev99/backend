from base import * 



router = APIRouter()


@router.get("/uploads/{foldername}/{filename}", status_code=200)
async def get_upload(request: Request, foldername: str, filename: str):
    file_path = os.path.join(foldername, filename)
    
    file_full_path = os.path.join(os.getcwd(),"uploads",file_path)
    
    print(file_full_path,"file_full_path")
    if not os.path.exists(file_full_path):
        return {"error": "File not found"}
    return FileResponse(file_full_path)
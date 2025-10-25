from base import * 
from models import Inventory



router = APIRouter()





@router.get("/Admin_Dashboard_Cards", status_code=200)
async def Admin_Dashboard_Cards(request: Request):
    
    print("Start Admin_Dashboard_Cards .....................")
    start = "2022-04-10"
    end = "2026-04-10"
    
    btw_start_end = f"AND CAST(DueDate AS DATE) BETWEEN '{start}' AND '{end}'"
    # btw_start_end = f""
    query_total = f"""WITH finalData AS (
    SELECT 
        RefCode,
        SUM(Value1) AS PendingQty,
        SUM(CASE WHEN Value1 > 0 THEN Value1 ELSE 0 END) AS TotalQty,
        (SUM(CASE WHEN Value1 > 0 THEN Value1 ELSE 0 END) - SUM(Value1)) AS ClearedQty,
        SUM(NewRefAmount) AS PendingAmount,
        SUM(CASE WHEN Value1 > 0 THEN NewRefAmount ELSE 0 END) AS TotalAmount,
        (SUM(CASE WHEN Value1 > 0 THEN NewRefAmount ELSE 0 END) - SUM(NewRefAmount)) AS ClearedAmount,
        MIN(CAST([Date] AS DATE)) AS Date,
        MAX(No) AS VoucherNo,
        MIN(Balance1) AS Balance1,
        COUNT(*) AS LinesCount
    FROM Tran3
    WHERE VchType IN (12, 9)
    {btw_start_end}
    GROUP BY RefCode
    HAVING SUM(CASE WHEN Value1 > 0 THEN Value1 ELSE 0 END) > 0
)

SELECT 
    SUM(PendingQty) AS TotalPendingQty,
    SUM(TotalQty) AS TotalTotalQty,
    SUM(ClearedQty) AS TotalClearedQty,
    SUM(PendingAmount) AS TotalPendingAmount,
    SUM(TotalAmount) AS TotalTotalAmount,
    SUM(ClearedAmount) AS TotalClearedAmount,
    SUM(LinesCount) AS TotalLinesCount
FROM finalData;
"""



    print("Start Admin_Dashboard_Cards ..................... 54 ")

    query_product = """SELECT * FROM Master1 where MasterType=6;""" 
    query_invoice = """select 
    T3.*,
    T2.*,
    M1.* 
    from Tran3 AS T3 
    JOIN 
    Master1 AS M1 
        On T3.MasterCode1 = M1.Code
    JOIN Tran2 AS T2 
        ON T2.VchCode = T3.VchCode 
    where T3.VchType = 14 ORDER BY DueDate"""
 
    
    print("Start Admin_Dashboard_Cards ..................... 69")
    
    
    query_customer = f"select uuid as id,name,email,phone,address,city,state,country,zip_code,pan,gst,customer_type,company_name,description,password,status,customer_image from customers where status = TRUE"
    get_customer_data = request.app.state.db.get_data_as_json(query_customer,())

    print(query_total)
    
    
    print("Start Admin_Dashboard_Cards ..................... 79")
    
    
    start_v1 = datetime.now()
    
    get_data = run_query(query_total)
    
    start_v2 = datetime.now()
    print(start_v2 - start_v1)
    get_data_invoice = run_query(query_invoice)
    start_v3 = datetime.now()
    print(start_v3 - start_v1)
    get_data_products = run_query(query_product)
    
    start_v4 = datetime.now()
    
    
    print(start_v4 - start_v1)
    
    if(len(get_data) > 0):
        get_data = get_data[0]
        
        
    
        
    final_data = {
        **get_data,
        "TotalCustomer":len(get_customer_data),
        "TotalInvoice":len(get_data_invoice),
        "TotalProducts":len(get_data_products),
    }
    
    """
      AND CAST(DueDate AS DATE) BETWEEN '2022-04-10' AND '2022-04-20'
      """
      
      
    print(get_customer_data,"get_customer_dataget_customer_data")
      
    return JSONResponse(status_code=200, content={"status": True, "message":"Admin Dashboard Successfully","data": final_data})
    
    
    
    




@router.get("/Customer_Dashboard_Cards", status_code=200)
async def Customer_Dashboard_Cards(request: Request):
    
    print(request.state.user_details)
    print("Start Customer_Dashboard_Cards .....................")
    start = "2022-04-10"
    end = "2026-04-10"
    
    btw_start_end = f"AND CAST(DueDate AS DATE) BETWEEN '{start}' AND '{end}'"
    # btw_start_end = f""
    query_total = f"""WITH finalData AS (
    SELECT 
        RefCode,
        SUM(Value1) AS PendingQty,
        SUM(CASE WHEN Value1 > 0 THEN Value1 ELSE 0 END) AS TotalQty,
        (SUM(CASE WHEN Value1 > 0 THEN Value1 ELSE 0 END) - SUM(Value1)) AS ClearedQty,
        SUM(NewRefAmount) AS PendingAmount,
        SUM(CASE WHEN Value1 > 0 THEN NewRefAmount ELSE 0 END) AS TotalAmount,
        (SUM(CASE WHEN Value1 > 0 THEN NewRefAmount ELSE 0 END) - SUM(NewRefAmount)) AS ClearedAmount,
        MIN(CAST([Date] AS DATE)) AS Date,
        MAX(No) AS VoucherNo,
        MIN(Balance1) AS Balance1,
        COUNT(*) AS LinesCount
    FROM Tran3
    WHERE VchType IN (12, 9)
    {btw_start_end}
    GROUP BY RefCode
    HAVING SUM(CASE WHEN Value1 > 0 THEN Value1 ELSE 0 END) > 0
)

SELECT 
    SUM(PendingQty) AS TotalPendingQty,
    SUM(TotalQty) AS TotalTotalQty,
    SUM(ClearedQty) AS TotalClearedQty,
    SUM(PendingAmount) AS TotalPendingAmount,
    SUM(TotalAmount) AS TotalTotalAmount,
    SUM(ClearedAmount) AS TotalClearedAmount,
    SUM(LinesCount) AS TotalLinesCount
FROM finalData;
"""



    print("Start Admin_Dashboard_Cards ..................... 54 ")

    query_product = """SELECT * FROM Master1 where MasterType=6;""" 
    query_invoice = """select 
    T3.*,
    T2.*,
    M1.* 
    from Tran3 AS T3 
    JOIN 
    Master1 AS M1 
        On T3.MasterCode1 = M1.Code
    JOIN Tran2 AS T2 
        ON T2.VchCode = T3.VchCode 
    where T3.VchType = 14 ORDER BY DueDate"""
 
    
    print("Start Admin_Dashboard_Cards ..................... 69")
    
    
    query_customer = f"select uuid as id,name,email,phone,address,city,state,country,zip_code,pan,gst,customer_type,company_name,description,password,status,customer_image from customers where status = TRUE"
    get_customer_data = request.app.state.db.get_data_as_json(query_customer,())

    print(query_total)
    
    
    print("Start Admin_Dashboard_Cards ..................... 79")
    
    
    start_v1 = datetime.now()
    
    get_data = run_query(query_total)
    
    start_v2 = datetime.now()
    print(start_v2 - start_v1)
    get_data_invoice = run_query(query_invoice)
    start_v3 = datetime.now()
    print(start_v3 - start_v1)
    get_data_products = run_query(query_product)
    
    start_v4 = datetime.now()
    
    
    print(start_v4 - start_v1)
    
    if(len(get_data) > 0):
        get_data = get_data[0]
        
        
    
        
    final_data = {
        **get_data,
        "TotalCustomer":len(get_customer_data),
        "TotalInvoice":len(get_data_invoice),
        "TotalProducts":len(get_data_products),
    }
    
    """
      AND CAST(DueDate AS DATE) BETWEEN '2022-04-10' AND '2022-04-20'
      """
      
      
    print(get_customer_data,"get_customer_dataget_customer_data")
      
    return JSONResponse(status_code=200, content={"status": True, "message":"Admin Dashboard Successfully","data": final_data})
    
    
@router.get("/category", status_code=200)
async def category_list(request: Request):
    
    
    return run_query("""SELECT
    B.PartyName,
    T3.No,
    T3.Value1,
    T3.Value3,
    T3.Balance1,
    T3.NewRefAmount,
    T3.Value2,
    T3.VchType,
    CAST(T3.Date AS DATE) AS OrderDate,
    COUNT(*) OVER(PARTITION BY CAST(T3.Date AS DATE)) AS RowsInDateGroup
FROM (SELECT DISTINCT * FROM BillingDet) AS B
LEFT JOIN Tran3 AS T3
    ON B.VchCode = T3.VchCode
WHERE RefCode IS NOT NULL AND VchType = 12
ORDER BY CAST(T3.Date AS DATE), B.VchCode;""")
    
    
    
    
    
    
    
    
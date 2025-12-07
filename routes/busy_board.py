from base import * 
from models import Inventory



router = APIRouter()





@router.get("/user_dashboard_cn_cnr", status_code=200)
async def user_dashboard_cn_cnr(request: Request):
    
    
    print(request.state.PartyName,"PartyNamePartyNamePartyNamePartyName")
    # CN_Sql = "SELECT VchNo from Tran1 WHERE VchType = 18;"
    CN_Sql = f"SELECT * from Tran1 t1 LEFT JOIN Master1 m1 on m1.Code = t1.MasterCode1 WHERE m1.Name = '{request.state.PartyName}' AND VchType = 18;"
    

    cn_output = run_query(CN_Sql)


    CNR_Sql = f"SELECT * from Tran1 t1 LEFT JOIN Master1 m1 on m1.Code = t1.MasterCode1 WHERE m1.Name = '{request.state.PartyName}' AND VchType = 3;"


    cnr_output = run_query(CNR_Sql)
    
    
    final_data = {
        "cn_output_count":len(cn_output),
        "cnr_output_count":len(cnr_output),
        "cn_output":cn_output,
        "cnr_output":cnr_output
    }
    
    
    # print(final_data,"cnr_outputcnr_outputcnr_output")
    return JSONResponse(status_code=200, content={"status": True, "message":"user_dashboard_cn_cnr Dashboard Successfully","data": final_data})
    
    

@router.get("/user_dashboard_invoice_and_ledger", status_code=200)
async def user_dashboard_invoice_and_ledger(request: Request):
    
    
    print(request.state.PartyName,"PartyNamePartyNamePartyNamePartyName")
    # CN_Sql = "SELECT VchNo from Tran1 WHERE VchType = 18;"
    
    invoice_Sql = f"""
    
SELECT ABS(t2.Value1)  AS Quantity, ABS(t2.Value3) AS Amount, t2.VchNo, t2.Date, m1.Name AS PartyName, t2.D2 AS Price,m2.Name AS Item,m3.Name AS Unit
FROM Tran2 t2
LEFT JOIN Tran1 t1 
    ON t2.VchCode = t1.VchCode
LEFT JOIN Master1 m1 
    ON m1.Code = t1.MasterCode1
LEFT JOIN Master1 m2
    ON m2.Code = t2.MasterCode1
LEFT JOIN Master1 m3
    ON m3.Code = t2.CM2
WHERE 
    t1.VchType = 9
    AND t2.RecType = 2
    AND t1.Cancelled = 0
    AND m1.Name LIKE {request.state.PartyName}
ORDER BY 
    t1.VchNo;
    """
    

    invoice_output = run_query(invoice_Sql)


    ledger_Sql = f"SELECT * from Tran1 t1 LEFT JOIN Master1 m1 on m1.Code = t1.MasterCode1 WHERE m1.Name = '{request.state.PartyName}' AND VchType = 3;"


    ledger_output = run_query(ledger_Sql)
    
    
    final_data = {
        "invoice_output_count":len(invoice_output),
        "invoice_output":invoice_output,
        "ledger_output_count":len(ledger_output),
        "ledger_output":ledger_output
    }
    
    
    # print(final_data,"cnr_outputcnr_outputcnr_output")
    return JSONResponse(status_code=200, content={"status": True, "message":"user_dashboard_cn_cnr Dashboard Successfully","data": final_data})
    
    
    


@router.get("/user_dashboard_invoice", status_code=200)
async def user_dashboard_invoice(request: Request):
    
    
    print(request.state.PartyName,"PartyNamePartyNamePartyNamePartyName")
    # CN_Sql = "SELECT VchNo from Tran1 WHERE VchType = 18;"
    
    invoice_Sql = f"""
    
SELECT ABS(t2.Value1)  AS Quantity, ABS(t2.Value3) AS Amount, t2.VchNo, t2.Date, m1.Name AS PartyName, t2.D2 AS Price,m2.Name AS Item,m3.Name AS Unit
FROM Tran2 t2
LEFT JOIN Tran1 t1 
    ON t2.VchCode = t1.VchCode
LEFT JOIN Master1 m1 
    ON m1.Code = t1.MasterCode1
LEFT JOIN Master1 m2
    ON m2.Code = t2.MasterCode1
LEFT JOIN Master1 m3
    ON m3.Code = t2.CM2
WHERE 
    t1.VchType = 9
    AND t2.RecType = 2
    AND t1.Cancelled = 0
    AND m1.Name LIKE {request.state.PartyName}
ORDER BY 
    t1.VchNo;
    """
    

    invoice_output = run_query(invoice_Sql)


    
    final_data = {
        "invoice_output_count":len(invoice_output),
        "invoice_output":invoice_output
    }
    
    
    # print(final_data,"cnr_outputcnr_outputcnr_output")
    return JSONResponse(status_code=200, content={"status": True, "message":"user_dashboard_cn_cnr Dashboard Successfully","data": final_data})
    
    
    
    

@router.get("/user_dashboard_ledger", status_code=200)
async def user_dashboard_ledger(request: Request):
    
    
    print(request.state.PartyName,"PartyNamePartyNamePartyNamePartyName")
    # CN_Sql = "SELECT VchNo from Tran1 WHERE VchType = 18;"


    ledger_Sql = f"""
        SELECT 
            m1.Name AS PartyName,
            m2.Name,
            t1.VchNo,
            t1.VchAmtBaseCur,
            t2.ShortNar
        FROM Tran2 t2
        LEFT JOIN Tran1 t1 
            ON t2.VchCode = t1.VchCode
        LEFT JOIN Master1 m1 
            ON m1.Code = t1.MasterCode1 
        LEFT JOIN Master1 m2 
            ON m2.Code = t2.MasterCode1 
        WHERE 
            COALESCE(m1.Name, m2.Name) LIKE '{request.state.PartyName}'
            AND t2.VchType IN (9,14) ORDER BY t2.VchCode;

        """


    ledger_output = run_query(ledger_Sql)
    
    
    final_data = {
        "ledger_output_count":len(ledger_output),
        "ledger_output":ledger_output
    }
    
    
    # print(final_data,"cnr_outputcnr_outputcnr_output")
    return JSONResponse(status_code=200, content={"status": True, "message":"user_dashboard_cn_cnr Dashboard Successfully","data": final_data})
    
    
    
    


@router.get("/order_booking_records", status_code=200)
async def order_booking_records(request: Request):
    
    
    print(request.state.PartyName,"PartyNamePartyNamePartyNamePartyName")
    
    order_booking_records_Sql = f"""

SELECT 
        t1.VchCode,
        t1.VchNo AS ParentVchNo,
        t2.VchNo AS ChildVchNo,
        m1.Name AS CM1Name,
        m2.Name AS MasterName,
        (SUM(t2.Value1) - SUM(t3sum.TotalValue1)) AS Cleared,
        SUM(t2.Value1) AS Ordered,
        SUM(t2.Value3) AS OrderedA,
        SUM(t3sum.TotalValue1) AS Pending,
        SUM(t3sum.TotalNewRefAmount) AS NewRefAmount,
        SUM(t3sum.TotalValue3) AS PendingA
FROM Tran2 t2
LEFT JOIN Tran1 t1 ON t1.VchCode = t2.VchCode
LEFT JOIN Master1 m1 ON t2.CM1 = m1.Code
LEFT JOIN Master1 m2 ON t2.MasterCode1 = m2.Code
LEFT JOIN (
        SELECT 
            MasterCode1,
            No,
            SUM(Value1) AS TotalValue1,
            SUM(NewRefAmount) AS TotalNewRefAmount,
            CASE 
                WHEN SUM(Value1) <> 0 THEN SUM(Value3)
                ELSE 0
            END AS TotalValue3

        FROM Tran3
        GROUP BY MasterCode1, No
) t3sum 
    ON t2.MasterCode1 = t3sum.MasterCode1 
   AND t2.VchNo = t3sum.No
WHERE 
    t2.RecType = 4
    AND t2.VchType = 12
    AND m1.Name LIKE '{request.state.PartyName}'
GROUP BY 
    t1.VchNo,
    t1.VchCode,
    t2.VchNo,
    m1.Name,
    m2.Name
ORDER BY 
    t1.VchNo;"""
    
    
    
    
    order_booking_records_output = run_query(order_booking_records_Sql)
    
    
    
    final_data = {
        "order_booking_records_count":len(order_booking_records_output),
        "order_booking_records_output":order_booking_records_output
    }
    
    
    # print(final_data,"cnr_outputcnr_outputcnr_output")
    return JSONResponse(status_code=200, content={"status": True, "message":"order_booking_records_output Dashboard Successfully","data": final_data})
    
    
    
    

@router.get("/pending_records", status_code=200)
async def pending_records(request: Request):
    
    
    print(request.state.PartyName,"PartyNamePartyNamePartyNamePartyName")
    # CN_Sql = "SELECT VchNo from Tran1 WHERE VchType = 18;"
    
    pending_records_Sql = f"""SELECT 
        t1.VchCode,
        t1.VchNo AS ParentVchNo,
        t2.VchNo AS ChildVchNo,
        m1.Name AS CM1Name,
        m2.Name AS MasterName,
        (SUM(t2.Value1) - SUM(t3sum.TotalValue1)) AS Cleared,
        SUM(t2.Value1) AS Ordered,
        SUM(t3sum.TotalValue1) AS Pending,
        SUM(t3sum.TotalValue3) AS PendingA
FROM Tran1 t1
JOIN Tran2 t2 ON t1.VchCode = t2.VchCode
LEFT JOIN Master1 m1 ON t2.CM1 = m1.Code
LEFT JOIN Master1 m2 ON t2.MasterCode1 = m2.Code
LEFT JOIN (
        SELECT 
            MasterCode1,
            SUM(Value1) AS TotalValue1,
            SUM(Value3) AS TotalValue3,
            No
        FROM Tran3
        GROUP BY MasterCode1, No
) t3sum 
    ON t2.MasterCode1 = t3sum.MasterCode1 
   AND t2.VchNo = t3sum.No
WHERE 
    t2.RecType = 4
    AND t2.VchType = 12
    AND m1.Name LIKE '{request.state.PartyName}'
GROUP BY 
    t1.VchNo,
    t1.VchCode,
    t2.VchNo,
    m1.Name,
    m2.Name
HAVING 
    SUM(t3sum.TotalValue1) <> 0
ORDER BY 
    t1.VchNo;"""
    

    pending_records_output = run_query(pending_records_Sql)


    ledger_Sql = f"SELECT * from Tran1 t1 LEFT JOIN Master1 m1 on m1.Code = t1.MasterCode1 WHERE m1.Name = '{request.state.PartyName}' AND VchType = 3;"


    ledger_output = run_query(ledger_Sql)
    
    
    final_data = {
        "pending_records_count":len(pending_records_output),
        "pending_records_output":pending_records_output
    }
    
    
    # print(final_data,"cnr_outputcnr_outputcnr_output")
    return JSONResponse(status_code=200, content={"status": True, "message":"user_dashboard_cn_cnr Dashboard Successfully","data": final_data})
    
    
    
    

    
@router.get("/admin_dashboard_cn_cnr", status_code=200)
async def admin_dashboard_cn_cnr(request: Request):
    
    
    print(request.state.PartyName,"PartyNamePartyNamePartyNamePartyName")
    # CN_Sql = "SELECT VchNo from Tran1 WHERE VchType = 18;"
    CN_Sql = f"SELECT * from Tran1 t1 LEFT JOIN Master1 m1 on m1.Code = t1.MasterCode1 WHERE VchType = 18;"
    

    cn_output = run_query(CN_Sql)


    CNR_Sql = f"SELECT * from Tran1 t1 LEFT JOIN Master1 m1 on m1.Code = t1.MasterCode1 WHERE VchType = 3;"


    cnr_output = run_query(CNR_Sql)
    
    
    final_data = {
        "cn_output_count":len(cn_output),
        "cnr_output_count":len(cnr_output),
        "cn_output":cn_output,
        "cnr_output":cnr_output
    }
    
    
    # print(final_data,"cnr_outputcnr_outputcnr_output")
    return JSONResponse(status_code=200, content={"status": True, "message":"user_dashboard_cn_cnr Dashboard Successfully","data": final_data})
    


@router.get("/Admin_Dashboard_Cards", status_code=200)
async def Admin_Dashboard_Cards(request: Request):
    
    
    
    print("Start Admin_Dashboard_Cards .....................")
    start = "2022-04-10"
    end = "2026-04-10"
    
    # btw_start_end = f"AND CAST(DueDate AS DATE) BETWEEN '{start}' AND '{end}'"
    btw_start_end = f""
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

    query_product = """SELECT Count(*) FROM Master1 where MasterType=6;""" 
    # query_invoice = """select 
    # T3.*,
    # T2.*,
    # M1.* 
    # from Tran3 AS T3 
    # JOIN 
    # Master1 AS M1 
    #     On T3.MasterCode1 = M1.Code
    # JOIN Tran2 AS T2 
    #     ON T2.VchCode = T3.VchCode 
    # where T3.VchType = 14 ORDER BY DueDate"""
    query_invoice = """SELECT * from Tran1 WHERE "VchType" = 9  AND Cancelled = 0;"""
 
    
    print("Start Admin_Dashboard_Cards ..................... 69")
    
    
    query_customer = f"select uuid as id,name,email,phone,address,city,state,country,zip_code,pan,gst,customer_type,company_name,description,password,status,customer_image from customers where status = TRUE"
    get_customer_data = request.app.state.db.get_data_as_json(query_customer,())

    # print(query_total)
    
    
    print("Start Admin_Dashboard_Cards ..................... 79")
    
    
    start_v1 = datetime.now()
    
    # get_data = run_query(query_total)
    
    start_v2 = datetime.now()
    print(start_v2 - start_v1,"dsadasdasdasdasdasd")
    get_data_invoice = run_query(query_invoice)
    start_v3 = datetime.now()
    print(start_v3 - start_v1)
    get_data_products = run_query(query_product)
    
    start_v4 = datetime.now()
    
    
    print(start_v4 - start_v1)
    
    # if(len(get_data) > 0):
    #     get_data = get_data[0]
        
        
    CN_Sql = f"SELECT * from Tran1 t1 LEFT JOIN Master1 m1 on m1.Code = t1.MasterCode1 WHERE VchType = 18;"
    cn_output = run_query(CN_Sql)
    CNR_Sql = f"SELECT * from Tran1 t1 LEFT JOIN Master1 m1 on m1.Code = t1.MasterCode1 WHERE VchType = 3;"
    cnr_output = run_query(CNR_Sql)
    order_Sql = f"SELECT * from Tran1 t1 LEFT JOIN Master1 m1 on m1.Code = t1.MasterCode1 WHERE VchType = 12;"
    order_output = run_query(order_Sql)
        
    order_Sql = f"SELECT * from Tran1 t1 LEFT JOIN Master1 m1 on m1.Code = t1.MasterCode1 WHERE VchType = 12;"
    order_output = run_query(order_Sql)
    
    
    order_amount_Sql = f"""SELECT SUM(Value3) AS TotalOrderAmount,SUM(Value1) AS TotalOrderQuantity
        FROM Tran2 t1
        WHERE t1.VchType IN (12)
        AND t1.RecType IN (4);"""
    order_amount_output = run_query(order_amount_Sql)
    
    
    
    order_amount_Sql = f"""

WITH T1 AS (
    SELECT
        SUM(CASE WHEN VchType = 9  AND Cancelled = 0 THEN 1 ELSE 0 END) AS c1,
        SUM(CASE WHEN VchType = 18 THEN 1 ELSE 0 END) AS c2,
        SUM(CASE WHEN VchType = 3  THEN 1 ELSE 0 END) AS c3,
        SUM(CASE WHEN VchType = 12 THEN 1 ELSE 0 END) AS c4
    FROM Tran1
),
T2 AS (
    SELECT
        SUM(CASE WHEN VchType = 12 AND RecType = 4 THEN Value3 ELSE 0 END) AS TotalOrderAmount,
        SUM(CASE WHEN VchType = 12 AND RecType = 4 THEN Value1 ELSE 0 END) AS TotalOrderQuantity,
        ABS(SUM(CASE WHEN VchType IN (3,9) AND RecType IN (2,7) THEN Value3 ELSE 0 END)) AS TotalClearedAmount,
        SUM(CASE WHEN VchType IN (3,9) AND RecType IN (2,7) THEN Value1 ELSE 0 END) AS TotalClearedQuantity
    FROM Tran2
),
T3 AS (
    SELECT COUNT(*) AS c5 FROM Master1 WHERE MasterType = 6
),
T4 AS (
    SELECT COUNT(*) AS c6 FROM customers WHERE status = TRUE
)

SELECT *
FROM T1, T2, T3, T4;"""
    
    
    
    
    if(len(order_amount_output) > 0):
        order_amount_output = order_amount_output[0]
        
        
        
    cleared_amount_Sql = f"""SELECT ABS(SUM(Value3)) AS TotalClearedAmount,SUM(Value1) AS TotalClearedQuantity
        FROM Tran2 t1
        WHERE t1.VchType IN (3,9)
        AND t1.RecType IN (2,7);"""
    cleared_amount_output = run_query(cleared_amount_Sql)
    if(len(cleared_amount_output) > 0):
        cleared_amount_output = cleared_amount_output[0]
    
    
        
    final_data = {
        **order_amount_output,
        **cleared_amount_output,
        "TotalCustomer":len(get_customer_data),
        "TotalInvoice":len(get_data_invoice),
        "TotalProducts":len(get_data_products),
        "TotalCNR":len(cnr_output),
        "TotalCN":len(cn_output),
        "TotalOrder":len(order_output),
        "request.state.PartyName":request.state.PartyName
    }
    
    """
      AND CAST(DueDate AS DATE) BETWEEN '2022-04-10' AND '2022-04-20'
      """
      
      
    # print(get_customer_data,"get_customer_dataget_customer_data")
      
    return JSONResponse(status_code=200, content={"status": True, "message":"Admin Dashboard Successfully","data": final_data})
    
    
    
    


@router.get("/order_vs_sale_month_wise", status_code=200)
async def order_vs_sale_month_wise(request: Request):
    
    
    order_vs_sale_month_wise_Sql = f"""SELECT 
        YEAR(t1.Date) AS Year,
        MONTH(t1.Date) AS Month,
        ROUND(ABS(SUM(t1.Value3)), 0) AS TotalValue3,
        ROUND(ABS(SUM(t1.Value1)), 0) AS TotalValue1
    FROM Tran2 t1
    WHERE t1.VchType IN (3,9)
    AND t1.RecType IN (2,7)
    GROUP BY YEAR(t1.Date), MONTH(t1.Date)
    ORDER BY Year, Month;"""
    order_vs_sale_month_wise_output = run_query(order_vs_sale_month_wise_Sql)
    
    
    
    
        
    
      
    return JSONResponse(status_code=200, content={"status": True, "message":" Dashboard Successfully","data": order_vs_sale_month_wise_output})
    
    
    
    

@router.get("/user_order_vs_sale_month_wise", status_code=200)
async def user_order_vs_sale_month_wise(request: Request):
    
    
    
    order_vs_sale_month_wise_Sql = f"""
    SELECT 
        YEAR(t1.Date) AS Year,
        MONTH(t1.Date) AS Month,
        ROUND(ABS(SUM(t1.Value3)), 0) AS TotalValue3,
        ROUND(ABS(SUM(t1.Value1)), 0) AS TotalValue1
    FROM Tran2 t1 
    LEFT JOIN Tran1 t21
        ON t21.VchNo = t1.VchNo
    LEFT JOIN Master1 m1 
        ON m1.Code = t21.MasterCode1
    WHERE t1.VchType IN (3,9)
    AND t1.RecType IN (2,7)
    AND m1.Name LIKE '%{request.state.PartyName}%'
    GROUP BY YEAR(t1.Date), MONTH(t1.Date)
    ORDER BY Year, Month;"""
    order_vs_sale_month_wise_output = run_query(order_vs_sale_month_wise_Sql)
    
    
    
    
        
    
      
    return JSONResponse(status_code=200, content={"status": True, "message":" Dashboard Successfully","data": order_vs_sale_month_wise_output})
    
    
    



@router.get("/region_wise_sales", status_code=200)
async def region_wise_sales(request: Request):
    
    
    
    order_vs_sale_month_wise_Sql = f"""SELECT 
        YEAR(t1.Date) AS Year,
        MONTH(t1.Date) AS Month,
        ROUND(ABS(SUM(t1.Value3)), 0) AS TotalValue3,
        ROUND(ABS(SUM(t1.Value1)), 0) AS TotalValue1
    FROM Tran2 t1
    WHERE t1.VchType IN (3,9)
    AND t1.RecType IN (2,7)
    GROUP BY YEAR(t1.Date), MONTH(t1.Date)
    ORDER BY Year, Month;"""
    order_vs_sale_month_wise_output = run_query(order_vs_sale_month_wise_Sql)
    
    
    

    return JSONResponse(status_code=200, content={"status": True, "message":"Admin Dashboard Successfully","data": order_vs_sale_month_wise_output})
    
    
    
    
    
    
    
    

@router.get("/salesman_target_vs_achivement", status_code=200)
async def salesman_target_vs_achivement(request: Request):
    
    
    
    order_vs_sale_month_wise_Sql = f"""SELECT 
        YEAR(t1.Date) AS Year,
        MONTH(t1.Date) AS Month,
        ROUND(ABS(SUM(t1.Value3)), 0) AS TotalValue3,
        ROUND(ABS(SUM(t1.Value1)), 0) AS TotalValue1
    FROM Tran2 t1
    WHERE t1.VchType IN (3,9)
    AND t1.RecType IN (2,7)
    GROUP BY YEAR(t1.Date), MONTH(t1.Date)
    ORDER BY Year, Month;"""
    order_vs_sale_month_wise_output = run_query(order_vs_sale_month_wise_Sql)
    

    return JSONResponse(status_code=200, content={"status": True, "message":"Admin Dashboard Successfully","data": order_vs_sale_month_wise_output})
    
    
    
@router.get("/party_wise_vs_achievement", status_code=200)
async def party_wise_vs_achievement(request: Request):
    
    
    
    order_vs_sale_month_wise_Sql = f"""SELECT 
        YEAR(t1.Date) AS Year,
        MONTH(t1.Date) AS Month,
        ROUND(ABS(SUM(t1.Value3)), 0) AS TotalValue3,
        ROUND(ABS(SUM(t1.Value1)), 0) AS TotalValue1
    FROM Tran2 t1
    WHERE t1.VchType IN (3,9)
    AND t1.RecType IN (2,7)
    GROUP BY YEAR(t1.Date), MONTH(t1.Date)
    ORDER BY Year, Month;"""
    order_vs_sale_month_wise_output = run_query(order_vs_sale_month_wise_Sql)
    

    return JSONResponse(status_code=200, content={"status": True, "message":"Admin Dashboard Successfully","data": order_vs_sale_month_wise_output})
    
    
    
    

















@router.get("/Customer_Dashboard_Cards", status_code=200)
async def Customer_Dashboard_Cards(request: Request):
    
    print(request.state.user_details)
    print("Start Customer_Dashboard_Cards .....................")
    start = "2022-04-10"
    end = "2026-04-10"
    
    # btw_start_end = f"AND CAST(DueDate AS DATE) BETWEEN '{start}' AND '{end}'"
    btw_start_end = f""
    query_total = f"""WITH finalData AS (
    
SELECT 
    m1.Name AS CustomerName,
    Tran3.RefCode,
    
    SUM(Tran3.Value1) AS PendingQty,
    SUM(CASE WHEN Tran3.Value1 > 0 THEN Tran3.Value1 ELSE 0 END) AS TotalQty,
    (SUM(CASE WHEN Tran3.Value1 > 0 THEN Tran3.Value1 ELSE 0 END) - SUM(Tran3.Value1)) AS ClearedQty,

    SUM(Tran3.NewRefAmount) AS PendingAmount,
    SUM(CASE WHEN Tran3.Value1 > 0 THEN Tran3.NewRefAmount ELSE 0 END) AS TotalAmount,
    (SUM(CASE WHEN Tran3.Value1 > 0 THEN Tran3.NewRefAmount ELSE 0 END) - SUM(Tran3.NewRefAmount)) AS ClearedAmount,

    MAX(Tran3.No) AS VoucherNo,
    MIN(Tran3.Balance1) AS Balance1,
    COUNT(*) AS LinesCount
FROM Tran3
LEFT JOIN Tran1 
    ON Tran1.VchNo = Tran3.No
LEFT JOIN Master1 m1
    ON m1.Code = Tran1.MasterCode1
WHERE 
Tran3.VchType IN (12, 9) AND m1."Name" like 'AMBA E%'
GROUP BY 
    m1.Name,
    Tran3.RefCode
HAVING 
    SUM(CASE WHEN Tran3.Value1 > 0 THEN Tran3.Value1 ELSE 0 END) > 0
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

    # print(query_total)
    
    
    print("Start Admin_Dashboard_Cards ..................... 79")
    
    
    # start_v1 = datetime.now()
    
    get_data = run_query(query_total)
    
    print(get_data,"get_dataget_dataget_dataget_dataget_dataget_data")
    
    # start_v2 = datetime.now()
    # print(start_v2 - start_v1)
    # get_data_invoice = run_query(query_invoice)
    # start_v3 = datetime.now()
    # print(start_v3 - start_v1)
    # get_data_products = run_query(query_product)
    
    # start_v4 = datetime.now()
    
    
    # print(start_v4 - start_v1)
    
    if(len(get_data) > 0):
        get_data = get_data[0]
        
        
    
        
    final_data = {
        **get_data,
    #     "TotalCustomer":len(get_customer_data),
    #     "TotalInvoice":len(get_data_invoice),
    #     "TotalProducts":len(get_data_products),
    }
    
    # """
    #   AND CAST(DueDate AS DATE) BETWEEN '2022-04-10' AND '2022-04-20'
    #   """
      
      
    # print(get_customer_data,"get_customer_dataget_customer_data")
    
    final_data = {}
      
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
    
    
    
    
    
    
    
    
    
    

    

@router.get("/open_closing_amount", status_code=200)
async def open_closing_amount(request: Request):
    
    
    
    open_closing_amount_sql = f"""SELECT 
            ABS(f.D1) AS OpeningBalance,
            SUM(CASE WHEN t.Value1 > 0 THEN t.Value1 ELSE 0 END) AS Credit,
            ABS(SUM(CASE WHEN t.Value1 < 0 THEN t.Value1 ELSE 0 END)) AS Debit,
            SUM(t.Value1) AS NetTotal,
            ABS(f.D1 + SUM(t.Value1)) AS ClosingBalance
        FROM Tran2 t
        JOIN Master1 m ON t.MasterCode1 = m.Code
        JOIN Folio1 f ON f.MasterCode = m.Code
        WHERE m.Name LIKE '{request.state.PartyName}%'
        GROUP BY f.D1;"""
    open_closing_amount = run_query(open_closing_amount_sql)
    
    
    if(len(open_closing_amount) > 0):
        open_closing_amount = open_closing_amount[0]
        
        
    
    

    return JSONResponse(status_code=200, content={"status": True, "message":"open_closing_amount Successfully","data": open_closing_amount})
    
    


@router.get("/achievement_amount", status_code=200)
async def achievement_amount(request: Request):
    
    
    
    achievement_amount_sql = f"""
        SELECT ABS(SUM(Value3)) AS Achievement
        FROM Tran1 t1
        LEFT JOIN Master1 m1 
            ON m1.Code = t1.MasterCode1
        LEFT JOIN Tran2 t2
            ON t2.VchNo = t1.VchNo
        WHERE t1.VchType IN (9,3)
        AND t1.Cancelled = 0
        AND m1.Name LIKE '%{request.state.PartyName}%'
        AND t2.RecType IN (2,7);;"""
    achievement_amount_data = run_query(achievement_amount_sql)
    
    
    if(len(achievement_amount_data) > 0):
        achievement_amount_data = achievement_amount_data[0]
        
        
    
    

    return JSONResponse(status_code=200, content={"status": True, "message":"achievement_amount_data Successfully","data": achievement_amount_data})
    
    
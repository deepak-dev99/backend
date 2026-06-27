from base import *
from models import Admin



router = APIRouter()



    
@router.get("/get_salesman_list", status_code=200)
async def get_salesman_list(request: Request):
    
    # sql_q = f"""SELECT 
    #     s.name,
    #     s.email,
    #     sc.uuid,
    #     sc.party_id,
    #     sc.party_name,
    #     sc.party_address,
    #     sc.checkin_image,
    #     sc.checkout_image,
    #     sc.discussion,
    #     sc.remarks,
    #     sc.purpose,
    #     sc.salesman_id,
    # TO_CHAR(sc.checkin_time::timestamp, 'YYYY-MM-DD HH24:MI:SS') AS checkin_time,
    # TO_CHAR(sc.checkout_time::timestamp, 'YYYY-MM-DD HH24:MI:SS') AS checkout_time
    # FROM salesman_checkin as sc
    # JOIN salesmen as s
    # ON s.uuid = sc.salesman_id;
    # """
#     sql_q = f"""
#     SELECT 
#     slstart.lat AS StartLat,
#     slstart.lng AS StartLng,

#     slend.lat AS EndLat,
#     slend.lng AS EndLng,

#     s.name,
#     s.email,

#     sc.uuid,
#     sc.party_id,
#     sc.party_name,
#     sc.party_address,

#     sc.checkin_image,
#     sc.checkout_image,

#     sc.discussion,
#     sc.remarks,
#     sc.purpose,

#     sc.salesman_id,

#     TO_CHAR(sc.checkin_time::timestamp, 'YYYY-MM-DD HH24:MI:SS') AS checkin_time,

#     TO_CHAR(sc.checkout_time::timestamp, 'YYYY-MM-DD HH24:MI:SS') AS checkout_time

# FROM salesman_checkin sc

# JOIN salesmen s
#     ON s.uuid = sc.salesman_id

# LEFT JOIN (
#     SELECT *,
#            ROW_NUMBER() OVER (
#                PARTITION BY salesman_uuid
#                ORDER BY recorded_at ASC
#            ) AS rn
#     FROM salesman_location
# ) slstart
#     ON slstart.salesman_uuid = sc.uuid
#    AND slstart.rn = 1

# LEFT JOIN (
#     SELECT *,
#            ROW_NUMBER() OVER (
#                PARTITION BY salesman_uuid
#                ORDER BY recorded_at DESC
#            ) AS rn
#     FROM salesman_location
# ) slend
#     ON slend.salesman_uuid = sc.uuid
#    AND slend.rn = 1;
#     """
#     data = request.app.state.db.get_data_as_json(sql_q,())
    sql_q = f"""
     SELECT 
    s.name,
    s.email,

    sc.uuid,
    sc.party_id,
    sc.party_name,
    sc.party_address,

    sc.checkin_image,
    sc.checkout_image,

    sc.discussion,
    sc.remarks,
    sc.purpose,

    sc.salesman_id,

    TO_CHAR(sc.checkin_time::timestamp, 'YYYY-MM-DD HH24:MI:SS') AS checkin_time,
    TO_CHAR(sc.checkout_time::timestamp, 'YYYY-MM-DD HH24:MI:SS') AS checkout_time,

    ARRAY_AGG(ARRAY[slstart.lat, slstart.lng]) AS locations

FROM salesman_checkin sc

JOIN salesmen s
    ON s.uuid = sc.salesman_id

LEFT JOIN salesman_location slstart
    ON slstart.salesman_uuid = sc.uuid

GROUP BY 
    s.name,
    s.email,
    sc.uuid,
    sc.party_id,
    sc.party_name,
    sc.party_address,
    sc.checkin_image,
    sc.checkout_image,
    sc.discussion,
    sc.remarks,
    sc.purpose,
    sc.salesman_id,
    sc.checkin_time,
    sc.checkout_time;
    """
    data = request.app.state.db.get_data_as_json(sql_q,())
    
    
    # print(data,"datadatadata")
    return JSONResponse(status_code=200, content={"status": True, "message":"Customer Fetched Successfully","data": data})
    


    

@router.get("/salesman_one_visit_history/{one_uuid}", status_code=200)
async def salesman_one_visit_history(request: Request, one_uuid: str):
    
    
    
    print(one_uuid,"one_uuidone_uuidone_uuid")
    
    
    
    sql_q = f"""
        SELECT 
            sc.party_id,
            sc.party_name,
            sc.uuid,
            sc.purpose,
            sc.discussion,
            sc.party_address,
            sc.checkin_image,
            sc.checkout_image,
            TO_CHAR(sc.checkin_time::timestamp, 'YYYY-MM-DD HH24:MI:SS') AS checkin_time,
            TO_CHAR(sc.checkout_time::timestamp, 'YYYY-MM-DD HH24:MI:SS') AS checkout_time,
            (
                SELECT json_agg(
                    jsonb_build_array(
                        ci.lat,
                        ci.lng
                    )
                )
                FROM salesman_location ci
                WHERE ci.salesman_uuid = sc.uuid
            ) AS items_array
        FROM salesman_checkin sc
        WHERE sc.uuid = %s;
    """
    data = request.app.state.db.get_data_as_json(sql_q,(one_uuid,))
    
    
    if(len(data) > 0):
        return JSONResponse(status_code=200, content={"status": True, "message":"Customer Fetched Successfully","data": data[0]})
    else:
        return JSONResponse(status_code=200, content={"status": True, "message":"Customer Fetched Successfully","data": {}})
    
    
    
    

@router.get("/temp_parties_list", status_code=200)
async def get_temp_parties_list(request: Request):
    
    
    sql_q = f"""SELECT parties.party_name, parties.uuid AS id, parties.owner_name, parties.mobile, parties.gst, parties.address,parties.status, salesmen.name as salesman_name from parties left JOIN salesmen on salesmen.uuid = parties.salesman_id;"""
    data = request.app.state.db.get_data_as_json(sql_q,())
    
    return JSONResponse(status_code=200, content={"status": True, "message":"Parties List Fetched Successfully","data": data})
    
    
    

@router.patch("/approve-party-request/{one_uuid}", status_code=200)
def update_approve_party_request(request: Request, one_uuid:str):
    
    
    
    sql_q = f"update parties set status = 'Approved' where uuid = %s;"
    data = request.app.state.db.save_data(sql_q,(one_uuid,))
    
    
    return JSONResponse(status_code=200, content={"status": True, "message":"Parties List Fetched Successfully","data": data})
    
    
    


@router.patch("/reject-party-request/{one_uuid}", status_code=200)
def update_reject_party_request(request: Request, one_uuid:str):
    
    
    
    sql_q = f"update parties set status = 'Rejected' where uuid = %s;"
    data = request.app.state.db.save_data(sql_q,(one_uuid,))
    
    
    return JSONResponse(status_code=200, content={"status": True, "message":"Parties List Fetched Successfully","data": data})
    
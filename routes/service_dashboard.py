from base import *
from models import Service_dashboard


router = APIRouter()
qcSteps = [
    {
        "name": "1️⃣ Exterior Inspection",
        "key": "exterior_inspection",
        "points": [
            {"que": "Check for paint and scratches", "key": "paint_and_scratches", "status": True, "image": True, "remarks": True},
            {"que": "Remove all G2 sticker", "key": "remove_all_g2_sticker", "status": True, "image": True, "remarks": True},
            # {"que": "Applied Meba sticker", "key": "applied_meba_sticker", "status": True, "image": True, "remarks": True},
            # {"que": "Remove G2 name plate", "key": "remove_g2_name_plate", "status": True, "image": True, "remarks": True},
            # {"que": "Remove saw motor name plate", "key": "remove_saw_motor_name_plate", "status": True, "image": True, "remarks": True},
            # {"que": "Remove all hydraulic cylinder sticker", "key": "remove_hydraulic_cylinder_sticker", "status": True, "image": True, "remarks": True},
        ],
    },
    # {
    #     "name": "2️⃣ Hydraulic System",
    #     "key": "hydraulic_system",
    #     "points": [
    #         {"que": "Inspect hydraulic hose for wear / damage", "key": "inspect_hydraulic_hose", "status": True, "image": True, "remarks": True},
    #         {"que": "Check material feed cylinder work properly", "key": "material_feed_cylinder", "status": True, "image": True, "remarks": True},
    #         {"que": "Check for leakage in fittings and connection", "key": "hydraulic_leakage_check", "status": True, "image": True, "remarks": True},
    #     ],
    # },
    # {
    #     "name": "3️⃣ Mechanical Components",
    #     "key": "mechanical_components",
    #     "points": [
    #         {"que": "Inspect moving parts and misalignment", "key": "moving_parts_alignment", "status": True, "image": True, "remarks": True},
    #         {"que": "Check for loose bolts, nuts and fastener", "key": "loose_bolts_check", "status": True, "image": True, "remarks": True},
    #         {"que": "Check saw motor and cooling fan", "key": "saw_motor_cooling_fan", "status": True, "image": True, "remarks": True},
    #         {"que": "Check hydraulic motor and cooling fan", "key": "hydraulic_motor_cooling_fan", "status": True, "image": True, "remarks": True},
    #         {"que": "Check end piece length", "key": "end_piece_length", "status": True, "image": True, "remarks": True},
    #         {"que": "Check all sensors and limit switch", "key": "sensor_limit_switch", "status": True, "image": True, "remarks": True},
    #         {"que": "Check mist oil exhaust fan working on saw", "key": "mist_oil_exhaust_fan", "status": True, "image": True, "remarks": True},
    #         {"que": "Check diameter cutting size properly", "key": "diameter_cutting_size", "status": True, "image": True, "remarks": True},
    #         {"que": "Check mist oil air flow on cutter", "key": "mist_oil_air_flow", "status": True, "image": True, "remarks": True},
    #         {"que": "Look for debris or foreign objects", "key": "debris_foreign_objects", "status": True, "image": True, "remarks": True},
    #         {"que": "Hydraulic oil cooling fan", "key": "hydraulic_oil_cooling_fan", "status": True, "image": True, "remarks": True},
    #         {"que": "Coolant pump", "key": "coolant_pump", "status": True, "image": True, "remarks": True},
    #     ],
    # },
    # {
    #     "name": "4️⃣ Electrical Control Panel",
    #     "key": "electrical_control_panel",
    #     "points": [
    #         {"que": "Electrical panel exhaust fan", "key": "panel_exhaust_fan", "status": True, "image": True, "remarks": True},
    #         {"que": "Inspect control panel for damage and loose wiring", "key": "control_panel_wiring", "status": True, "image": True, "remarks": True},
    #         {"que": "Inspect HMI, VFD, PLC for any damage", "key": "hmi_vfd_plc_check", "status": True, "image": True, "remarks": True},
    #         {"que": "Look for exposed wire and damaged insulation", "key": "exposed_wire_check", "status": True, "image": True, "remarks": True},
    #         {"que": "Check chip conveyor", "key": "chip_conveyor", "status": True, "image": True, "remarks": True},
    #         {"que": "Check electrical panel and mounting", "key": "electrical_panel_mounting", "status": True, "image": True, "remarks": True},
    #     ],
    # },
    {
        "name": "5️⃣ Safety Features",
        "key": "safety_features",
        "points": [
            {"que": "Verify presence & integrity of safety guards", "key": "safety_guards", "status": True, "image": True, "remarks": True},
            {"que": "Check emergency stop and interlocks", "key": "emergency_stop", "status": True, "image": True, "remarks": True},
        ],
    },
    {
        "name": "6️⃣ Overall Condition",
        "key": "overall_condition",
        "points": [
            {"que": "Step back and check overall condition", "key": "overall_condition", "status": True, "image": True, "remarks": True},
            # {"que": "Ensure machine appears in good condition", "key": "machine_condition", "status": True, "image": True, "remarks": True},
            # {"que": "Ensure any major changes compared to previous model", "key": "major_changes_check", "status": True, "image": True, "remarks": True},
            # {"que": "Check back vice base plate", "key": "back_vice_base_plate", "status": True, "image": True, "remarks": True},
            # {"que": "Check front vice base plate", "key": "front_vice_base_plate", "status": True, "image": True, "remarks": True},
            # {"que": "Check cut material controller cylinder base plate", "key": "cut_material_controller_base_plate", "status": True, "image": True, "remarks": True},
        ],
        "final": True,
    }
]


async def save_file(upload_base_fn, file, folder_name):
    if not file:
        return None
    
    upload_base = os.path.join(os.getcwd(), upload_base_fn)


    folder_path = os.path.join(upload_base, folder_name)
    os.makedirs(folder_path, exist_ok=True)

    file_path = os.path.join(folder_path, file.filename)

    output_path = await cfn.saveFile(file, file_path)
    
    print(upload_base_fn,folder_name,file.filename,"upload_base")
    return os.path.join(upload_base_fn,folder_name,file.filename)



@router.post("/container-unloading", status_code=200)
async def container_unloading(
    request: Request,
    data: Service_dashboard.ContainerUnloadingModel = Depends(
        Service_dashboard.ContainerUnloadingModel.as_form
    ),
):
    print(data)

    upload_base = os.path.join("uploads", "service")

    saved_files = {}

    

    # ✅ Save all images
    saved_files["containerImage"] = await save_file(upload_base, data.containerSealImage, "container_image")

    saved_files["ingressRemarkImage"] = await save_file(upload_base, data.ingressImage, "ingress_remark")
    saved_files["dislocationRemarkImage"] = await save_file(upload_base, data.dislocationImage, "dislocation_remark")
    saved_files["collisionRemarkImage"] = await save_file(upload_base, data.collisionImage, "collision_remark")
    saved_files["damageRemarkImage"] = await save_file(upload_base, data.damageImage, "damage_remark")
    saved_files["packingListRemarkImage"] = await save_file(upload_base, data.packingListImage, "packing_list_remark")
    
    
    
    
    sql_q = """
        INSERT INTO container_unloading (
            container_seal_no,
            container_seal_image,

            ingress,
            ingress_remark,
            ingress_image,

            dislocation,
            dislocation_remark,
            dislocation_image,

            collision,
            collision_remark,
            collision_image,

            damage,
            damage_remark,
            damage_image,

            packing_list,
            packing_list_remark,
            packing_list_image
        )
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
    """
    
    
    values = (
        data.containerSealNo,
        saved_files["containerImage"],

        data.ingress,
        data.ingressRemark,
        saved_files["ingressRemarkImage"],

        data.dislocation,
        data.dislocationRemark,
        saved_files["dislocationRemarkImage"],

        data.collision,
        data.collisionRemark,
        saved_files["collisionRemarkImage"],

        data.damage,
        data.damageRemark,
        saved_files["damageRemarkImage"],

        data.packingList,
        data.packingListRemark,
        saved_files["packingListRemarkImage"],
    )
    
    
    
    try:
        data = request.app.state.db.save_data(sql_q, values)  # your DB helper
        
        print(data,"datadata")
        return JSONResponse(status_code=200, content={"status": True, "message": "Container unloading data saved successfully", "uuid":data["new_id"]})
    except Exception as e:
        return JSONResponse(status_code=400, content={"status": False, "error": str(e)})
    
    
    
    
    

@router.get("/machine-inspection-questions", status_code=200)
async def machine_inspection_questions(request: Request):
    
    
    return JSONResponse(status_code=200, content={"status": True, "message":"Customer created Successfully","data": qcSteps})
    
    
    
@router.post("/machine-inspection/{inspection_id}/{step}", status_code=200)
async def machine_inspection(inspection_id: str, step: str, request: Request):

    try:
        form = await request.form()
        missing_data = []
        values = []

        upload_base = os.path.join("uploads", "inspection")

        # ✅ find step config
        selected_step = next((s for s in qcSteps if s["key"] == step), None)

        if not selected_step:
            return JSONResponse(
                status_code=404,
                content={"status": False, "error": "Invalid step"}
            )

        for onePoint in selected_step["points"]:
            point_key = onePoint["key"]
            question_text = onePoint["que"]

            status_val = None
            image_url = None
            remarks_val = None

            # ✅ STATUS
            if onePoint.get("status"):
                status_val = form.get(f"{point_key}_status")

                if not status_val:
                    missing_data.append(f"{question_text} Status is missing")

            # ✅ IMAGE (using your save_file)
            if onePoint.get("image"):
                file = form.get(f"{point_key}_image")

                if file and getattr(file, "filename", None):
                    image_url = await save_file(
                        upload_base,
                        file,
                        step   # dynamic folder per step
                    )
                else:
                    missing_data.append(f"{question_text} Image is missing")

            # ✅ REMARKS
            if onePoint.get("remarks"):
                remarks_val = form.get(f"{point_key}_remarks")

                if not remarks_val:
                    missing_data.append(f"{question_text} Remarks is missing")

            # ✅ prepare values for bulk insert
            values.append((
                inspection_id,
                step,
                point_key,
                status_val,
                remarks_val,
                image_url
            ))

        # ❌ validation fail
        if missing_data:
            return JSONResponse(
                status_code=400,
                content={
                    "status": False,
                    "error": ", ".join(missing_data)
                }
            )

        # ✅ SQL (UPSERT)
        sql_q = """
            INSERT INTO inspection_answers
            (session_id, step_key, question_key, status, remarks, image_url)
            VALUES (%s, %s, %s, %s, %s, %s)
            ON CONFLICT (session_id, question_key)
            DO UPDATE SET
                status = EXCLUDED.status,
                remarks = EXCLUDED.remarks,
                image_url = EXCLUDED.image_url,
                updated_at = CURRENT_TIMESTAMP
        """

        # ✅ execute (loop because your helper likely handles single insert)
        last_id = None
        for val in values:
            data = request.app.state.db.save_data(sql_q, val)
            
            print(data,"datadatadatadatadata")
            last_id = data.get("new_id")

        return JSONResponse(
            status_code=200,
            content={
                "status": True,
                "message": f"{selected_step['name']} saved successfully",
                "uuid": last_id
            }
        )

    except Exception as e:
        return JSONResponse(
            status_code=400,
            content={
                "status": False,
                "error": str(e)
            }
        )
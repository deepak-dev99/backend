from pydantic import BaseModel
from fastapi import UploadFile, File, Form


class ContainerUnloadingModel(BaseModel):

    containerSealNo: str
    containerSealImage: UploadFile

    ingressImage: UploadFile
    ingressRemark: str
    ingress: bool

    dislocationImage: UploadFile
    dislocationRemark: str
    dislocation: bool

    collisionImage: UploadFile
    collisionRemark: str
    collision: bool

    damageImage: UploadFile
    damageRemark: str
    damage: bool

    packingListImage: UploadFile
    packingListRemark: str
    packingList: bool

    @classmethod
    def as_form(
        cls,
        containerSealNo: str = Form(...),
        containerSealImage: UploadFile = File(...),

        ingressImage: UploadFile = File(...),
        ingressRemark: str = Form(...),
        ingress: bool = Form(...),

        dislocationImage: UploadFile = File(...),
        dislocationRemark: str = Form(...),
        dislocation: bool = Form(...),

        collisionImage: UploadFile = File(...),
        collisionRemark: str = Form(...),
        collision: bool = Form(...),

        damageImage: UploadFile = File(...),
        damageRemark: str = Form(...),
        damage: bool = Form(...),

        packingListImage: UploadFile = File(...),
        packingListRemark: str = Form(...),
        packingList: bool = Form(...),
    ):
        return cls(
            containerSealNo=containerSealNo,
            containerSealImage=containerSealImage,

            ingressImage=ingressImage,
            ingressRemark=ingressRemark,
            ingress=ingress,

            dislocationImage=dislocationImage,
            dislocationRemark=dislocationRemark,
            dislocation=dislocation,

            collisionImage=collisionImage,
            collisionRemark=collisionRemark,
            collision=collision,

            damageImage=damageImage,
            damageRemark=damageRemark,
            damage=damage,

            packingListImage=packingListImage,
            packingListRemark=packingListRemark,
            packingList=packingList,
        )
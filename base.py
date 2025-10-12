 
from fastapi import FastAPI, APIRouter,HTTPException, Request, File, UploadFile, Depends, Request, Form, Query
from starlette.middleware.base import BaseHTTPMiddleware
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse, FileResponse
import psycopg2
from dotenv import load_dotenv
import os
from datetime import datetime, timedelta
from jose import JWTError, jwt
import traceback
import uuid

from pydantic import BaseModel, EmailStr
from fastapi import Form

from typing import List




import json


from typing import Optional


from common.external_db import run_query




import common.sql_operation as cso
import common.auth as caa
import common.custom_middleware as ccm









from routes import auth
from routes import inventory
from routes import statistics
from routes import customer
from routes import common
from routes import busy_board

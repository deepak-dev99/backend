from flask import *
from fastapi import FastAPI, APIRouter, Request
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse
import psycopg2
from dotenv import load_dotenv
import os
from datetime import datetime, timedelta
from jose import JWTError, jwt


from pydantic import BaseModel

import json





import common.sql_operation as cso
import common.auth as caa








from routes import auth
from routes import 


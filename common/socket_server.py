from base import *

sio = socketio.AsyncServer(
    async_mode="asgi",
    cors_allowed_origins="*"
)

socket_app = socketio.ASGIApp(sio)


@sio.event
async def connect(sid, environ):
    print("Socket connected:", sid)

@sio.event
async def disconnect(sid):
    print("Socket disconnected:", sid)

@sio.event
async def ping_server(sid, data):
    print("Received:", data)
    await sio.emit("pong_client", {"msg": "pong from server"})

import paho.mqtt.client as mqtt
from datetime import datetime
from base import *
import json

load_dotenv()

buffer = []

BROKER = "broker.freemqtt.com"
PORT = 1883
TOPIC = "devices/location"

USERNAME = "freemqtt"
PASSWORD = "public"

db = cso.CommonDB()


def on_connect(client, userdata, flags, rc):
    if rc == 0:
        print("Connected successfully")
        client.subscribe(TOPIC)
    else:
        print("Connection failed with code", rc)


def on_message(client, userdata, msg):
    raw = msg.payload.decode("utf-8")
    print("RAW:", raw)

    json_data = json.loads(raw)
    print(f"Received: {json_data} from topic: {msg.topic}")

    buffer.append((
        json_data["checkInId"],
        json_data["lat"],
        json_data["lng"],
        datetime.now()
    ))

    print("buffer length is " + str(len(buffer)))

    if len(buffer) >= 2:
        insert_bulk(buffer)
        buffer.clear()


def insert_bulk(rows):
    print("Doing bulk insert in table")
    query = """
    INSERT INTO salesman_location (salesman_uuid, lat, lng, recorded_at)
    VALUES (%s, %s, %s, %s)
    """
    db.save_data_bulk(query, rows)


def main():
    client = mqtt.Client()
    client.username_pw_set(USERNAME, PASSWORD)

    client.on_connect = on_connect
    client.on_message = on_message

    client.connect(BROKER, PORT, 60)
    client.loop_forever()


if __name__ == "__main__":
    main()
from http.server import BaseHTTPRequestHandler, HTTPServer
import json
import os
import socket
import time

import psycopg


def connect_db():
    return psycopg.connect(
        host=os.getenv("DB_HOST", "db"),
        port=int(os.getenv("DB_PORT", "5432")),
        dbname=os.environ["POSTGRES_DB"],
        user=os.environ["POSTGRES_USER"],
        password=os.environ["POSTGRES_PASSWORD"],
        connect_timeout=3,
    )


class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == "/health":
            try:
                with connect_db() as conn:
                    with conn.cursor() as cur:
                        cur.execute("SELECT 1")
                        cur.fetchone()

                result = {"status": "ok", "database": "connected"}
                self.send_json(200, result)
            except Exception:
                self.send_json(
                    503,
                    {"status": "error", "database": "unavailable"},
                )
        else:
            self.send_json(
                200,
                {
                    "message": "Aplicacion DevOps",
                    "hostname": socket.gethostname(),
                },
            )

    def send_json(self, status, data):
        body = json.dumps(data).encode()
        self.send_response(status)
        self.send_header("Content-Type", "application/json")
        self.end_headers()
        self.wfile.write(body)


server = HTTPServer(("0.0.0.0", 8000), Handler)
print("Aplicacion iniciada en el puerto 8000", flush=True)
server.serve_forever()

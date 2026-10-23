from http.server import BaseHTTPRequestHandler, HTTPServer
import json
import os
import socket

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == "/health":
            response = {
                "status": "ok",
                "hostname": socket.gethostname()
            }
            self.send_response(200)
        else:
            response = {
                "message": "Mi primera aplicacion Docker",
                "environment": os.getenv("APP_ENV", "development")
            }
            self.send_response(200)

        self.send_header("Content-Type", "application/json")
        self.end_headers()
        self.wfile.write(json.dumps(response).encode("utf-8"))

server = HTTPServer(("0.0.0.0", 8000), Handler)
print("Servidor iniciado en el puerto 8000", flush=True)
server.serve_forever()

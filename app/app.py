from flask import Flask, jsonify
import os
import socket
from datetime import datetime


app = Flask(__name__)


@app.route("/")
def home():
    return "🚀 DevOps Platform Running"


@app.route("/health")
def health():
    return jsonify({
        "status": "healthy"
    }), 200


@app.route("/env")
def env():
    return jsonify({
        "environment": os.getenv("ENV", "dev")
    })


@app.route("/info")
def info():
    return jsonify({
        "hostname": socket.gethostname(),
        "time": datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    })


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

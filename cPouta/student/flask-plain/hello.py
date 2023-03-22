from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"


# to run:
# flask --app hello run --host='0.0.0.0' --port=5000
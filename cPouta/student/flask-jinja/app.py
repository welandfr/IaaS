
from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def home():

    data = {
        "title": "Jinja and Flask",
        "greeting": "Hello Jinja!"
    }

    return render_template("hello.html", data=data)


# to run:
# flask --app app run --host='0.0.0.0' --port=5001
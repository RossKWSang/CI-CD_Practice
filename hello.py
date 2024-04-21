"""
CICD 연습용 API
"""

from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    """
    hello world api
    :return: HTML
    """
    return "<p>Hello, World! jenkins test</p>"

"""
패키지 생성자 python 파일
"""

import os
from flask import Flask


def create_app():
    """
    설치된 패키지가 실행될 때 호출되는 함수
    :return: flask app을 반환함
    """
    app = Flask(__name__)

    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    @app.route("/")
    def hello():
        return "Hello, World"

    return app

FROM python:3.9-slim
LABEL authors="wonsang"

COPY . /app
WORKDIR /app
RUN pip install -e .
RUN pip3 install flask
CMD ["python3", "-m", "flask", "--app", "hello", "run", "--host", "0.0.0.0", "--debug"]

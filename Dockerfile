FROM python:3.8-slim

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY tests/ tests/

CMD ["python", "tests/test_users.py"]

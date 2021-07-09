FROM python:3.9.5-slim-buster

WORKDIR /app

COPY requierments.txt requierments.txt

RUN pip3 install -r requierments.txt

COPY counter-service.py app.py

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]

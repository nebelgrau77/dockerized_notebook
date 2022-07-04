# just a placeholder file for now
FROM python:3.10-slim-bullseye

RUN apt update && apt upgrade -y
RUN apt-get -y install git

# upgrade pip to the latest version 
RUN pip install --upgrade pip
RUN pip install mlflow


EXPOSE 5000
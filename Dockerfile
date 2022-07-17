# start with a base image, in this case Python 3.10 built on a minimal version of Debian Bullseye
FROM python:3.10-slim-bullseye

# copy requirements.txt into the container to be used inside the container
COPY requirements.txt /tmp/requirements.txt

# set environment variables - set your username here
ARG USERNAME=my_user
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# create a non-root user 
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME 

# add git necessary for MLflow
RUN apt update && apt upgrade -y
RUN apt-get -y install git

# upgrade pip to the latest version 
RUN pip install --upgrade pip

# install Python packages defined in requirements.txt
RUN pip install -r /tmp/requirements.txt

# remove the requirements file from the container
RUN rm /tmp/requirements.txt    

# expose the port used by Jupyter notebook
EXPOSE 8888

# set environment for the notebook
ENV NB_USER=$USERNAME

# [Optional] Set the default user. Omit if you want to keep the default as root.
USER $USERNAME

# set the working directory where the notebook will start
WORKDIR /home/$USERNAME/work


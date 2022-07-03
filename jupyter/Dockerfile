# base image to build
FROM python:3.10-slim-bullseye

# copying requirements.txt into the container to be used inside the container
COPY requirements.txt /tmp/requirements.txt

# some environment variables
ARG USERNAME=nebelgrau
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create a non-root user 
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME 
    # \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    #    
    # && apt-get update \
    # && apt-get install -y sudo \
    # && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    # && chmod 0440 /etc/sudoers.d/$USERNAME

# upgrade pip to the latest version 
RUN pip install --upgrade pip
# install Python packages defined in requirements.txt
RUN pip install -r /tmp/requirements.txt
# remove the requirements file from the container
RUN rm /tmp/requirements.txt

# expose the port used by Jupyter notebook
EXPOSE 8888

# [Optional] Set the default user. Omit if you want to keep the default as root.
USER $USERNAME
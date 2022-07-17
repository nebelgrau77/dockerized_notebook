## Basic Jupyter Notebook with scikit-learn and MLflow

This setup allows to run the examples from chapter 1 of the book ["Machine Learning Engineering with MLflow"](https://www.packtpub.com/product/machine-learning-engineering-with-mlflow/9781800560796). I put it together from scratch, as I had problems getting the original book example to work (there is a problem with permissions of a file used by Jupyter, which has to be addressed with an usafe workaround, by adding `ENV JUPYTER_ALLOW_INSECURE_WRITES=true` at the end of the Dockerfile). It is also pretty bloated, as it uses the very complete `jupyter/scipy-notebook` image with lots of modules that are not necessary for this example.

### Description

The Dockerfile uses a Python image based on a minimal version of Debian. For that reason git has to be installed, as it is required by MLflow and doesn't seem to be included in the Debian image. Pip is upgraded, and then necessary Python libraries installed from the `requirements.txt` file. MLflow, scikit-learn and notebook already install various Python libraries as dependencies, such as pandas, numpy or Flask. Matplotlib has to be added separately, MLflow cannot do certain things otherwise. 

The Dockerfile also creates a new non-root user, in this example it's `my_user`. It can be changed, and the `run.sh` script will extract the name from the Dockerfile to correctly map the the container folder /home/{USERNAME}/work to your local folder. 

### Use

Simply execute `./run.sh` and then click on the link printed by Jupyter into the terminal to open the notebook. 

### Notes

This is by no means intended as "Docker/Jupyter/Python best practices", I'm learning it all myself :) But it might help understanding how those containers are set up, as it's easier to analyze than the `scipy-notebook`, itself built on top of `minimal-notebook`, which in turn is based on `base-notebook`, etc. 

Comments and contributions are most welcome!


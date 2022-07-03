## Simple Docker image for data science / machine learning experiments

Based on the python:3.10-slim-bullseye image, to make it more lightweight. Contains only a few Python libraries, and sets up the Jupyter notebook for experimenting.

### Usage:

#### Jupyter Notebook (default):

* Run the command `docker-compose up` (`docker compose up` on Windows) 
* Click one of the URLs printed to the terminal. This will open a Jupyter notebook session in your browser.

There is a simple demo notebook `iris_dataset.ipynb` with some basic dataset exploration and visualization.

#### Linux console

* Run `docker-compose up -d` (starts the container in detached mode)
* Run `docker-compose exec jupyter_ds bash` 

This will open the bash console in the working directory. From here you can e.g. run `ipython` (interactive Python console). Please note that matplotlib output will not be visualized, as the container's Linux doesn't have a browser.


### Explanation:

What happens when you run the `docker-compose up' command?

#### Dockerfile:

* defines the base image (python:3.10-slim-bullseye)
* creates a non-root user nebelgrau (please modify `ARG USERNAME` if you wish to use a different name)
* upgrades Python's PIP installer to the latest version
* installs Python libraries specified in `requirements.txt`: 
  * `pandas`, 
  * `numpy` (dependency of pandas), 
  * `matplotlib`
  * `scikit-learn`, 
  * `ipython` 
  * `jupyter notebook`
* exposes port `8888` used by Jupyter
* sets user as the non-root user defined above

#### docker-compose.yml

* maps the `8888` port to the host's `8888` port, so that Jupyter notebooks can be opened in host's browser
* maps this directory to `/home/username/work`
* sets `/home/username/work/notebooks` as the working directory: this is where Jupyter notebook files will be saved

### Notes:

* The first time `docker-compose up` is run, it will need to download the image and then build it, including the installation of the Python modules. This may take up to a few minutes depending on the system and internet connection.
* At the moment the desired user name must be changed in two separate places: 
  * in `.env` file, which is what the `docker-compose.yml` uses
  * directly in the Dockerfile, in the `ARG USERNAME=` line
* Tested on Windows 10 and Ubuntu Linux 20.04.

### To do:

* Find a way to define the desired non-root user name in a single place.
* Make sure that there aren't any unnecessary entries in `Dockerfile` or `docker-compose.yml`
docker build -t jupyter .
docker run -p 8888:8888 -p 5000:5000 -v $(pwd)/work:/home/nebelgrau/work -it jupyter jupyter notebook --ip 0.0.0.0
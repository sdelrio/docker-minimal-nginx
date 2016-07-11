# Minimal nginx

Sample with Alpine Linux as base image. Small container, about 6.7 MB size.

The image will run the nginx master process as `root` and the worker process as `nobody` user instead of `root`.

## Build image

To build the image with name minimal-nginx:

```
$ docker build -t minimal-nginx .
Sending build context to Docker daemon  7.68 kB
Step 0 : FROM alpine:3.2
 ---> ab7e84202862
Step 1 : RUN apk add --update nginx && rm -rf /var/cache/apk/*
 ---> Using cache
 ---> 4ffb8220a47f
Step 2 : COPY nginx.non-root.conf /etc/nginx/nginx.conf
 ---> 12c16fa78728
Removing intermediate container 8cf9ebc817c0
Step 3 : COPY index.html /usr/share/nginx/html/index.html
 ---> 66ef2d118a55
Removing intermediate container fcdf5cf7659d
Step 5 : CMD nginx -g daemon off;
 ---> Running in 924416d06df6
 ---> 792212e8fbc1
Removing intermediate container 924416d06df6
Successfully built 792212e8fbc1
```

## Runing image

To start image you could use `docker run -td -p 80:8080 minimal-nginx`. Or if using dockerhub: `docker run -td -p 80:8080 sdelrio/docker-minimal-nginx`.

We can see nginx process is now running the nginx master process as `root` and the worker process as the `nobody` user instead of `root`.

Map the volume to your current directory `-v $(pwd):/usr/share/nginx/html`.

```
$ docker run -td -p 80:8080 minimal-nginx
3a7f3e9ad1906a0c15c12e9bad94cd00ac172eae51bef7d73af4a45e4f1fd96e

$ docker ps
CONTAINER ID        IMAGE                  COMMAND                  CREATED             STATUS              PORTS                    NAMES
3a7f3e9ad190        minimal-nginx          "nginx -g 'daemon off"   2 seconds ago       Up 1 seconds        0.0.0.0:80->8080/tcp     evil_yalow

$ docker exec evil_yalow ps
PID   USER     TIME   COMMAND
    1 root       0:00 nginx: master process nginx -g daemon off;
    7 nobody     0:00 nginx: worker process
    29 root      0:00 ps
```

To access the container use `sh` rather than the standard `bash`

```
$ docker exec evil_yalow sh
/ #
```

## References

Docker documentation, best practices for building secure Docker images.


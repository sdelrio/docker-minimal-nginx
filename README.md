# Minimal nginx

Sample with alpine base image

The image will run as `nobody` user instead of `root`.

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
Step 4 : USER nobody
 ---> Running in f29ac1ee7d2b
 ---> af2a00e1517f
Removing intermediate container f29ac1ee7d2b
Step 5 : CMD nginx -g daemon off;
 ---> Running in 924416d06df6
 ---> 792212e8fbc1
Removing intermediate container 924416d06df6
Successfully built 792212e8fbc1
```

## Runing image

To start image you could use `docker run -td -p 80:8080 minimal-nginx`.

We can see nginx process is now running with user nobody instead of root.

```
$ docker run -td -p 80:8080 minimal-nginx
3a7f3e9ad1906a0c15c12e9bad94cd00ac172eae51bef7d73af4a45e4f1fd96e

$ docker ps
CONTAINER ID        IMAGE                  COMMAND                  CREATED             STATUS              PORTS                    NAMES
3a7f3e9ad190        minimal-nginx          "nginx -g 'daemon off"   2 seconds ago       Up 1 seconds        0.0.0.0:80->8080/tcp     evil_yalow

$ docker exec evil_yalow ps
PID   USER     TIME   COMMAND
    1 nobody     0:00 nginx: master process nginx -g daemon off;
    7 nobody     0:00 nginx: worker process
    8 nobody     0:00 ps
```

## References

Docker documentation, best practices for building secure Docker images.


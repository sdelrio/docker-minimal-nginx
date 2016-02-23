FROM alpine:3.2

# Install nginx package and remove cache
RUN apk add --update nginx && rm -rf /var/cache/apk/*

# Copy basic files
COPY nginx.non-root.conf /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 8080
VOLUME ["/usr/share/nginx/html"]

# Start nginx without root
USER nobody

CMD ["nginx", "-g", "daemon off;"]

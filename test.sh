#!/bin/bash

# Test nginx file

nginx -t || exit 1

# Wait for nginx to start before test

sleep 2

# Test web server is working

if curl -s http://web:8080 | grep -q '<title>Nginx with Alpine Linux</title>'; then
    echo "Tests passed!"
    exit 0
else
    echo "Tests failed!"
    exit 1
fi


#!/bin/bash

# Test nginx file

nginx -t || exit 1

# Wait for nginx to start before test

sleep 2

# Test web server is working
RETURN_CODE=0

if curl -s http://web:8080 | grep -q '<title>Nginx with Alpine Linux</title>'; then
    echo "Main page Test passed!"
else
    echo "Main page Test failed!"
    RETURN_CODE=1
fi

if curl -s http://web:8080/healthcheck | grep -q '{"response_status":200,"data":"alive"}'; then
    echo "Heathcheck test passed!"
else
    echo "Heathcheck Test failed!"
    RETURN_CODE=1
fi

exit $RETURN_CODE

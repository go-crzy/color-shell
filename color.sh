#!/bin/bash

PORT=${PORT:-1500}

while true; do
  echo -e "HTTP/1.1 200 OK\n\n{\"color\": \"red\"}" | nc -l $PORT
done

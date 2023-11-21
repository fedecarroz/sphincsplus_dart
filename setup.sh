#!/bin/bash
docker build -t spx:latest .
docker run -it -d --name spx -v .:/home/user/sphincsplus_dart spx:latest
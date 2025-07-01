#!/bin/bash

docker stop netflix
docker rm netflix
docker image rm daniel2688/netflix-react-app:latest

# docker-godot

[![CircleCI](https://circleci.com/gh/mtlynch/docker-godot.svg?style=svg)](https://circleci.com/gh/mtlynch/docker-godot) [![Docker Pulls](https://img.shields.io/docker/pulls/mtlynch/godot.svg?maxAge=604800)](https://hub.docker.com/r/mtlynch/godot/) [![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](LICENSE)

## Overview

Dockerized version of the Godot Game Engine.

## Usage

```bash
readonly LOCAL_APP_PATH="/path/to/your/godot/project"
docker run \
  -it \
  --rm \
  --name godot \
  -v "${LOCAL_APP_PATH}/:/app" \
  godot \
    --export HTML5 /app/project.godot /app/dist/index.html
```

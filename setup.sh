#!/bin/bash

# Define paths to repositories
frontend_repo_path="./setup-frontend"
backend_repo_path="./setup-backend"
docker_repo_path="./setup-config"

git submodule update --init --recursive

git submodule update --recursive --remote

# Navigate to the Docker repository
cd "$docker_repo_path"

# Start frontend and backend containers using Docker Compose
docker-compose up

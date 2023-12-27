#!/bin/bash

# Define paths to repositories
frontend_repo_path="./a/frontend2"
backend_repo_path="./a/backend2"
docker_repo_path="./a/docker2"

# Function to clone or pull a repository
clone_or_pull() {
    repo_url="$1"
    repo_path="$2"
    if [ -d "$repo_path" ]; then
        # If the repository exists, pull the latest changes
        echo "Pulling latest changes for $repo_path..."
        git -C "$repo_path" pull
    else
        # If the repository doesn't exist, clone it
        echo "Cloning $repo_url to $repo_path..."
        git clone "$repo_url" "$repo_path"
    fi
}

# Clone or pull repositories
clone_or_pull "git@github.com:dalveersidhu97/portfolio-builder-frontend.git" "$frontend_repo_path"
clone_or_pull "git@github.com:dalveersidhu97/portfolio-builder-backend.git" "$backend_repo_path"
clone_or_pull "git@github.com:dalveersidhu97/next-portfolio.git" "$docker_repo_path"

# Navigate to the Docker repository
cd "./docker"

# Start frontend and backend containers using Docker Compose
docker-compose watch

#!/bin/bash

# Define the MongoDB version
MONGODB_VERSION="latest"

# Define container name
CONTAINER_NAME="mongodb_container"

# Define your root username and password
MONGODB_USERNAME="myUserAdmin"
MONGODB_PASSWORD="abc123"

# Define MongoDB data directory on the host
PARENT_DIRECTORY=$(dirname "$PWD")
DATA_DIRECTORY="$PARENT_DIRECTORY/data/mongodb"

# Pull the MongoDB image
docker pull mongo:$MONGODB_VERSION

# Run the MongoDB container
docker run -d --name $CONTAINER_NAME -v $DATA_DIRECTORY:/data/db -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=$MONGODB_USERNAME -e MONGO_INITDB_ROOT_PASSWORD=$MONGODB_PASSWORD mongo:$MONGODB_VERSION

#!/bin/bash

# Run the Dockerfile
IMAGE_NAME="base-dock"

docker build -t "$IMAGE_NAME" -f Dockerfile.base . 2>&1 | tee build.log

# Check if the build was successful
if [ $? -eq 0 ]; then
    echo "Docker image built successfully." 

    # Run a container from the image
    echo "Running container from image: $IMAGE_NAME" 
    docker run --rm "$IMAGE_NAME" 2>&1 | tee run.log

else
    echo "Docker image build failed." 
    exit 1
fi 

docker build -t "xla-dock" -f Dockerfile.xla . 2>&1 | tee build_xla.log

# Check if the build was successful
if [ $? -eq 0 ]; then
    echo "Docker image 'xla-dock' built successfully." 

    # Run a container from the image
    echo "Running container from image: xla-dock" 

    docker run --rm \
    --device /dev/tenstorrent \
    -v /dev/hugepages-1G:/dev/hugepages-1G \
    -v "$(pwd)/demo.py:/demo.py" \
    -v "$(pwd)/run-xla-wheel.sh:/run-xla-wheel.sh" \
    xla-dock \
    bash /run-xla-wheel.sh 2>&1 | tee run_xla.log

else
    echo "Docker image 'xla-dock' build failed." 
    exit 1
fi 

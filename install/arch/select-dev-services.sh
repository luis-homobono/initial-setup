#!/bin/bash

# Install default databases
if [[ -v FIRST_RUN_SERVICES ]]; then
  services=$FIRST_RUN_SERVICES
else
  echo "Not cloud services defined..."
fi

if [[ -n "$services" ]]; then
  for service in $services; do
    case $service in
    localstack)
      sudo docker run -d --restart unless-stopped -p 4566:4566 -p 4510-4559:4510-4559 -v /var/run/docker.sock:/var/run/docker.sock localstack/localstack:4.12.0
      ;;
    floci)
      sudo docker run -d --restart unless-stopped -p "127.0.0.1:4566:4566" -v /var/run/docker.sock:/var/run/docker.sock --name=floci floci/floci:latest
      ;;
    floci-gcp)
      sudo docker run -d --restart unless-stopped -p "127.0.0.1:4588:4588" --name=floci-gcp floci/floci-gcp:latest
      ;;
    floci-azure)
      sudo docker run -d --restart unless-stopped -p "127.0.0.1:4577:4577" -p "127.0.0.1:5672:5672" -p "127.0.0.1:5673:5673" --name=floci-azure floci/floci-az:latest
      ;;
    esac
  done
fi

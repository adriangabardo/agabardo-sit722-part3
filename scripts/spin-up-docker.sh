#!/bin/bash

# Check if ACR_NAME is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <acr_name>"
  exit 1
fi

ACR_NAME="$1"
BOOK_CATALOG_IMAGE="book_catalog"
INVENTORY_MANAGEMENT_IMAGE="inventory_management"

# Start the services
echo "Starting services with docker compose..."
docker-compose rm -f
docker-compose build --no-cache

# Tag the images
echo "Tagging images..."
docker tag ${BOOK_CATALOG_IMAGE}:latest ${ACR_NAME}.azurecr.io/${BOOK_CATALOG_IMAGE}:latest
docker tag ${INVENTORY_MANAGEMENT_IMAGE}:latest ${ACR_NAME}.azurecr.io/${INVENTORY_MANAGEMENT_IMAGE}:latest

# Login to Azure Container Registry
echo "Logging in to Azure Container Registry..."
az acr login --name ${ACR_NAME}

# Push the images to Azure Container Registry
echo "Pushing images to Azure Container Registry..."
docker push ${ACR_NAME}.azurecr.io/${BOOK_CATALOG_IMAGE}:latest
docker push ${ACR_NAME}.azurecr.io/${INVENTORY_MANAGEMENT_IMAGE}:latest

echo "Deployment complete."

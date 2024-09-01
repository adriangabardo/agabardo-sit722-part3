## Project Part 3

### Requirements

- Azure Container Registry
- Azure Kubernetes Service
- PostgreSQL database

### Getting Started

In `docker-compose.yml`, change `$ACR_URL` to your Azure Container Registry URL, and `$DATABASE_URL` to your PostgreSQL database URL.

Use the following script to build the images and push them to your ACR:

```bash
chmod +x ./scripts/spin-up-docker.sh
./scripts/spin-up-docker.sh $ACR_URL
```

Use the following commands to deploy the Kubernetes service:

```bash
kubectl config current-context
kubectl apply -f deployment.yml
kubectl get pods
kubectl get deployments
kubectl get services
```

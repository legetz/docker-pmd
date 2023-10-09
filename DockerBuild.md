# Prepare Docker builder for the first time
- `docker buildx create --name mybuilder --driver docker-container --bootstrap`
- `docker buildx use mybuilder`

# Build and upload new version to DockerHub
- `docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t jokinlex/pmd:latest --push .`
- `docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t jokinlex/pmd:7.0.0-rc4 --push .`
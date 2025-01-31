# Docker Commands Cheat Sheet

## Basic Concepts

### What is Docker?
Docker is an open-source platform that enables developers to automate the deployment of applications inside lightweight, portable containers. It provides an efficient way to package applications along with their dependencies, ensuring consistency across different environments.

### Container
A container is a lightweight, standalone, and executable software package that includes everything needed to run an application, such as code, runtime, system tools, libraries, and dependencies.

### Image
An image is a read-only template containing the application and its dependencies. Containers are created from images, and multiple containers can be based on the same image.

### Dockerfile
A Dockerfile is a script that contains a set of instructions to automate the creation of Docker images. It defines the base image, dependencies, environment variables, and commands needed to run the application.

### Docker Compose
Docker Compose is a tool used to define and manage multi-container Docker applications. It uses a YAML configuration file (`docker-compose.yml`) to specify services, networks, and volumes required for an application.

### Volume
A volume is a mechanism to persist data generated by and used by Docker containers. Unlike bind mounts, volumes are managed by Docker and can be shared among multiple containers.

### Network
Docker networks enable communication between containers. Docker provides different network types such as bridge, host, and overlay networks, allowing containers to interact securely and efficiently.

## Basic Container Management

```bash
docker start <container_name>    # Start a stopped container
docker stop <container_name>     # Stop a running container
docker restart <container_name>  # Restart a container
docker rm <container_name>       # Remove a container
docker ps                       # List running containers
docker ps -a                    # List all containers (including stopped ones)
docker container ls              # Alternative to 'docker ps'
```

## Image Management

```bash
docker images                   # List all images
docker image ls                 # Alternative to 'docker images'
docker rmi <image_id>           # Remove an image
docker build -t my-node-app .   # Build an image from a Dockerfile
docker pull <image_name>        # Download an image from Docker Hub
docker push <image_name>        # Upload an image to Docker Hub
docker tag <image_id> <repo>:<tag>  # Tag an image for pushing
```

## Running Containers

```bash
docker run -it <image_name>      # Run a container interactively
docker run -it -p <exposing_port:internal_port> <image_name>  # Port mapping
docker run -it -p 8000:8000 docker-app-1  # Example of port mapping
docker run -it -p <exposing_port:internal_port> -e <key=value> -e <key=value> <image_name>  # Pass environment variables
docker run --name <container_name> -d <image_name>  # Run container in detached mode (background)
docker run --rm <image_name>  # Remove container after it stops
```

## Executing Commands Inside a Container

```bash
docker exec -it <container_name> <command>  # Execute a command inside a running container
docker exec -it <container_name> bash       # Open an interactive Bash shell
docker attach <container_name>              # Attach to a running container
docker logs <container_name>                # View logs of a running container
docker logs -f <container_name>             # Follow logs in real time
```

## Networking

```bash
docker network ls                           # List all networks
docker network create <network_name>        # Create a custom network
docker network inspect <network_name>       # Inspect a network
docker network connect <network_name> <container_name>  # Connect a container to a network
docker network disconnect <network_name> <container_name>  # Disconnect a container from a network
docker network rm <network_name>            # Remove a network
```

## Volume Management

```bash
docker volume ls                            # List all volumes
docker volume create <volume_name>          # Create a volume
docker volume inspect <volume_name>         # Inspect volume details
docker volume rm <volume_name>              # Remove a volume
docker run -v <volume_name>:<container_path> <image_name>  # Mount a volume to a container
```

## Docker Compose

```bash
docker-compose up                           # Start containers
docker-compose up -d                        # Start in detached mode
docker-compose down                         # Stop and remove containers
docker-compose up --build                   # Rebuild and restart containers
docker-compose logs                         # View logs from all services
docker-compose ps                           # List running containers
docker-compose exec <service_name> <command>  # Run command in a running service container
```

## Cleanup Unused Resources

```bash
docker system prune                         # Remove unused containers, networks, and images
docker system prune -a                      # Remove all unused images, containers, and networks
docker container prune                      # Remove all stopped containers
docker volume prune                         # Remove all unused volumes
docker network prune                        # Remove all unused networks
```

## Dockerfile Commands (For Custom Images)

```dockerfile
FROM <base_image>          # Define the base image
WORKDIR /app               # Set the working directory
COPY . .                   # Copy all files to the container
RUN npm install            # Run a command during the build process
CMD ["node", "index.js"]   # Default command to run when container starts
EXPOSE 8000                # Expose a port for the container
ENV PORT=8000              # Set environment variables
```

## Conclusion
This cheat sheet covers essential Docker concepts and commands for managing containers, images, networks, volumes, and Docker Compose. Keep it handy for quick reference while working with Docker!


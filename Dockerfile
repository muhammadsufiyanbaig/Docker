# Use a specific version of Ubuntu as the base image
FROM ubuntu:22.04

# Update package index, install curl, and Node.js
RUN apt-get update && apt-get install -y \
    curl \
    && curl -sL https://deb.nodesource.com/setup_21.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy necessary files to the root of the container
COPY package.json /package.json
COPY package-lock.json /package-lock.json
COPY index.js /index.js

# Install dependencies
RUN npm install

# Start the application
ENTRYPOINT ["node", "index.js"]

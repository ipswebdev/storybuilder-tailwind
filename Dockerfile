# FROM node:16.3.0-alpine

# WORKDIR /app

# # Copy package.json and package-lock.json to install dependencies
# COPY package*.json ./
# COPY tailwind.config.js ./
# COPY tsconfig.json ./

# # Install dependencies
# RUN npm install

# # Copy the entire project to the container
# COPY . .
# #RUN mkdir ./.storybook
# COPY /.storybook ./.storybook

# #build-storybook
# #CMD [ "npm", "run", "build-storybook" ]
# RUN npm run build-storybook

# # WORKDIR /app

# # Copy the static Storybook build files into the container
# # COPY /storybook-static ./

# # COPY ./storybook-static ./




# # Use a base image with Python to serve static files
# FROM python:latest

# # Set the working directory in the container
# WORKDIR /app

# COPY . .
# # Copy the static Storybook build files into the container
# #COPY /storybook-static ./
# WORKDIR /storybook-static
# # Expose port 8080 for serving the Storybook
#  EXPOSE 3000

# # Use Python to serve the static files on port 8080
# CMD ["python", "-m", "http.server", "3000"]

# # CMD [ "npm", "run", "start" ]

# Stage 1: Build the Storybook app
FROM node:16.3.0-alpine AS builder

WORKDIR /app

COPY package*.json ./
COPY tailwind.config.js ./
COPY tsconfig.json ./
COPY .storybook ./.storybook

RUN npm install
COPY . .
RUN npm run build-storybook

# Stage 2: Serve the static Storybook files
FROM python:latest

WORKDIR /app

COPY --from=builder /app/storybook-static /app/storybook-static

WORKDIR /app/storybook-static

EXPOSE 3000

CMD ["python", "-m", "http.server", "3000"]
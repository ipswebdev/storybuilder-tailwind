FROM node:16.3.0-alpine

WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./
COPY tailwind.config.js ./
COPY tsconfig.json ./

# Install dependencies
RUN npm install

# Copy the entire project to the container
COPY . .
#RUN mkdir ./.storybook
COPY /.storybook ./.storybook

#build-storybook
CMD [ "npm", "run", "build-storybook" ]

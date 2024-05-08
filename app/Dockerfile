# Use an official Node runtime as the base image
FROM node:alpine3.18


RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

# Set the working directory in the container to /app
WORKDIR /home/node/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install the dependencies
RUN yarn install

# Copy the rest of the application code to the working directory
COPY --chown=node:node . .

# Make the container expose the application on port 3000
EXPOSE 8080

# Start the application
CMD ["yarn", "start"]
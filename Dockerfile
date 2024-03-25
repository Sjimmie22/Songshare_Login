# Use an official Node.js runtime as a base image
FROM node:16
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install --legacy-peer-deps

# Copy the rest of the application code to the working directory
COPY . .

# Expose the port on which the app will run
EXPOSE 4200

# Start the Vue.js application
CMD ["npm", "run", "serve"]
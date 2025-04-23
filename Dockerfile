# Use Node.js base image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy rest of the app
COPY . .

# Rebuild native dependencies like better-sqlite3
RUN npm rebuild better-sqlite3

# Build the app
RUN npm run build

# Expose port used by Strapi
EXPOSE 1337

# Start Strapi app
CMD ["npm", "start"]

FROM node:18

# Create app directory
WORKDIR /backend

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy rest of the application code
COPY . .

# Create a non-root user and switch to it
RUN useradd --create-home appuser
USER appuser

# Expose the port
EXPOSE 3000

# Run the app
CMD ["node", "src/index.js"]

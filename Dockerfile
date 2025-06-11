# Use Node 20 as base image
FROM node:20

# Set working directory
WORKDIR /app

# Copy only what's needed
COPY . .

# Install pnpm
RUN npm install -g pnpm

# Install dependencies
RUN pnpm install

# Build the builder app
RUN pnpm --filter @webstudio-is/builder build

# Expose port (default for Vite)
EXPOSE 5173

# Start builder in preview mode
CMD ["pnpm", "--filter", "@webstudio-is/builder", "preview", "--", "--host", "0.0.0.0"]

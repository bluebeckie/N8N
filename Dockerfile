# Use the latest stable Node.js LTS version (Node 24 Slim - Active LTS)
FROM node:24-slim

# Install system dependencies required by Playwright.
# These packages are essential for running headless browsers (Chromium, Firefox, WebKit).
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    # Playwright Browser Dependencies (Debian 12/Bookworm based list)
    libgconf-2-4 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libgdk-pixbuf2.0-0 \
    libgtk-3-0 \
    libgbm-dev \
    libnss3 \
    libxss1 \
    libasound2 \
    libxrandr2 \
    libpangocairo-1.0-0 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxi6 \
    libxtst6 \
    fonts-liberation \
    # Utility for cleanup
    wget \
    # Clean up APT lists to keep the image size down
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install n8n globally, and install the 'playwright' package globally.
# Installing playwright here ensures that the necessary browser binaries are
# downloaded during the image build process, making the container ready to go.
# We also install 'canvas' as it's often a useful dependency for graphic operations
# in custom code nodes.
RUN npm install -g n8n@latest playwright canvas

# Create a working directory for n8n configuration and data
WORKDIR /home/node/n8n_data

# Switch to the 'node' user for security best practices
USER node

# Expose the default n8n port
EXPOSE 5678

# Command to run n8n.
# Since playwright is installed and configured, it will be immediately usable
# within any n8n Code node or relevant custom node.
CMD ["n8n", "start"]

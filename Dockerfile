FROM python:3.12-slim

# Prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install required system packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    gcc \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements first (better Docker caching)
COPY requirements.txt .

# Upgrade pip and install dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy rest of project files
COPY . .

# Give permission to start script
RUN chmod +x start.sh

# Start bot
CMD ["bash", "start.sh"]

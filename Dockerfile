FROM python:3.12-slim

# Update system and install git
RUN apt update && apt install -y git

# Set working directory
WORKDIR /app

# Copy project files
COPY . /app

# Upgrade pip and install requirements
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Give permission to start script
RUN chmod +x start.sh

# Start the bot
CMD ["bash", "start.sh"]

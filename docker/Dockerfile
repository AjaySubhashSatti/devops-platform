FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy application code
COPY ../app /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Environment variable
ENV ENV=dev

# Expose port
EXPOSE 5000

# Start application
CMD ["python", "app.py"]
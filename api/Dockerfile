FROM python:3.11-slim

# Set working directory
WORKDIR /usr/src/app

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install dependencies
COPY src/requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy source code
COPY ./src ./src

# Expose API port
EXPOSE 8000

# Run the FastAPI engine
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8000"]

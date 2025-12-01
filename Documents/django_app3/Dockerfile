# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Create a non-root user
RUN addgroup --system app && adduser --system --group app

# Set the working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy the project code
COPY . .

# Collect static files
RUN python manage.py collectstatic --noinput

# Set the owner of the app directory
RUN chown -R app:app /app

# Switch to the non-root user
USER app

# Run the application
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "portfolio.wsgi:application"]

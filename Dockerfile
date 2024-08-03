# Use the official Python image as the base image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file first for better caching
COPY requirements.txt /app/

# Update pip and install the application dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy the rest of the application files into the working directory
COPY . /app

# Expose the port on which the Flask app will run
EXPOSE 5000

# Define the entry point for the container
CMD ["flask", "run", "--host=0.0.0.0"]

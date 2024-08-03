# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Install necessary system packages (e.g., git for cloning the repo)
RUN apt-get update && apt-get install -y git

# Clone the repository from GitHub
RUN git clone https://github.com/Amomin0512/Number-to-Name.git .

# Remove git to reduce image size after cloning
RUN apt-get remove -y git && apt-get autoremove -y

# Install application dependencies
# Assuming `requirements.txt` exists in the repository
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 5000 to the outside world
EXPOSE 5000

# Define environment variable for Flask
ENV FLASK_APP=app.py

# Use a shell to run the Flask application and keep the container alive for debugging
CMD ["flask", "run", "--host=0.0.0.0"]

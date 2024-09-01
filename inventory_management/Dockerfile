# Your Solution# Dockerfile for inventory_management microservice

# Uses official Python image as container base
FROM --platform=linux/amd64 python:3.9.19-slim

# Set the /inventory_management/app folder as the working directory
WORKDIR /inventory_management/app

# Copy the requirements file to the /inventory_management folder
COPY ./requirements.txt /inventory_management/

# Install the Python dependencies
RUN pip install -r /inventory_management/requirements.txt

# Copy everything from the app folder into the working directory
COPY ./app /inventory_management/app

# Expose the port on which the application will run
EXPOSE 4002

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "4002"]
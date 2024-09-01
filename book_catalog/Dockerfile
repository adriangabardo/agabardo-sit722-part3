# Your Solution# Dockerfile for book_catalog microservice

# Uses official Python image as container base
FROM --platform=linux/amd64 python:3.9.19-slim

# Set the /book_catalog/app folder as the working directory
WORKDIR /book_catalog/app

# Copy the requirements file to the /book_catalog folder
COPY ./requirements.txt /book_catalog/

# Install the Python dependencies
RUN pip install -r /book_catalog/requirements.txt

# Copy everything from the app folder into the working directory
COPY ./app /book_catalog/app

# Expose the port on which the application will run
EXPOSE 4001

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "4001"]
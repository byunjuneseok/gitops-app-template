FROM python:3.10.1-slim-buster

# Install gcc.
RUN apt-get update \
&& apt-get install libpq-dev gcc -y \
&& apt-get clean

# Set working directory.
WORKDIR /src

# Installing dependencies.
COPY requirements.txt .
RUN pip3 install -r requirements.txt

# Copy `app/`
ADD ./src ./app

WORKDIR /src/app
ENTRYPOINT ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "3000"]

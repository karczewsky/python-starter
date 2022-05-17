FROM python:3

WORKDIR /usr/src/app

# update alpine
RUN apt-get update && apt-get upgrade -y

# setup python
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# copy whole app
COPY . .

CMD [ "uvicorn", "src.app:app",  "--host", "0.0.0.0", "--port", "8080"] 

EXPOSE 8080

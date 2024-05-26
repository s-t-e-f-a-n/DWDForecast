FROM mariadb:latest AS marithon

ADD ./docker_init/setup.sql  /docker-entrypoint-initdb.d/

ENV MYSQL_ROOT_PASSWORD root
ENV MYSQL_DATABASE DWDForecast
ENV MYSQL_USER dwd
ENV MYSQL_PASSWORD dwd

EXPOSE 3306

RUN apt-get update && apt-get -y install \ 
       vim python3 python3-pip telnet \
    && ln -s /usr/bin/python3 /usr/bin/python

COPY --chown=root:root docker_entrypoint.sh /
RUN chmod +x docker_entrypoint.sh

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Set timezone
ENV TZ="Europe/Berlin"

# Install pip requirements
COPY ./requirements.txt .
RUN pip3 install -r ./docker_init/requirements.txt

WORKDIR /app
COPY ./app/. /app

ENTRYPOINT ["/docker_entrypoint.sh"]

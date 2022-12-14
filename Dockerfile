# syntax=docker/dockerfile:1
FROM python:3.9
ENV MICRO_SERVICE=/home/app/african_microbiome_portal
ENV APP_USER=anmol
RUN adduser $APP_USER

RUN rm -rf $MICRO_SERVICE
COPY african_microbiome_portal /home/app/african_microbiome_portal
# RUN git clone https://github.com/codemeleon/african_microbiome_portal.git $MICRO_SERVICE
# RUN git clone https://github.com/codemeleon/sampleDjangoApp.git $MICRO_SERVICE
# TODO: Next line it not required if above commend works
# RUN mkdir -p $MICRO_SERVICE
# TODO: Add an static folder in the prject to avoid next line
WORKDIR $MICRO_SERVICE
# RUN git checkout beta
# RUN git pull
RUN rm -rf static
COPY .env ./Database/
#RUN mkdir -p $MICRO_SERVICE/static

# where the code lives
# RUN git pull

# set environment variables

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1


# install psycopg2 dependencies

RUN apt-get update
RUN apt-get install build-essential -y
RUN apt-get install cron -y
RUN apt-get install gdal-bin -y
#     && apt-get upgrade -y \
#     && apt-get install build-deps gcc python3-dev musl-dev \
#     && apt-get install sqlite3 gcc python3-dev musl-dev \
#     && apt-get remove build-deps \
#     && apt-get install musl-dev linux-headers g++

# install dependencies
RUN pip install --upgrade pip
# TODO: Remove bleow line as considering clonning works
# COPY . ${MICRO_SERVICE}


RUN pip install -r requirements.txt
# RUN python manage.py migrate --fake MicroBiome
# https://pypi.org/project/django-crontab/
RUN python manage.py crontab add
#RUN rm -r MicroBiome/__pycache__
RUN rm -r MicroBiome/migrations
#RUN rm db.sqlite3
RUN python manage.py makemigrations MicroBiome
RUN python manage.py migrate
RUN python manage.py collectstatic -c --noinput
#RUN python manage.py su
#RUN bash clean.sh


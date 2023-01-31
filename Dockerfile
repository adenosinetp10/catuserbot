FROM ubuntu:latest

ENV PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

WORKDIR /app

RUN apt update && apt upgrade -y

RUN apt install --no-install-recommends -y curl git libffi-dev libjpeg-dev libwebp-dev python3-lxml python3-psycopg2 libpq-dev libcurl4-openssl-dev libxml2-dev libxslt1-dev python3-pip python3-sqlalchemy openssl wget python3 python3-dev libreadline-dev libyaml-dev gcc zlib1g ffmpeg libssl-dev libgconf-2-4 libxi6 unzip libopus0 libopus-dev python3-venv libmagickwand-dev pv tree mediainfo nano nodejs

COPY requirements.txt requirements.txt

COPY sample_config.py config.py

RUN pip3 install git+https://github.com/jisan09/Telethon

RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python3", "-m", "userbot"]
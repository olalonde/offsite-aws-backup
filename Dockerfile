FROM ubuntu:latest
MAINTAINER olalonde@gmail.com
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y wget python-setuptools \
  && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
  && echo 'deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main' > /etc/apt/sources.list.d/pgdg.list \
  && apt-get update \
  && apt-get install -y  postgresql-client-9.4 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN wget -O get-pip.py https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN pip install awscli
ADD rootfs /
RUN chmod 600 /etc/crontab
CMD /bin/start-cron.sh

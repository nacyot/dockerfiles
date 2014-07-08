# This Dockerfile based on dockerana/dockerana
FROM dockerfile/ubuntu
MAINTAINER Daekwon Kim <propellerheaven@gmail.com>

RUN apt-get -y update
RUN apt-get -y install git python-django python-django-tagging python-simplejson \ 
                           python-memcache python-ldap python-cairo \
                           python-twisted python-pysqlite2 python-support \
                           python-pip

RUN chmod +x /usr/lib/python2.7/dist-packages/django/bin/django-admin.py
RUN ln -s /usr/lib/python2.7/dist-packages/django/bin/django-admin.py /usr/local/bin/django-admin.py

WORKDIR /usr/local/src

RUN git clone https://github.com/graphite-project/whisper.git
RUN cd whisper && git checkout master && python setup.py install
RUN git clone https://github.com/graphite-project/graphite-web.git
RUN cd graphite-web && python check-dependencies.py; python setup.py install

RUN apt-get -y install gunicorn
RUN mkdir -p /opt/graphite/webapp
RUN mkdir -p /var/log/graphite
RUN cd /var/log/graphite/ && touch info.log

RUN pip install pytz pyparsing

ENV GRAPHITE_STORAGE_DIR /opt/graphite/storage
ENV GRAPHITE_CONF_DIR /opt/graphite/conf
ENV PYTHONPATH /opt/graphite/webapp
ENV LOG_DIR /var/log/graphite

ENV DEFAULT_INDEX_TABLESPACE graphite
ENV SECRET_KEY hello-graphite-2014-07-04

RUN mkdir -p /opt/graphite/storage/whisper
RUN touch /opt/graphite/storage/graphite.db /opt/graphite/storage/index
RUN chown -R www-data /opt/graphite/storage
RUN chmod 0775 /opt/graphite/storage /opt/graphite/storage/whisper
RUN chmod 0664 /opt/graphite/storage/graphite.db

RUN mkdir -p /var/log/graphite
RUN cd /var/log/graphite/ && touch info.log

ADD ./config/local_settings.py /opt/graphite/webapp/graphite/local_settings.py 
ADD ./config/initial_data.json /opt/graphite/webapp/graphite/initial_data.json

RUN cd /opt/graphite/webapp/graphite && django-admin.py syncdb --settings=graphite.settings --noinput
RUN cd /opt/graphite/webapp/graphite && django-admin.py loaddata --settings=graphite.settings initial_data.json

WORKDIR /opt/graphite/webapp
EXPOSE 8000

CMD ["/usr/bin/gunicorn_django", "-b0.0.0.0:8000", "-w2", "graphite/settings.py"]

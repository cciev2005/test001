#
# Mezzanine example of a Dockerfile
#
FROM centos:latest
MAINTAINER Nobody "nobody@foobar.com"

RUN yum -y update; yum clean all; \
yum -y install epel-release; yum clean all; \
yum install -y python-pip ; \
export LC_ALL="en_US.UTF-8" ; \
pip install --upgrade pip ; \
pip install mezzanine ; \
mkdir /opt/mezzanine ; \
cd /opt/mezzanine ; \
adduser mezzanine ; \
mezzanine-project myfirstsite ; \
cd myfirstsite ; \
python manage.py createdb --noinput ;\
chown -R mezzanine.mezzanine /opt/mezzanine

EXPOSE 8000

USER mezzanine
WORKDIR /opt/mezzanine/myfirstsite
CMD python manage.py runserver 0.0.0.0:8000

FROM jupyter/scipy-notebook

# insist on root user by default
USER root

# linux updates and installs
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get update
RUN apt-get install -y vim
RUN apt-get install -y curl
RUN apt-get update
#RUN apt-get install -y python3.8
RUN apt-get install -y python3-pip
RUN apt-get update
#RUN apt-get install -y python-dev default-libmysqlclient-dev
#RUN apt-get install -y python3-dev
#RUN apt-get install -y jq
#RUN apt-get install -y zip
#RUN apt-get install -y unzip
RUN apt-get install -y sqlite3

# python installs
RUN pip3 install requests
RUN pip3 install sqlalchemy
RUN pip3 install elasticsearch
RUN pip3 install pymongo
RUN pip3 install beautifulsoup4
RUN pip3 install seaborn
RUN pip3 install lxml
RUN pip3 install apscheduler

# node installs
RUN npm install -g npm@8.16.0
RUN npm install -g ijavascript
RUN ijsinstall --install=global

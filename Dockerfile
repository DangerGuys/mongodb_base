FROM centos_base:latest
MAINTAINER DangerGuy "13331432720@163.com"
LABEL version="1.0.0" 

WORKDIR /usr/src/
#RUN smbclient -c "get mongodb-linux-x86_64-4.0.4.tgz" //172.17.224.54/share -U nobody%
RUN smbclient -c "get mongodb-linux-x86_64-4.0.4.tgz" //i.iandun.com/share -U nobody%
RUN tar xf mongodb-linux-x86_64-4.0.4.tgz -C /usr/local/

WORKDIR /usr/local/
RUN mv mongodb-linux-x86_64-4.0.4 mongodb

ENV MONGODB_HOME /usr/local/mongodb
ENV PATH $MONGODB_HOME/bin:$PATH

RUN mkdir $MONGODB_HOME/data
RUN mkdir $MONGODB_HOME/logs

ENV MONGODB_LOG_PATH MONGODB_HOME/logs
ENV MONGODB_DATA_PATH MONGODB_HOME/data

VOLUME [ "$MONGODB_LOG_PATH", "$MONGODB_DATA_PATH" ]

expose 27017

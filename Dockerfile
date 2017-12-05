FROM ubuntu:14.04
MAINTAINER wertherzhang <werther0331@gmail.com>

RUN apt-get update

RUN apt-get -y install openjdk-7-jdk openjdk-7-jre
RUN apt-get -y install python

RUN mkdir -p /root/chkbugreport
RUN apt-get -y install wget
RUN wget http://10.27.8.54/chkbugreport.tgz -O /root/chkbugreport.tgz
RUN tar xvf /root/chkbugreport.tgz -C /tmp/
RUN mkdir -p /root/bin

ADD server.py /root/chkbugreport/
ADD chkbugreport.jar /root/bin/
ADD chkbugreport /usr/local/bin/
ADD ddmlib.jar /root/bin/

RUN apt-get clean

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
WORKDIR /root/chkbugreport/

CMD ["python", "server.py"]





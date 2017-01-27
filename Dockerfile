FROM ubuntu:14.04
MAINTAINER manishAWSDocker

RUN apt-get update && apt-get install -y python-software-properties software-properties-common
RUN add-apt-repository ppa:webupd8team/java

RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 boolean true" | debconf-set-selections

RUN apt-get update && apt-get install -y oracle-java8-installer maven

ADD . /home/ec2-user/HelloWorld
RUN cd /home/ec2-user/HelloWorld && mvn install
CMD ["java", "-cp", "/home/ec2-user/HelloWorld/target/HelloWorld-0.0.1-SNAPSHOT.jar", "HelloWorldMain"]
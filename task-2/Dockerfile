FROM hordiy/springboot-git:v2.0

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y wget

VOLUME /my_volume/

RUN mkdir /opt/tomcat && \
    cd /opt/tomcat && \
    wget https://apache.paket.ua/tomcat/tomcat-9/v9.0.38/bin/apache-tomcat-9.0.38.tar.gz && \
    tar xvzf apache-tomcat-9.0.38.tar.gz

WORKDIR /opt/tomcat/
COPY build_deploy.sh /opt/tomcat/build_deploy.sh

EXPOSE 8080
ENTRYPOINT ["bash", "build_deploy.sh"]
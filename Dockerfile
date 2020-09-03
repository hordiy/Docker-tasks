FROM maven:3.6.0-jdk-8-slim

RUN apt-get update && apt-get upgrade -y && apt-get install -y git

ARG SSH_KEY
ARG HOST

RUN mkdir -p /root/.ssh/ && \
    echo "$SSH_KEY" > /root/.ssh/id_rsa && \
    chmod -R 600 /root/.ssh/ && \
    ssh-keyscan -t rsa "$HOST" >> ~/.ssh/known_hosts

COPY script.sh /home/app/script.sh
RUN chmod +x /home/app/script.sh
WORKDIR /home/app/

EXPOSE 8080
ENTRYPOINT ["bash", "/home/app/script.sh"]
FROM python:3.8-buster

RUN apt-get update \
    && apt-get install -y git \
    && echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
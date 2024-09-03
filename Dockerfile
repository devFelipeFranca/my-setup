FROM ubuntu:latest

RUN apt update && apt install -y \
    openssh-server \
    && apt-get clean

RUN mkdir /var/run/sshd

RUN echo 'root:password' | chpasswd

RUN sed -i 's/^#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

RUN apt update && apt install -y git && apt clean

RUN apt update && apt install -y curl && apt clean

RUN apt update && apt install -y wget && apt clean

RUN apt update && apt install -y net-tools && apt clean

RUN apt update && apt install -y htop && apt clean

RUN apt update && apt install -y build-essential && apt clean

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

RUN apt update
RUN apt install -y python3-pip

COPY ./config-files/.ssh /root/.ssh
COPY ./config-files/nvim/init.vim ./root/
COPY ./config-files/initial-configs.sh ./root/
COPY ./config-files/terminal-configs.sh ./root/

RUN chmod +x ./root/initial-configs.sh
RUN chmod +x ./root/terminal-configs.sh

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]


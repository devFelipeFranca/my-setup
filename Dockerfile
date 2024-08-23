FROM ubuntu:latest

RUN apt update && apt install -y \
    openssh-server \
    && apt-get clean

RUN mkdir /var/run/sshd

RUN echo 'root:felpqwe' | chpasswd

RUN sed -i 's/^#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

RUN apt update && apt install -y zsh && apt clean

RUN chsh -s $(which zsh) root

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]


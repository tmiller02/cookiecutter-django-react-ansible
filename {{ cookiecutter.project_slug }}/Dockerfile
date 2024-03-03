FROM ubuntu:22.04
ARG DEVELOPER_UID=1000
ARG DEVELOPER_GID=1000
RUN apt-get update \
    && apt-get install -y \
    systemd \
    systemd-sysv \
    openssh-server \
    sudo \
    whois \
    iputils-ping \
    sshpass
RUN groupadd --gid $DEVELOPER_GID developer
RUN useradd --uid $DEVELOPER_UID --gid $DEVELOPER_GID --create-home --password $(mkpasswd -m sha-512 developer) -s /bin/bash developer
RUN usermod -aG sudo developer
RUN sed -i 's/UsePAM yes/UsePAM no/' /etc/ssh/sshd_config
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
EXPOSE 22
CMD [ "systemd" ]